const Operation = require('src/app/Operation');
const joi = require('joi');

class AddUserTag extends Operation {
  constructor({ tagsRepository }) {
    super();
    this.tagsRepository = tagsRepository,
      this.schoolAdminValidationSchema = joi.object().keys({
        name: joi.string().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = this.outputs;
    let userType = auth.strategy;

    try {

      let obj, isTag, tagData;

      switch (userType) {
        case 'family':

          break;
        case 'school_admin':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          isTag = await this.tagsRepository._getByArgs({
            where: {
              name: body.name
            }
          })

          if (isTag) {
            throw new Error('EXIST');
          }

          tagData = await this.tagsRepository.add({
            name: body.name
          })

          this.emit(SUCCESS, tagData);
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

AddUserTag.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST']);

module.exports = AddUserTag;