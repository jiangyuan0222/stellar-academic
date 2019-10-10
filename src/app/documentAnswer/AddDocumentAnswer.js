const Operation = require('src/app/Operation');
const joi = require('joi');

class AddDocumentQuestion extends Operation {
  constructor({ documentAnswersRepository }) {
    super();
    this.documentAnswersRepository = documentAnswersRepository,
      this.familyValidationSchema = joi.object().keys({
        question_id: joi.string().required(),
        answer: joi.string().required(),
        desc: joi.string().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, ANSWER_EXIST } = this.outputs;
    let userType = auth.strategy;

    try {

      let obj, documentAnswer, isAnswer;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          isAnswer = this.documentAnswersRepository.gerByArgs({
            where: {
              question_id: body.question_id,
              user_id: user.id
            }
          })

          if (isAnswer) {
            throw new Error('ANSWER_EXIST');
          }

          documentAnswer = await this.documentAnswersRepository.add({
            question_id: body.question_id,
            answer: body.answer,
            desc: body.desc,
            user_id: user.id
          })

          this.emit(SUCCESS, documentAnswer);

          break;
        case 'school_admin':

          break;
        default:
          break;
      }

    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case ANSWER_EXIST:
          return this.emit(ANSWER_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

AddDocumentQuestion.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'ANSWER_EXIST']);

module.exports = AddDocumentQuestion;