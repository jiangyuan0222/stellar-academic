const Operation = require('src/app/Operation');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class UserLogin extends Operation {
  constructor({ usersRepository, UserModel, sessionsRepository }) {
    super();
    this.usersRepository = usersRepository,
      this.sessionsRepository = sessionsRepository,
      this.UserModel = UserModel,
      this.validationSchema = joi.object().keys({
        type: joi.string().valid('email', 'phone', 'username').required(),
        value: joi.string().required(),
        password: joi.string().required(),

        device: joi.string().required(),
        app_version: joi.string().required(),
        device_id: joi.string().required(),
        device_token: joi.string().required()
      });
  }

  async execute({ body, ip }) {
    const { SUCCESS, VALIDATION_ERROR, ERROR, USER_NOT_EXIST, INVALID_PASSWORD, USER_BANNED } = this.outputs;

    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error(VALIDATION_ERROR);
        error.details = obj.error.details[0].message;
        throw error;
      }

      let { type, value, password, device, app_version, device_id, device_token } = body;

      const userData = await this.usersRepository._getByCondition({
        [type]: value
      }, false);

      if (!userData) {
        const error = new Error(USER_NOT_EXIST);
        throw error;
      }

      if (userData.status === 'banned') {
        const error = new Error(USER_BANNED);
        throw error;
      }

      let passwordMatched = this.UserModel.comparePassword(password, userData.password);

      if (!passwordMatched) {
        const error = new Error(INVALID_PASSWORD);
        throw error;
      }

      // create session
      let sessionPayload = {
        user_id: userData.id,
        user_type: userData.user_type,
        device: device,
        app_version: app_version,
        device_id: device_id,
        device_token: device_token,
        school_id: userData.school_id,
        ip: ip,
        token: Math.floor(Math.random() * 8999 + 1000),
        push_channel: userData.id,
      };

      const session = await this.sessionsRepository.add(sessionPayload);

      let resObj = {
        ...{
          first_name: userData.first_name,
          last_name: userData.last_name,
          email: userData.email,
          phone: userData.phone,
          country_code: userData.country_code,
          address: userData.address,
          city: userData.city,
          country: userData.country,
          zip_code: userData.zip_code,
          user_type: userData.user_type
        },
        ...{
          token: this.UserModel.createToken(session.user_id, session.user_type, session.school_id, session.token)
        }
      };

      this.emit(SUCCESS, resObj);
    } catch (error) {
      switch (error.message) {
        case VALIDATION_ERROR:
          return this.emit(VALIDATION_ERROR, error);
        case USER_NOT_EXIST:
          return this.emit(USER_NOT_EXIST, error);
        case INVALID_PASSWORD:
          return this.emit(INVALID_PASSWORD, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

UserLogin.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'USER_NOT_EXIST', 'INVALID_PASSWORD', 'USER_BANNED']);

module.exports = UserLogin;
