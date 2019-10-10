const Operation = require('src/app/Operation');
const joi = require('joi');
const moment = require('moment');

class GetStudentReport extends Operation {
  constructor({ studentCoursesRepository, CourseModel,
    StudentModel, StudentYearModel }) {
    super();
    this.studentCoursesRepository = studentCoursesRepository,
      this.CourseModel = CourseModel,
      this.StudentModel = StudentModel,
      this.Op = require('sequelize').Op,
      this.StudentYearModel = StudentYearModel,
      this.validationSchema = joi.object().keys({
        student_id: joi.array().required(),
        start_date: joi.date().iso().optional(),
        end_date: joi.date().iso().optional()
      });
  }

  async execute({ body, user }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;
        throw error;
      }

      let studentCourseData = await this.studentCoursesRepository._getAllByArgs({
        include: [{
          model: this.CourseModel
        }, {
          model: this.StudentModel,
        }, {
          model: this.StudentYearModel
        }],
        where: {
          student_id: body.student_id,
          updated_at: {
            [this.Op.between]: [moment(body.start_date), moment(body.end_date)]
          }
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

GetStudentReport.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetStudentReport;
