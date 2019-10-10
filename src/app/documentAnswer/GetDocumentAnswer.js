const Operation = require('src/app/Operation');
const joi = require('joi');

class GetDocumentQuestion extends Operation {
  constructor({ documentAnswersRepository, DocumentQuestionModel }) {
    super();
    this.documentAnswersRepository = documentAnswersRepository,
      this.DocumentQuestionModel = DocumentQuestionModel,
      this.familyValidationSchema = joi.object().keys({
        user_id: joi.string().required()
      }),
      this.schoolAdminValidationSchema = joi.object().keys({});
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, documentQuestionData;

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

          let documentQuestionData = await this.documentAnswersRepository._getByArgs({
            include: [{
              model: this.DocumentQuestionModel,
              as: 'question',
              required: true,
              where: {
                user_id: user.id
              }
            }]
          })

          this.emit(SUCCESS, documentQuestionData);

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

GetDocumentQuestion.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetDocumentQuestion;
