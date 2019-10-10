const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class GetPreUserRequest extends Operation {
  constructor({ preUserRequestsRepository }) {
    super();
    this.preUserRequestsRepository = preUserRequestsRepository,
      this.validationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        limit: joi.number().min(1).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ user, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let obj,
      query_obj,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC';
    try {

      obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      query_obj = {
        order: [
          [orderBy, orderType]
        ],
        where: {
          user_id: user.id
        }
      };

      if (body.skip) {
        query_obj.offset = body.skip;
      }

      if (body.limit) {
        query_obj.limit = body.limit;
      }

      let preStudentTaskData = await this.preUserRequestsRepository._getAllByArgs(query_obj)

      this.emit(SUCCESS, preStudentTaskData);

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

GetPreUserRequest.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetPreUserRequest;
