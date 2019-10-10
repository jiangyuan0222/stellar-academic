const Operation = require('src/app/Operation');
const joi = require('joi');
const i18n = require('i18n');

class TransactionSuccess extends Operation {
  constructor({ transactionsRepository, usersRepository, UserModel,
    notificationsRepository, logger, push }) {
    super();
    this.transactionsRepository = transactionsRepository,
      this.usersRepository = usersRepository,
      this.UserModel = UserModel,
      this.logger = logger,
      this.push = push,
      this.notificationsRepository = notificationsRepository,
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
          transactionData = await this.transactionsRepository.add({
            user_id: query.user_id,
            type: query.type,
            subscription_id: query.subscription_id,
            ba_token: query.ba_token,
            token: query.token,
            amount: query.amount,
            status: 'success'
          });

          userData = await this.usersRepository._editByArgs({
            subscription_plan_id: query.subscription_id,
            is_payment_completed: true
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

          this.push(`${notificationData.user_id}`, true, "New Transaction", {
            title: i18n.__("notifications")["newTransaction"].title,
            body: i18n.__("notifications")["newTransaction"].body,
          }, {
              status: "newTransaction"
            });

          this.emit(SUCCESS, "");
          break;
        case 'family':

          transactionData = await this.transactionsRepository.add({
            user_id: query.user_id,
            type: query.type,
            subscription_id: query.subscription_id,
            ba_token: query.ba_token,
            token: query.token,
            amount: query.amount,
            status: 'success'
          });

          userData = await this.usersRepository._editByArgs({
            subscription_plan_id: query.subscription_id,
            is_payment_completed: true
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

          this.push(`${notificationData.user_id}`, true, "New Transaction", {
            title: i18n.__("notifications")["newTransaction"].title,
            body: i18n.__("notifications")["newTransaction"].body,
          }, {
              status: "newTransaction"
            });

          this.emit(SUCCESS, "");
          break;
        default:
          this.logger.error(`Invalid user type : ${userType}`);
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

TransactionSuccess.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST']);

module.exports = TransactionSuccess;