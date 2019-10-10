const Operation = require('src/app/Operation');
const Family = require('src/domain/family/Family');
const joi = require('joi');

class EditFamily extends Operation {
  constructor({ familiesRepository }) {
    super();
    (this.familiesRepository = familiesRepository),
      (this.familyValidationSchema = joi.object().keys({
        m_first_name: joi.string().optional(),
        m_last_name: joi.string().optional(),
        m_middle_initial: joi.string().optional(),
        m_address: joi.string().optional(),
        m_apt_unit: joi.string().optional(),
        m_country: joi.string().optional(),
        m_county: joi.string().optional(),
        m_city: joi.string().optional(),
        m_state: joi.string().optional(),
        m_zip_code: joi.string().optional(),
        m_phone: joi.string().optional(),
        m_email: joi.string().optional(),
        f_first_name: joi.string().optional(),
        f_last_name: joi.string().optional(),
        f_middle_initial: joi.string().optional(),
        f_address: joi.string().optional(),
        f_apt_unit: joi.string().optional(),
        f_country: joi.string().optional(),
        f_county: joi.string().optional(),
        f_city: joi.string().optional(),
        f_state: joi.string().optional(),
        f_zip_code: joi.string().optional(),
        f_phone: joi.string().optional(),
        f_email: joi.string().optional()
      })),
      (this.schoolAdminValidationSchema = joi.object().keys({
        user_id: joi.string().required(),
        m_first_name: joi.string().optional(),
        m_last_name: joi.string().optional(),
        m_middle_initial: joi.string().optional(),
        m_address: joi.string().optional(),
        m_apt_unit: joi.string().optional(),
        m_country: joi.string().optional(),
        m_county: joi.string().optional(),
        m_city: joi.string().optional(),
        m_state: joi.string().optional(),
        m_zip_code: joi.string().optional(),
        m_phone: joi.string().optional(),
        m_email: joi.string().optional(),
        f_first_name: joi.string().optional(),
        f_last_name: joi.string().optional(),
        f_middle_initial: joi.string().optional(),
        f_address: joi.string().optional(),
        f_apt_unit: joi.string().optional(),
        f_country: joi.string().optional(),
        f_county: joi.string().optional(),
        f_city: joi.string().optional(),
        f_state: joi.string().optional(),
        f_zip_code: joi.string().optional(),
        f_phone: joi.string().optional(),
        f_email: joi.string().optional(),
        tag: joi.string().optional(),
        status: joi
          .string()
          .valid(
            "Active",
            "Banned",
            "graduated",
            "withdrawn",
            "pending_approval",
            "pending_re_enrollment"
          )
          .optional()
      }));
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, FAMILY_NOT_EXIST } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, isFamily, familyData;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          isFamily = await this.familiesRepository._getCustom({
            where: {
              user_id: user.id
            }
          })

          if (!isFamily) {
            throw new Error(FAMILY_NOT_EXIST);
          }

          familyData = await this.familiesRepository._editByArgs(body, {
            where: {
              user_id: user.id
            }
          });

          this.emit(SUCCESS, familyData);
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
          isFamily = await this.familiesRepository._getCustom({
            where: {
              user_id: body.user_id
            }
          })

          if (!isFamily) {
            throw new Error(FAMILY_NOT_EXIST);
          }

          let updateParams = { ...body };
          delete updateParams.user_id;

          familyData = await this.familiesRepository._editByArgs(updateParams, {
            where: {
              user_id: body.user_id
            }
          });

          this.emit(SUCCESS, familyData);

          break;
        default:
          break;
      }

    } catch (error) {
      if (error.message === 'ValidationError') {
        return this.emit(VALIDATION_ERROR, error);
      }
      if (error.message === 'FAMILY_NOT_EXIST') {
        return this.emit(FAMILY_NOT_EXIST, error);
      }
      this.emit(ERROR, error);
    }
  }
}

EditFamily.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'FAMILY_NOT_EXIST']);

module.exports = EditFamily;
