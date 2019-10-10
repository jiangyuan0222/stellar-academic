const Operation = require('src/app/Operation');
const joi = require('joi');

class AddStudentAward extends Operation {
  constructor({ familyNotesRepository, studentsRepository }) {
    super();
    this.familyNotesRepository = familyNotesRepository,
      this.studentsRepository = studentsRepository,
      this.familyValidationSchema = joi.object().keys({
        student_id: joi.string().required(),
        activity: joi.string().required(),
        title: joi.string().required(),
        desc: joi.string().required(),
        start_date: joi.date().iso().optional(),
        end_date: joi.date().iso().greater(joi.ref('start_date')).optional()
      }),
      this.adminValidationSchema = joi.object().keys({
        user_id: joi.string().required(),
        title: joi.string().required(),
        note: joi.string().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, familyNoteData;

      switch (userType) {
        case 'family':
          this.emit(SUCCESS, "");
          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          obj = joi.validate(body, this.adminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          familyNoteData = await this.familyNotesRepository.add({
            user_id: body.user_id,
            title: body.title,
            note: body.note
          });

          this.emit(SUCCESS, familyNoteData);
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

AddStudentAward.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = AddStudentAward;
