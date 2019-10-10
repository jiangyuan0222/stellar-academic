const Operation = require('src/app/Operation');
const User = require('src/domain/user/User');
const joi = require('joi');
const moment = require('moment');
const jwt = require('jsonwebtoken');

class GetStudentInThisYear extends Operation {
  constructor({ studentsRepository, FamilyModel, database, UserModel }) {
    super();
    this.studentsRepository = studentsRepository,
      this.FamilyModel = FamilyModel,
      this.UserModel = UserModel,
      this.database = database,
      this.Op = require('sequelize').Op,
      this.familyValidationSchema = joi.object().keys({}),
      this.adminValidationSchema = joi.object().keys({
        // status: joi.string().valid('pending', 'completed').optional(),
        tag: joi.string().optional(),
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        year: joi.date().iso().optional(),
      });
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, NOT_EXIST_STUDENT, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC';

    try {
      let obj, studentData, query_obj;

      switch (userType) {
        case 'family':

          // obj = joi.validate(body, this.familyValidationSchema);

          // if (obj.error) {
          //   const error = new Error('ValidationError');
          //   error.details = obj.error.details[0].message;

          //   throw error;
          // }

          studentData = await this.studentsRepository._getAllByArgs({
            where: {
              user_id: user.id
            }
          });

          if (studentData.length == 0) {
            const error = new Error('NOT_EXIST_STUDENT');
            // throw error;
          }

          this.emit(SUCCESS, studentData);

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

          query_obj = {
            attributes: ['id', 'first_name', 'last_name', 'middle_name', 'gender', 'grade_level', 'created_at'],
            include: [{
              model: this.FamilyModel,
              attributes: ['user_id', 'm_first_name', 'm_last_name', 'f_first_name', 'm_address', 'f_last_name'],
              as: 'family',
              required: true,
              include: [{
                model: this.UserModel,
                attributes: ['address', 'email', 'phone', 'city', 'country', 'county', "zip_code"],
              }],
              where: {
                 school_id: auth.value.school_id
              }
            }],
            order: [
              [orderBy, orderType]
            ],
            where: {
              // created_at: '2019-09-29T15:02:45.000Z'
            }
          }
          const start_date = new Date(body.year, "00", "02");
          const end_date = new Date(body.year, "11", "32");

          if (body.year) {
            query_obj.where.created_at = {
              // [this.Op.lt]: end_date,
              // [this.Op.gt]: start_date
              [this.Op.between]: [moment(start_date), moment(end_date)]
            }
            // query_obj.where.created_at >= "2017-01-29T15:02:45.000Z"
          }

          if (body.tag) {
            query_obj.where.tag = body.tag;
          }
          studentData = await this.studentsRepository._getAllByArgs(query_obj);

          this.emit(SUCCESS, studentData);
          break;
        default:
          break;
      }

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

GetStudentInThisYear.setOutputs(['SUCCESS', 'ERROR', 'NOT_EXIST_STUDENT', 'VALIDATION_ERROR']);

module.exports = GetStudentInThisYear;
