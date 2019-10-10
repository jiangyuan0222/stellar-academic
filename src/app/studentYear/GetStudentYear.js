const Operation = require('src/app/Operation');
const joi = require('joi');

class GetStudentYear extends Operation {
  constructor({ studentYearsRepository, studentsRepository,
    StudentCourseModel, CourseModel, StudentAttendanceModel }) {
    super();
    this.studentYearsRepository = studentYearsRepository,
      this.studentsRepository = studentsRepository,
      this.CourseModel = CourseModel,
      this.StudentAttendanceModel = StudentAttendanceModel,
      this.StudentCourseModel = StudentCourseModel,
      this.validationSchema = joi.object().keys({
        student_id: joi.string().required()
      });
  }

  async execute({ params }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;

    try {

      const obj = joi.validate(params, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let StudentYearData = await this.studentYearsRepository._getAllByArgs({
        include: [{
          model: this.StudentCourseModel,
          as: 'student_courses',
          include: [{
            model: this.CourseModel
          }]
        }, {
          model: this.StudentAttendanceModel,
          as: 'student_attendances'
        }],
        where: {
          student_id: params.student_id
        }
      })

      this.emit(SUCCESS, StudentYearData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'STUDENT_NOT_EXIST':
          return this.emit(STUDENT_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetStudentYear.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = GetStudentYear;
