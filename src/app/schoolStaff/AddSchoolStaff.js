const Operation = require("src/app/Operation");
const joi = require('joi');
const jwt = require('jsonwebtoken');

class AddSchoolStaff extends Operation {
  constructor({ schoolStaffRepository, usersRepository }) {
    super();
    this.schoolStaffRepository = schoolStaffRepository;
    this.usersRepository = usersRepository;
    this.schoolStaffValidationSchema = joi.object().keys({
      first_name: joi.string().required(),
      last_name: joi.string().required(),
      email: joi.string().required(),
      user_name: joi.string().required(),
      password: joi.string().required(),
      staff_type: joi
        .string()
        .valid("school_admin", "school_manager", "school_staff"),
      school_id: joi.string().optional()
    });
  }

  async execute({ body }) {
    const {
      SUCCESS,
      ERROR,
      VALIDATION_ERROR,
      EXIST_EMAIL,
      EXIST_USER
    } = this.outputs;
    try {
      let obj = joi.validate(body, this.schoolStaffValidationSchema);

      if (obj.error) {
        const error = new Error("ValidationError");
        error.details = obj.error.details[0].message;

        throw error;
      }
      let duplicateEmail = await this.usersRepository._getByEmail(body.email);
      console.log(duplicateEmail);
      if (duplicateEmail) {
        const error = new Error(EXIST_EMAIL);
        throw error;
      }
      let duplicateUserName = await this.usersRepository._getByUserName(
        body.user_name
      );
      console.log(duplicateEmail);
      if (duplicateUserName) {
        const error = new Error(EXIST_USER);
        throw error;
      }
      let insertData = {
        first_name: body.first_name,
        last_name: body.last_name,
        email: body.email,
        phone: '7788998877' ,
        country_cod: '+91',
        address: '125 Test Rd',
        city: 'Knoxville',
        country: 'usa',
        zip_code: '37922',
        password: body.password,
        user_type: body.staff_type,
        username: body.user_name,
        name: 'Sailaway Learning6',
        logo: 'public/3473d1663d6eac8eae1025c01332fecd.jpg'
      }
      let schoolStaffData = await this.usersRepository.add({
        ...insertData
      });

      this.emit(SUCCESS, schoolStaffData);
    } catch (error) {
      switch (error.message) {
        case "ValidationError":
          return this.emit(VALIDATION_ERROR, error);
        case EXIST_EMAIL:
          this.emit(EXIST_EMAIL, error);
          break;
        case EXIST_USER:
          this.emit(EXIST_USER, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

AddSchoolStaff.setOutputs([
  "SUCCESS",
  "ERROR",
  "VALIDATION_ERROR",
  "EXIST_EMAIL",
  "EXIST_USER"
]);

module.exports = AddSchoolStaff;
