const Operation = require('src/app/Operation');
const joi = require('joi');
const moment = require('moment');

class GetStudentAwardReport extends Operation {
  constructor({ studentAwardsRepository }) {
    super();
    this.studentAwardsRepository = studentAwardsRepository,
      this.Op = require('sequelize').Op,
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

      let studentAwardData = await this.studentAwardsRepository._getAllByArgs({
        where: {
          student_id: {
            [this.Op.in]: body.student_id
          },
          created_at: {
            [this.Op.between]: [moment(body.start_date), moment(body.end_date)]
          }
        }
      })

      this.emit(SUCCESS, studentAwardData);
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

GetStudentAwardReport.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetStudentAwardReport;
