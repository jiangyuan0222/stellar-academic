const Operation = require('src/app/Operation');
const User = require('src/domain/user/User');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class AddStudent extends Operation {
  constructor({ studentsRepository, userOrdersRepository }) {
    super();
    this.studentsRepository = studentsRepository,
      this.userOrdersRepository = userOrdersRepository,
      this.familyValidationSchema = joi.object().keys({
        first_name: joi.string().required(),
        last_name: joi.string().required(),
        middle_name: joi.string().required(),
        gender: joi.string().valid('Male', 'Female').required(),
        birth_date: joi.date().iso().required(),
        grade_level: joi.string().valid('1st Grade',
          '2nd Grade',
          '3rd Grade',
          '4th Grade',
          '5th Grade',
          '6th Grade',
          '7th Grade',
          '8th Grade',
          '9th Grade',
          '10th Grade',
          '11th Grade',
          '12th Grade',
          'Kindergarten',
          'Adult',
          '1 Year Of College',
          '2 Years Of College',
          '3 Years Of College',
          '4 Years Of College').required(),
        program: joi.string().optional(),
        school_info: joi.string().optional(),
        school_address: joi.string().optional(),
        school_phone: joi.string().optional(),
        tag: joi.string().optional()
      }),
      this.schoolAdminValidationSchema = joi.object().keys({
        user_id: joi.string().required(),
        first_name: joi.string().required(),
        last_name: joi.string().required(),
        middle_name: joi.string().required(),
        gender: joi.string().valid('Male', 'Female').required(),
        birth_date: joi.date().iso().required(),
        grade_level: joi.string().valid('1st Grade',
          '2nd Grade',
          '3rd Grade',
          '4th Grade',
          '5th Grade',
          '6th Grade',
          '7th Grade',
          '8th Grade',
          '9th Grade',
          '10th Grade',
          '11th Grade',
          '12th Grade',
          'Kindergarten',
          'Adult',
          '1 Year Of College',
          '2 Years Of College',
          '3 Years Of College',
          '4 Years Of College').required(),
        program: joi.string().optional(),
        school_info: joi.string().optional(),
        school_address: joi.string().optional(),
        school_phone: joi.string().optional(),
        tag: joi.string().optional()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy, studentData, isStudent, isUserOrderData;

    try {
      let obj;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          isStudent = await this.studentsRepository._getByArgs({
            where: {
              user_id: user.id
            }
          })

          if (isStudent) {
            isUserOrderData = await this.userOrdersRepository._getByArgs({
              where: {
                user_id: user.id,
                student_id: isStudent.id
              }
            })

            if (isUserOrderData) {
              await this.userOrdersRepository.add({
                user_id: isUserOrderData.user_id,
                fees_type: isUserOrderData.fees_type,
                desc: isUserOrderData.desc,
                total: isUserOrderData.total,
                student_id: isUserOrderData.student_id,
              })
            }
          }

          // add student detail
          studentData = await this.studentsRepository.add(Object.assign(body, {
            user_id: user.id
          }))

          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          isStudent = await this.studentsRepository._getByArgs({
            where: {
              user_id: body.user_id
            }
          })

          if (isStudent) {
            isUserOrderData = await this.userOrdersRepository._getByArgs({
              where: {
                user_id: body.user_id,
                student_id: isStudent.id
              }
            })

            if (isUserOrderData) {
              await this.userOrdersRepository.add({
                user_id: isUserOrderData.user_id,
                fees_type: isUserOrderData.fees_type,
                desc: isUserOrderData.desc,
                total: isUserOrderData.total,
                student_id: isUserOrderData.student_id,
              })
            }
          }

          // add student detail
          studentData = await this.studentsRepository.add(Object.assign(body, {
            user_id: body.user_id
          }))

          break;
        default:
          break;
      }

      this.emit(SUCCESS, studentData);
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

AddStudent.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = AddStudent;
