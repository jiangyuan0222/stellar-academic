const Operation = require("src/app/Operation");
const joi = require("joi");
const jwt = require("jsonwebtoken");

class EditSchoolStaff extends Operation {
  constructor({ schoolStaffRepository, usersRepository }) {
    super();
    this.schoolStaffRepository = schoolStaffRepository;
    this.usersRepository = usersRepository;
    this.schoolStaffValidationSchema = joi.object().keys({
      id: joi.string().required(),
      first_name: joi.string().optional(),
      last_name: joi.string().optional(),
      email: joi.string().optional(),
      user_name: joi.string().optional(),
      password: joi.string().optional(),
      staff_type: joi
        .string()
        .valid("school_admin", "school_manager", "school_staff"),
      school_id: joi.string().optional()
    });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST_EMAIL } = this.outputs;
    try {
      let obj = joi.validate(body, this.schoolStaffValidationSchema);

      if (obj.error) {
        const error = new Error("ValidationError");
        error.details = obj.error.details[0].message;

        throw error;
      }

      let schoolStaffData = await this.usersRepository._editByArgs(body, {
        where: { id: body.id }
      });
      let responseData = await this.usersRepository._getByArgs({
        where: { id: body.id }
      });
      this.emit(SUCCESS, responseData);
    } catch (error) {
      switch (error.message) {
        case "ValidationError":
          return this.emit(VALIDATION_ERROR, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

EditSchoolStaff.setOutputs([
  "SUCCESS",
  "ERROR",
  "VALIDATION_ERROR",
  "EXIST_EMAIL"
]);

module.exports = EditSchoolStaff;
