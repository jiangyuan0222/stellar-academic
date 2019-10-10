const Operation = require('src/app/Operation');
const joi = require('joi');
const i18n = require('i18n');

class AddPreUserRequest extends Operation {
  constructor({ preUserRequestsRepository }) {
    super();
    this.preUserRequestsRepository = preUserRequestsRepository,
      this.validationSchema = joi.object().keys({
        type: joi.string().required(),
        comment: joi.string().required()
      });
  }

  async execute({ body, user }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;

    try {
      let obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let preUserRequestData = await this.preUserRequestsRepository.add({
        ...body,
        user_id: user.id
      })

      this.emit(SUCCESS, preUserRequestData);

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

AddPreUserRequest.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = AddPreUserRequest;
