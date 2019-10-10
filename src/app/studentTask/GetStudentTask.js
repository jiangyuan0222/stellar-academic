const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class GetStudentTask extends Operation {
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
      this.validationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        status: joi.string().valid('Pending', 'Active', 'Completed', 'Expired').optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ params, user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;
    let userType = auth.strategy, obj,
      studentTask,
      query_obj,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC';

    try {

      switch (userType) {
        case 'school_admin':
        case 'school_staff':
        case 'school_manager':
          console.log("hereeerererer");
          console.log(auth);
          obj = joi.validate(body, this.validationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          query_obj = {
            include: [{
              model: this.FamilyModel,
              attributes: ['m_first_name', 'm_last_name'],
              as: 'family',
              required: true,
              where: {
                school_id: auth.value.school_id
              }
            }],
            order: [
              [orderBy, orderType]
            ],
            where: {
              school_id: auth.value.school_id
            }
          };

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.status) {
            query_obj.where.status = body.status;
          }

          studentTask = await this.studentTasksRepository._getAllByArgs(query_obj)

          this.emit(SUCCESS, studentTask);

          break;
        case 'family':
          obj = joi.validate(body, this.validationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          query_obj = {
            attributes: ['id', 'student_id', 'status', 'activity', 'title', 'desc', 'due_date'],
            include: [{
              model: this.StudentModel,
              attributes: ['first_name', 'last_name', 'middle_name']
            }],
            where: {
              user_id: user.id
            }
          };

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.status) {
            query_obj.where.status = body.status;
          }

          studentTask = await this.studentTasksRepository._getAllByArgs(query_obj);

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

GetStudentTask.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = GetStudentTask;
