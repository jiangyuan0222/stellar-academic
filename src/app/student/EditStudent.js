const Operation = require('src/app/Operation');
const User = require('src/domain/user/User');
const joi = require('joi');
const jwt = require('jsonwebtoken');

class EditStudent extends Operation {
  constructor({ studentsRepository }) {
    super();
    (this.studentsRepository = studentsRepository),
      (this.familyValidationSchema = joi.object().keys({
        first_name: joi.string().optional(),
        last_name: joi.string().optional(),
        middle_name: joi.string().optional(),
        gender: joi
          .string()
          .valid("Male", "Female")
          .optional(),
        birth_date: joi
          .date()
          .iso()
          .optional(),
        grade_level: joi
          .string()
          .valid(
            "1st Grade",
            "2nd Grade",
            "3rd Grade",
            "4th Grade",
            "5th Grade",
            "6th Grade",
            "7th Grade",
            "8th Grade",
            "9th Grade",
            "10th Grade",
            "11th Grade",
            "12th Grade",
            "Kindergarten",
            "Adult",
            "1 Year Of College",
            "2 Years Of College",
            "3 Years Of College",
            "4 Years Of College"
          )
          .optional(),
        program: joi.string().optional(),
        school_info: joi.string().optional()
      })),
      (this.schoolAdminValidationSchema = joi.object().keys({
        user_id: joi.string().required(),
        first_name: joi.string().optional(),
        last_name: joi.string().optional(),
        middle_name: joi.string().optional(),
        gender: joi
          .string()
          .valid("Male", "Female")
          .optional(),
        birth_date: joi
          .date()
          .iso()
          .optional(),
        grade_level: joi
          .string()
          .valid(
            "1st Grade",
            "2nd Grade",
            "3rd Grade",
            "4th Grade",
            "5th Grade",
            "6th Grade",
            "7th Grade",
            "8th Grade",
            "9th Grade",
            "10th Grade",
            "11th Grade",
            "12th Grade",
            "Kindergarten",
            "Adult",
            "1 Year Of College",
            "2 Years Of College",
            "3 Years Of College",
            "4 Years Of College"
          )
          .optional(),
        program: joi.string().optional(),
        school_info: joi.string().optional(),
        status: joi
          .string()
          .valid("pending", "graduated", "active", "inactive")
          .optional(),
        tag: joi.string().optional()
      }));
  }

  async execute({ body, user, params, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, NOT_EXIST_STUDENT } = this.outputs;
    let userType = auth.strategy, user_id;

    try {
      let obj;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);
          user_id = user.id;
          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error("ValidationError");
            error.details = obj.error.details[0].message;

            throw error;
          }
          user_id = body.user_id;
          break;
        default:
          break;
      }


      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;
        throw error;
      }


      let studentData = await this.studentsRepository.getById(params.id);

      if (!studentData) {
        const error = new Error('NOT_EXIST_STUDENT');
        throw error;
      }

      // edit student detail

      let editStudentData = await this.studentsRepository._editByArgs(body, {
        where: {
          id: params.id,
          user_id
        }
      })

      this.emit(SUCCESS, editStudentData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'NOT_EXIST_STUDENT':
          return this.emit(NOT_EXIST_STUDENT, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

EditStudent.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'NOT_EXIST_STUDENT']);

module.exports = EditStudent;
