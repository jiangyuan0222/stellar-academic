const Operation = require('src/app/Operation');
const joi = require('joi');

class CreateTransaction extends Operation {
  constructor({ transactionsRepository, usersRepository, userOrdersRepository,
    notificationsRepository }) {
    super();
    this.transactionsRepository = transactionsRepository,
      this.usersRepository = usersRepository,
      this.userOrdersRepository = userOrdersRepository,
      this.notificationsRepository = notificationsRepository,
      this.schoolAdminValidationSchema = joi.object().keys({
        transaction_id: joi.string().required(),
        type: joi.string().required(),
        plan_name: joi.string().required(),
        plan_type: joi.string().required(),
        amount: joi.number().required(),
        status: joi.string().required()
      }),
      this.familyValidationSchema = joi.object().keys({
        transaction_id: joi.string().required(),
        order_id: joi.string().required(),
        type: joi.string().required(),
        amount: joi.number().required(),
        status: joi.string().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = this.outputs;
    let userType = auth.strategy;

    try {

      let obj, transactionData, userData, userOrderData, notificationData;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          transactionData = await this.transactionsRepository.add({
            transaction_id: body.transaction_id,
            user_id: user.id,
            type: body.type,
            amount: body.amount,
            status: body.status
          })

          userOrderData = await this.userOrdersRepository._editByArgs({
            status: "completed",
            transaction_id: transactionData.id
          }, {
              where: {
                id: body.order_id,
                user_id: user.id
              }
            })

          notificationData = await this.notificationsRepository.add({
            user_id: user.id,
            type: 'New Transaction',
            object_id: transactionData.id,
            object_type: 'transaction'
          })

          this.emit(SUCCESS, transactionData);
          break;
        case 'school_admin':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          transactionData = await this.transactionsRepository.add({
            transaction_id: body.transaction_id,
            user_id: user.id,
            type: body.type,
            plan_name: body.plan_name,
            plan_type: body.plan_type,
            amount: body.amount,
            status: body.status
          })

          userData = await this.usersRepository._editByArgs({
            is_payment_completed: body.status === 'success' ? true : false
          }, {
              where: {
                id: user.id
              }
            })

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

CreateTransaction.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST']);

module.exports = CreateTransaction;