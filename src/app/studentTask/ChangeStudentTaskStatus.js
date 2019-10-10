const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class ChangeStudentTaskStatus extends Operation {
  constructor({ studentTasksRepository, studentsRepository,
    StudentModel, logger, familiesRepository, StudentTaskModel,
    FamilyModel }) {
    super();
    this.studentTasksRepository = studentTasksRepository,
      this.familiesRepository = familiesRepository,
      this.StudentTaskModel = StudentTaskModel,
      this.FamilyModel = FamilyModel,
      this.Op = require('sequelize').Op,
      this.logger = logger,
      this.StudentModel = StudentModel,
      this.studentsRepository = studentsRepository,
      this.familyValidationSchema = joi.object().keys({
        id: joi.array().required()
      }),
      this.schoolAdminValidationSchema = joi.object().keys({
        id: joi.array().required()
      });
  }

  async execute({ params, user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;
    let userType = auth.strategy, obj,
      studentTask;
    try {

      switch (userType) {
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }
          studentTask = await this.studentTasksRepository._editByArgs({
            status: 'Completed'
          }, {
              where: {
                id: {
                  [this.Op.in]: body.id
                }
              }
            })

          this.emit(SUCCESS, studentTask);
          break;
        case 'family':

          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          studentTask = await this.studentTasksRepository._editByArgs({
            status: 'Completed'
          }, {
              where: {
                id: {
                  [this.Op.in]: body.id
                }
              }
            })

          this.emit(SUCCESS, studentTask);
          break;
        default:
          this.logger.error("Invalid user type ")
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

ChangeStudentTaskStatus.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = ChangeStudentTaskStatus;
