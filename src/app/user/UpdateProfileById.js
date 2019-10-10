const Operation = require('src/app/Operation');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class UpdateProfileById extends Operation {
  constructor({ usersRepository, UserModel }) {
    super();
    this.usersRepository = usersRepository,
      this.UserModel = UserModel,
      this.Op = require('sequelize').Op,
      this.validationSchema = joi.object().keys({
        username: joi.string().optional(),
        password: joi.string().optional(),
        first_name: joi.string().optional(),
        last_name: joi.string().optional(),
        name: joi.string().optional(),
        logo: joi.string().optional(),
        email: joi.string().optional(),
        phone: joi.string().optional(),
        country_code: joi.string().optional(),
        address: joi.string().optional(),
        city: joi.string().optional(),
        country: joi.string().optional(),
        zip_code: joi.number().optional()
      });
  }

  async execute({ body, user, params }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST_PHONE, EXIST_EMAIL, EXIST_USERNAME } = this.outputs;

    try {
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error(VALIDATION_ERROR);
        error.details = obj.error.details[0].message;
        throw error;
      }

      if (body.username) {
        let duplicateUsername = await this.usersRepository._getByCondition({
          username: body.username,
          id: {
            [this.Op.ne]: params.id
          }
        }, false)

        if (duplicateUsername) {
          const error = new Error(EXIST_USERNAME);
          throw error;
        }
      }

      if (body.email) {
        let duplicateEmail = await this.usersRepository._getByCondition({
          email: body.email,
          id: {
            [this.Op.ne]: params.id
          }
        }, false)

        if (duplicateEmail) {
          const error = new Error(EXIST_EMAIL);
          throw error;
        }
      }

      if (body.phone) {
        let duplicatePhone = await this.usersRepository._getByCondition({
          phone: body.phone,
          id: {
            [this.Op.ne]: params.id
          }
        }, false)

        if (duplicatePhone) {
          const error = new Error(EXIST_PHONE);
          throw error;
        }
      }

      let updatedUser = this.usersRepository._updateByCondition(body, {
        id: params.id,
        user_type: 'family'
      })


      this.emit(SUCCESS);
    } catch (error) {
      switch (error.message) {
        case VALIDATION_ERROR:
          return this.emit(VALIDATION_ERROR, error);
        case EXIST_PHONE:
          return this.emit(EXIST_PHONE, error);
        case EXIST_USERNAME:
          return this.emit(EXIST_USERNAME, error);
        case EXIST_EMAIL:
          return this.emit(EXIST_EMAIL, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

UpdateProfileById.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST_PHONE', 'EXIST_EMAIL', 'EXIST_USERNAME']);

module.exports = UpdateProfileById;
