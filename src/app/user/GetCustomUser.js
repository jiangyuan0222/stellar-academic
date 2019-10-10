const Operation = require('src/app/Operation');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class GetCustomUser extends Operation {
  constructor({ usersRepository, UserModel }) {
    super();
    this.usersRepository = usersRepository,
      this.UserModel = UserModel,
      this.validationSchema = joi.object().keys({
        username: joi.string().optional()
      });
  }

  async execute({ body, ip }) {
    const { SUCCESS, VALIDATION_ERROR, ERROR, USER_NOT_EXIST } = this.outputs;

    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error(VALIDATION_ERROR);
        error.details = obj.error.details[0].message;
        throw error;
      }

      const userData = await this.usersRepository._getByArgs({
        attributes: ['id', 'name', 'first_name', 'last_name', 'username', 'email', 'phone'],
        where: {
          ...body
        }
      });

      if (!userData) {
        const error = new Error(USER_NOT_EXIST);
        throw error;
      }


      this.emit(SUCCESS, userData);
    } catch (error) {
      switch (error.message) {
        case VALIDATION_ERROR:
          return this.emit(VALIDATION_ERROR, error);
        case USER_NOT_EXIST:
          return this.emit(USER_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetCustomUser.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'USER_NOT_EXIST']);

module.exports = GetCustomUser;
