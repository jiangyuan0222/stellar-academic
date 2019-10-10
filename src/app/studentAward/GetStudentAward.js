const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class GetStudentAward extends Operation {
  constructor({ studentAwardsRepository, studentsRepository,
    StudentModel, logger, familiesRepository, StudentAwardModel,
    FamilyModel }) {
    super();
    this.studentAwardsRepository = studentAwardsRepository,
      this.familiesRepository = familiesRepository,
      this.StudentAwardModel = StudentAwardModel,
      this.FamilyModel = FamilyModel,
      this.Op = require('sequelize').Op,
      this.logger = logger,
      this.StudentModel = StudentModel,
      this.studentsRepository = studentsRepository,
      this.familyValidationSchema = joi.object().keys({
        student_id: joi.string().optional()
      });
  }

  async execute({ params, user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;
    let userType = auth.strategy,
      studentAward;

    try {

      await this.studentAwardsRepository._editByArgs({
        status: 'Active'
      }, {
          where: {
            status: 'Pending',
            start_date: {
              [this.Op.lte]: moment().toDate()
            }
          }
        })

      await this.studentAwardsRepository._editByArgs({
        status: 'Expired'
      }, {
          where: {
            status: 'Active',
            end_date: {
              [this.Op.lte]: moment().toDate()
            }
          }
        })

      switch (userType) {
        case 'school_admin':

          studentAward = await this.studentAwardsRepository._getAllByArgs({
            include: [{
              model: this.FamilyModel,
              attributes: ['m_first_name', 'm_last_name'],
              as: 'family',
              required: true,
              where: {
                school_id: user.id
              }
            }]
          })

          this.emit(SUCCESS, studentAward);

          break;
        case 'family':
          let condition = {
            attributes: ['id', 'student_id', 'status', 'activity', 'title', 'desc', 'start_date', 'end_date'],
            include: [{
              model: this.StudentModel,
              attributes: ['first_name', 'last_name', 'middle_name']
            }],
            where: {
              user_id: user.id
            }
          }

          if (body.student_id) {
            condition.where.student_id = body.student_id
          }

          studentAward = await this.studentAwardsRepository._getAllByArgs(condition)

          this.emit(SUCCESS, studentAward);
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

GetStudentAward.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = GetStudentAward;
