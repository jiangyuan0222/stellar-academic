const Operation = require('src/app/Operation');
const User = require('src/domain/user/User');
const joi = require('joi');

class CreateUser extends Operation {
  constructor({ usersRepository }) {
    super();
    this.usersRepository = usersRepository,
      this.validationSchema = joi.object().keys({
        first_name: joi.string().required(),
        last_name: joi.string().required(),
        password: joi.string().required(),
        email: joi.string().required(),
        phone: joi.string().required(),
        country_code: joi.string().required(),
        address: joi.string().required(),
        city: joi.string().required(),
        country: joi.string().required(),
        zip_code: joi.string().required()
      });
  }

  async execute(userData) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    try {
      const obj = joi.validate(userData, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }
      const newUser = await this.usersRepository.add(userData);

      this.emit(SUCCESS, newUser);
    } catch (error) {
      if (error.message === 'ValidationError') {
        return this.emit(VALIDATION_ERROR, error);
      }

      this.emit(ERROR, error);
    }
  }
}

CreateUser.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = CreateUser;
