const Operation = require('src/app/Operation');
const joi = require('joi');

class GetTransaction extends Operation {
  constructor({ transactionsRepository, usersRepository, UserModel }) {
    super();
    this.transactionsRepository = transactionsRepository,
      this.usersRepository = usersRepository,
      this.UserModel = UserModel,
      this.schoolAdminValidationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        status: joi.string().valid('success', 'failed').optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = this.outputs;
    let userType = auth.strategy;

    try {

      let obj, transactionData, userData, query_obj,
        orderBy = body.orderBy || 'created_at',
        orderType = body.orderType || 'DESC';;

      switch (userType) {
        case 'super_admin':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          query_obj = {
            include: [{
              model: this.UserModel,
              attributes: ['first_name', 'last_name'],
              required: true,
              as: 'user',
              where: {
                user_type: 'school_admin'
              }
            }],
            order: [
              [orderBy, orderType]
            ]
          }

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.status) {
            query_obj.where.status = body.status;
          }

          transactionData = await this.transactionsRepository._getAllByArgs(query_obj);

          this.emit(SUCCESS, transactionData);
          break;
        case 'family':

          break;
        case 'school_admin':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

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
          }

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.status) {
            query_obj.where.status = body.status;
          }

          transactionData = await this.transactionsRepository._getAllByArgs(query_obj);

          this.emit(SUCCESS, transactionData);
          break;
        default:
          break;
      }

    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case EXIST:
          return this.emit(EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetTransaction.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST']);

module.exports = GetTransaction;