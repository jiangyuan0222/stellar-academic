const Operation = require('src/app/Operation');
const User = require('src/domain/user/User');
const joi = require('joi');

class CheckUser extends Operation {
  constructor({ usersRepository }) {
    super();
    this.usersRepository = usersRepository,
      this.validationSchema = joi.object().keys({
        type: joi.string().valid('email', 'phone', 'username').required(),
        value: joi.string().required(),
      });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let userData = await this.usersRepository._getByArgs({
        attributes: ['first_name', 'last_name', 'username', 'phone'],
        where: {
          [body.type]: body.value
        }
      });

      this.emit(SUCCESS, userData ? true : false);
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

CheckUser.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = CheckUser;
