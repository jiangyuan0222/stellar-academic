const Operation = require('src/app/Operation');
const joi = require('joi');

class GetList extends Operation {
  constructor({ schoolSubscriptionPlansRepository, SchoolSubscriptionPlanModel }) {
    super();
    this.schoolSubscriptionPlansRepository = schoolSubscriptionPlansRepository,
      this.SchoolSubscriptionPlanModel = SchoolSubscriptionPlanModel;;
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let query_obj, obj, subscriptionPlanList,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC';

    try {

      // obj = joi.validate(body, this.validationSchema);

      // if (obj.error) {
      //   const error = new Error('ValidationError');
      //   error.details = obj.error.details[0].message;

      //   throw error;
      // }

      subscriptionPlanList = await this.schoolSubscriptionPlansRepository._getAllByArgs();

      this.emit(SUCCESS, subscriptionPlanList);

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

GetList.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetList;
