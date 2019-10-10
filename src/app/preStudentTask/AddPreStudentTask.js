const Operation = require('src/app/Operation');
const joi = require('joi');
const i18n = require('i18n');

class AddPreStudentTask extends Operation {
  constructor({ preStudentTasksRepository }) {
    super();
    this.preStudentTasksRepository = preStudentTasksRepository,
      this.validationSchema = joi.object().keys({
        activity: joi.string().required(),
        title: joi.string().required(),
        desc: joi.string().required()
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

      let preStudentTaskData = await this.preStudentTasksRepository.add({
        ...body,
        user_id: user.id
      })

      this.emit(SUCCESS, preStudentTaskData);

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

AddPreStudentTask.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = AddPreStudentTask;
