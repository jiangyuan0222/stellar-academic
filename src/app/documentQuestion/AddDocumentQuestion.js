const Operation = require('src/app/Operation');
const joi = require('joi');

class AddDocumentQuestion extends Operation {
  constructor({ documentQuestionsRepository }) {
    super();
    this.documentQuestionsRepository = documentQuestionsRepository,
      this.schoolAdminValidationSchema = joi.object().keys({
        question: joi.string().required(),
        desc: joi.string().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy;

    try {

      let obj, documentQuestion;

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

          documentQuestion = await this.documentQuestionsRepository.add({
            question: body.question,
            desc: body.desc,
            user_id: user.id
          })

          this.emit(SUCCESS, documentQuestion);
          break;
        default:
          break;
      }

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

AddDocumentQuestion.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = AddDocumentQuestion;