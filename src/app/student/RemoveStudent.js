const Operation = require('src/app/Operation');
const joi = require('joi');

class RemoveStudent extends Operation {
  constructor({ studentsRepository }) {
    super();
    this.studentsRepository = studentsRepository,
      this.validationSchema = joi.object().keys({
        user_id: joi.string().required()
      });
  }

  async execute({ user, params, auth, body }) {
    const { SUCCESS, ERROR, NOT_EXIST_STUDENT, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy, user_id;

    try {
      let obj;

      switch (userType) {
        case 'family':
          user_id = user.id;
          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          obj = joi.validate(body, this.validationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }
          user_id = body.user_id;
          break;
        default:
          break;
      }

      let studentData = await this.studentsRepository._getByArgs({
        where: {
          id: params.id,
          user_id
        }
      });

      if (!studentData) {
        const error = new Error('NOT_EXIST_STUDENT');
        throw error;
      }

      // remove student detail
      let removeStudentData = await this.studentsRepository._removeByArgs({
        where: {
          id: params.id
        }
      });

      this.emit(SUCCESS, removeStudentData);
    } catch (error) {
      switch (error.message) {
        case 'NOT_EXIST_STUDENT':
          return this.emit(NOT_EXIST_STUDENT, error);
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

RemoveStudent.setOutputs(['SUCCESS', 'ERROR', 'NOT_EXIST_STUDENT', 'VALIDATION_ERROR']);

module.exports = RemoveStudent;
