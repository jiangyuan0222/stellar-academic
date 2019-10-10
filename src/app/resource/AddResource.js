const Operation = require('src/app/Operation');
const joi = require('joi');

class AddResource extends Operation {
  constructor({ resourcesRepository }) {
    super();
    this.resourcesRepository = resourcesRepository,
      this.schoolAdminValidationSchema = joi.object().keys({
        name: joi.string().required(),
        source: joi.string().required(),
        desc: joi.string().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = this.outputs;
    let userType = auth.strategy;

    try {

      let obj, resourceData;

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

          resourceData = await this.resourcesRepository.add({
            name: body.name,
            source: body.source,
            desc: body.desc,
            created_by: user.id
          })

          this.emit(SUCCESS, resourceData);
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

AddResource.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'EXIST']);

module.exports = AddResource;