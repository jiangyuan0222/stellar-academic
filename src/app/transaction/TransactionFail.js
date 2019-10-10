const Operation = require('src/app/Operation');
const joi = require('joi');

class TransactionFail extends Operation {
  constructor({ transactionsRepository, usersRepository, UserModel,
    notificationsRepository, logger }) {
    super();
    this.transactionsRepository = transactionsRepository,
      this.usersRepository = usersRepository,
      this.logger = logger,
      this.notificationsRepository = notificationsRepository,
      this.UserModel = UserModel,
      this.schoolAdminValidationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        status: joi.string().valid('success', 'fail').optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ body, query }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = this.outputs;
    let transactionData, userData, notificationData, userType = query.userType;

    try {

      switch (userType) {
        case 'school_admin':
          break;
        case 'family':
          break;
        default:
          this.logger.error(`Invalid user type : ${userType}`);
          break;
      }

      transactionData = await this.transactionsRepository.add({
        user_id: query.user_id,
        type: query.type,
        subscription_id: query.subscription_id,
        ba_token: query.ba_token,
        token: query.token,
        amount: query.amount,
        status: 'fail'
      });

      userData = await this.usersRepository._editByArgs({
        subscription_plan_id: query.subscription_id,
        is_payment_completed: false
      }, {
          where: {
            id: query.user_id
          }
        })

      notificationData = await this.notificationsRepository.add({
        user_id: query.user_id,
        type: 'New Transaction',
        object_id: transactionData.id,
        object_type: 'transaction'
      })

      this.emit(SUCCESS, "");
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

TransactionFail.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST']);

module.exports = TransactionFail;