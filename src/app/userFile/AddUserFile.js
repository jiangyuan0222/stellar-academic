const Operation = require('src/app/Operation');
const joi = require('joi');

class AddUserFile extends Operation {
  constructor({ userFilesRepository }) {
    super();
    this.userFilesRepository = userFilesRepository,
      this.familyValidationSchema = joi.object().keys({
        name: joi.string().required(),
        student_id: joi.string().optional(),
        desc: joi.string().optional()
      }),
      this.schoolAdminValidationSchema = joi.object().keys({
        user_id: joi.array().required(),
        name: joi.string().required(),
        student_id: joi.string().optional(),
        desc: joi.string().optional()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, userFileData, userFileBulkData = [];

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);
          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;
            throw error;
          }

          userFileData = await this.userFilesRepository.add({
            user_id: user.id,
            name: body.name,
            desc: body.desc,
            student_id: body.student_id || null
          })

          this.emit(SUCCESS, userFileData);
          break;
        case 'school_admin':
          obj = joi.validate(body, this.schoolAdminValidationSchema);
          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;
            throw error;
          }

          body.user_id.forEach(element => {
            userFileBulkData.push({
              user_id: element,
              name: body.name,
              student_id: body.student_id || null,
              desc: body.desc || null
            })
          });

          userFileData = await this.userFilesRepository.addBulk(userFileBulkData)

          this.emit(SUCCESS, userFileData);
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

AddUserFile.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = AddUserFile;
