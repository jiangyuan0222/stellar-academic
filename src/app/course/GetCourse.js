const Operation = require('src/app/Operation');
const joi = require('joi');

class GetCourse extends Operation {
  constructor({ coursesRepository }) {
    super();
    this.coursesRepository = coursesRepository,
      this.validationSchema = joi.object().keys({
        type: joi.string().valid('credit',
          'nonCredit').optional(),
        category: joi.string().optional(),
        category_list: joi.boolean().optional()
      });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, COURSE_NOT_EXIST, VALIDATION_ERROR } = this.outputs;

    try {

      let obj = joi.validate(body, this.validationSchema), query_obj;

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      query_obj = {
        where: body
      }

      if (body.category_list) {
        query_obj.group = 'category';
      };
      delete body.category_list;

      let CourseData = await this.coursesRepository._getCustomAll(query_obj)

      this.emit(SUCCESS, CourseData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'COURSE_NOT_EXIST':
          return this.emit(COURSE_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetCourse.setOutputs(['SUCCESS', 'ERROR', 'COURSE_NOT_EXIST', 'VALIDATION_ERROR']);

module.exports = GetCourse;
