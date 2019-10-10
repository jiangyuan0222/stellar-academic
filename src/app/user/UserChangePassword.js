const Operation = require('src/app/Operation');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class UserChangePassword extends Operation {
  constructor({ usersRepository, UserModel, sessionsRepository }) {
    super();
    this.usersRepository = usersRepository,
      this.sessionsRepository = sessionsRepository,
      this.UserModel = UserModel,
      this.validationSchema = joi.object().keys({
        old_password: joi.string().required(),
        new_password: joi.string().required()
      });
  }

  async execute({ body, ip, user }) {
    const { SUCCESS, ERROR, INVALID_PASSWORD, VALIDATION_ERROR } = this.outputs;

    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error(VALIDATION_ERROR);
        error.details = obj.error.details[0].message;
        throw error;
      }

      let { old_password, new_password } = body;

      user = await this.usersRepository._getById(user.id);

      let passwordMatched = await this.UserModel.comparePassword(old_password, user.password);

      if (!passwordMatched) {
        const error = new Error(INVALID_PASSWORD);
        throw error;
      }

      let updateUser = await this.usersRepository._updateByCondition({
        password: new_password
      }, {
          id: user.id
        })

      let removeSession = await this.sessionsRepository._removeByCondition({
        where: {
          user_id: user.id,
          user_type: user.user_type
        }
      })

      this.emit(SUCCESS);
    } catch (error) {
      switch (error.message) {
        case VALIDATION_ERROR:
          return this.emit(VALIDATION_ERROR, error);
        case INVALID_PASSWORD:
          return this.emit(INVALID_PASSWORD, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

UserChangePassword.setOutputs(['SUCCESS', 'ERROR', 'INVALID_PASSWORD', 'VALIDATION_ERROR']);

module.exports = UserChangePassword;
