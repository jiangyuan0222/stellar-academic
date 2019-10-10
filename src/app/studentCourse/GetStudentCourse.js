const Operation = require('src/app/Operation');
const joi = require('joi');

class GetStudentCourse extends Operation {
  constructor({ studentCoursesRepository }) {
    super();
    this.studentCoursesRepository = studentCoursesRepository,
      this.validationSchema = joi.object().keys({
        student_id: joi.string().required()
      });
  }

  async execute({ params }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;

    try {

      const obj = joi.validate(params, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let studentCourseData = await this.studentCoursesRepository._getAllByArgs({
        where: {
          student_id: params.student_id
        }
      })

      this.emit(SUCCESS, studentCourseData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetStudentCourse.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetStudentCourse;
