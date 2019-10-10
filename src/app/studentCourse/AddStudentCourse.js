const Operation = require('src/app/Operation');
const joi = require('joi');

class AddStudentCourse extends Operation {
  constructor({ studentCoursesRepository, studentYearsRepository, studentsRepository,
    coursesRepository }) {
    super();
    this.studentCoursesRepository = studentCoursesRepository,
      this.studentsRepository = studentsRepository,
      this.studentYearsRepository = studentYearsRepository,
      this.coursesRepository = coursesRepository,
      this.validationSchema = joi.object().keys({
        student_id: joi.string().required(),
        student_year_id: joi.string().required(),
        course_id: joi.string().required(),
        semester: joi.string().optional(),
        grade: joi.string().valid(
          'A+', 'A', 'A-',
          'B+', 'B', 'B-',
          'C+', 'C', 'C-',
          'D+', 'D', 'D-',
          'E', 'P', 'S', 'N',
          'F', 'IP'
        ).optional(),
        resource: joi.string().optional(),
        course_type: joi.string().required(),
        credit: joi.string().optional()
      });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST, STUDENT_YEAR_NOT_EXIST,
      STUDENT_COURSE_EXIST, COURSE_NOT_EXIST } = this.outputs;

    try {

      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let isStudent = await this.studentsRepository._getByArgs({
        where: {
          id: body.student_id
        }
      })

      if (!isStudent) {
        const error = new Error(STUDENT_NOT_EXIST);
        throw error;
      }

      let isStudentYear = await this.studentYearsRepository._getByArgs({
        where: {
          id: body.student_year_id
        }
      })

      if (!isStudentYear) {
        const error = new Error(STUDENT_YEAR_NOT_EXIST);
        throw error;
      }

      let isCourse = await this.coursesRepository._getByArgs({
        where: {
          id: body.course_id
        }
      })

      if (!isCourse) {
        const error = new Error(COURSE_NOT_EXIST);
        throw error;
      }

      let isStudentCourse = await this.studentCoursesRepository._getByArgs({
        where: {
          student_id: body.student_id,
          student_year_id: body.student_year_id,
          course_id: body.course_id
        }
      })

      if (isStudentCourse) {
        const error = new Error(STUDENT_COURSE_EXIST);
        throw error;
      }

      let StudentCourseData = await this.studentCoursesRepository.add({
        ...body
      })

      this.emit(SUCCESS, StudentCourseData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'STUDENT_NOT_EXIST':
          return this.emit(STUDENT_NOT_EXIST, error);
        case 'STUDENT_YEAR_NOT_EXIST':
          return this.emit(STUDENT_YEAR_NOT_EXIST, error);
        case 'STUDENT_COURSE_EXIST':
          return this.emit(STUDENT_COURSE_EXIST, error);
        case 'COURSE_NOT_EXIST':
          return this.emit(COURSE_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

AddStudentCourse.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR',
  'STUDENT_NOT_EXIST', 'STUDENT_YEAR_NOT_EXIST',
  'STUDENT_COURSE_EXIST', 'COURSE_NOT_EXIST']);

module.exports = AddStudentCourse;
