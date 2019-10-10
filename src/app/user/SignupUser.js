const Operation = require('src/app/Operation');
const User = require('src/domain/user/User');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class SignupUser extends Operation {
  constructor({ usersRepository, sessionsRepository, nodeMailer }) {
    super();
    this.usersRepository = usersRepository,
      this.nodeMailer = nodeMailer,
      this.sessionsRepository = sessionsRepository,
      this.validationSchema = joi.object().keys({
        username: joi.string().required(),
        first_name: joi.string().required(),
        last_name: joi.string().required(),
        password: joi.string().required(),
        email: joi.string().required(),
        phone: joi.string().required(),
        country_code: joi.string().required(),
        address: joi.string().required(),
        city: joi.string().required(),
        country: joi.string().required(),
        county: joi.string().optional(),
        zip_code: joi.number().required(),
        user_type: joi.string().valid('family', 'school_admin', 'super_admin').required(),


        device: joi.string().required(),
        app_version: joi.string().required(),
        device_id: joi.string().required(),
        device_token: joi.string().required()
      });
  }

  async execute({ body: userData, ip }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, DUPLICATE_VALUE, EXIST_USERNAME } = this.outputs;
    try {
      const obj = joi.validate(userData, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;
        throw error;
      }

      // check for email
      const duplicateEmail = await this.usersRepository._getByEmail(userData.email);

      if (duplicateEmail) {
        const error = new Error('DuplicationError');
        error.value = "email";

        throw error;
      }

      let duplicateUsername = await this.usersRepository._getByArgs({
        where: {
          username: userData.username
        }
      })

      if (duplicateUsername) {
        const error = new Error(EXIST_USERNAME);
        throw error;
      }

      // check for phone
      const duplicatePhone = await this.usersRepository._getByPhone(userData.phone);

      if (duplicatePhone) {
        const error = new Error('DuplicationError');
        error.value = "phone";

        throw error;
      }

      // create user
      let userPayload = {
        first_name: userData.first_name,
        last_name: userData.last_name,
        password: userData.password,
        email: userData.email,
        phone: userData.phone,
        country_code: userData.country_code,
        address: userData.address,
        city: userData.city,
        country: userData.country,
        county: userData.county || "",
        zip_code: userData.zip_code,
        user_type: userData.user_type
      };

      const newUser = await this.usersRepository.add(userPayload);

      // create session
      let sessionPayload = {
        user_id: newUser.id,
        user_type: userData.user_type,
        device: userData.device,
        app_version: userData.app_version,
        device_id: userData.device_id,
        device_token: userData.device_token,
        ip: ip,
        token: Math.floor(Math.random() * 8999 + 1000),
        push_channel: newUser.id,
      };

      const session = await this.sessionsRepository.add(sessionPayload);

      await this.nodeMailer.sendMailTemplate(userData.email, "user/newRegistration", "en");

      let resObj = {
        ...newUser,
        ...{
          token: jwt.sign({
            exp: Math.floor(Date.now() / 1000) + (60 * 60 * 24 * 7),
            data: {
              user_id: session.user_id,
              user_type: session.user_type,
              token: session.token
            }
          }, 'DigitalEducation')
        }
      };


      this.emit(SUCCESS, resObj);
    } catch (error) {
      switch (error.message) {
        case 'DuplicationError':
          return this.emit(DUPLICATE_VALUE, error.value);
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case EXIST_USERNAME:
          return this.emit(EXIST_USERNAME, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

SignupUser.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'DUPLICATE_VALUE', 'EXIST_USERNAME']);

module.exports = SignupUser;
