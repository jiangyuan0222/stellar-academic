const Operation = require('src/app/Operation');
const joi = require('joi');
const moment = require('moment');

class AddSchool extends Operation {
  constructor({ usersRepository, schoolSubscriptionPlansRepository }) {
    super();
    this.usersRepository = usersRepository,
      this.schoolSubscriptionPlansRepository = schoolSubscriptionPlansRepository,
      this.validationSchema = joi.object().keys({
        username: joi.string().required(),
        first_name: joi.string().required(),
        last_name: joi.string().required(),
        name: joi.string().required(),
        logo: joi.string().optional(),
        password: joi.string().required(),
        subscription_plan_id: joi.string().required(),
        email: joi.string().required(),
        phone: joi.string().required(),
        country_code: joi.string().required(),
        address: joi.string().required(),
        city: joi.string().required(),
        country: joi.string().required(),
        zip_code: joi.number().required()
      });
  }

  generateCode(count) {
    let randomText = "";
    let possible = "0123456789";
    for (var i = 0; i < count; i++)
      randomText += possible.charAt(Math.floor(Math.random() * possible.length));
    return randomText;
  }

  async execute({ body, user }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EMAIL_EXIST, PHONE_EXIST } = this.outputs;

    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      // check for email
      const duplicateEmail = await this.usersRepository._getByEmail(body.email);

      if (duplicateEmail) {
        const error = new Error(EMAIL_EXIST);
        throw error;
      }

      // check for phone
      const duplicatePhone = await this.usersRepository._getByPhone(body.phone);

      if (duplicatePhone) {
        const error = new Error(PHONE_EXIST);
        throw error;
      }

      let subscriptionData = await this.schoolSubscriptionPlansRepository._getByArgs({
        where: {
          id: body.subscription_plan_id
        }
      })

      let subscription_start_date, subscription_end_date;
      switch (subscriptionData.type) {
        case 'monthly':
          subscription_start_date = moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY");
          subscription_end_date = moment(`${new Date().getMonth(2) + 2}-${moment(
            moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY")
          ).endOf('month')}-${moment().year()}`, "MM/DD/YYYY");
          break;
        case 'yearly':
          subscription_start_date = moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY");
          subscription_end_date = moment(`07-31-${(moment().year()) + 1}`, "MM/DD/YYYY");
          break;
        default:
          break;
      }

      let familyData = await this.usersRepository.add({
        ...body,
        username: body.username,
        subscription_start_date,
        subscription_end_date,
        // username: `${body.name}${this.generateCode(5)}`,
        user_type: 'school_admin'
      })

      this.emit(SUCCESS, familyData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          this.emit(VALIDATION_ERROR, error);
          break;
        case EMAIL_EXIST:
          this.emit(EMAIL_EXIST, error);
          break;
        case PHONE_EXIST:
          this.emit(PHONE_EXIST, error);
          break;
        default:
          this.emit(ERROR, error);
          break;
      }
      this.emit(ERROR, error);
    }
  }
}

AddSchool.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EMAIL_EXIST', 'PHONE_EXIST']);

module.exports = AddSchool;
