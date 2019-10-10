const Operation = require('src/app/Operation');
const joi = require('joi');

class EditStudentCourse extends Operation {
  constructor({ studentCoursesRepository }) {
    super();
    this.studentCoursesRepository = studentCoursesRepository
    this.validationSchema = joi.object().keys({
      semester: joi.string().required(),
      grade: joi.string().valid(
        'A+', 'A', 'A-',
        'B+', 'B', 'B-',
        'C+', 'C', 'C-',
        'D+', 'D', 'D-',
        'E', 'P', 'S', 'N',
        'F', 'IP'
      ).required(),
      resource: joi.string().optional(),
      course_type: joi.string().optional(),
      credit: joi.string().optional()
    });
  }

  async execute({ body, params }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;

    try {

      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let StudentCourseData = await this.studentCoursesRepository._editByArgs({
        ...body
      }, {
          where: {
            id: params.id
          }
        })

      this.emit(SUCCESS, StudentCourseData);
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

EditStudentCourse.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = EditStudentCourse;
