const Operation = require('src/app/Operation');
const joi = require('joi');

class UpdateStudentTask extends Operation {
  constructor({ studentTasksRepository }) {
    super();
    this.studentTasksRepository = studentTasksRepository,
      this.validationSchema = joi.object().keys({
        activity: joi.string().optional(),
        title: joi.string().optional(),
        desc: joi.string().optional(),
        due_date: joi.date().iso().optional()
      });
  }

  async execute({ body, user, auth, params }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, studentTaskData;

      switch (userType) {
        case 'family':
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

          studentTaskData = await this.studentTasksRepository._editByArgs({
            ...body
          }, {
              where: {
                id: params.id
              }
            });

          this.emit(SUCCESS, studentTaskData);
          break;
        default:
          break;
      }

    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case STUDENT_NOT_EXIST:
          return this.emit(STUDENT_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

UpdateStudentTask.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = UpdateStudentTask;
