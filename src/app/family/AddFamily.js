const Operation = require('src/app/Operation');
const Family = require('src/domain/family/Family');
const joi = require('joi');
const moment = require('moment');

class AddFamily extends Operation {
  constructor({ familiesRepository, logger, usersRepository, schoolSubscriptionPlansRepository }) {
    super();
    this.familiesRepository = familiesRepository,
      this.logger = logger,
      this.schoolSubscriptionPlansRepository = schoolSubscriptionPlansRepository,
      this.usersRepository = usersRepository,
      this.FamilyValidationSchema = joi.object().keys({
        school_id: joi.string().optional().default(null),
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
        tag: joi.string().optional()
      }),
      this.SuperAdminValidationSchema = joi.object().keys({
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
        username: joi.string().required(),
        first_name: joi.string().optional(),
        last_name: joi.string().optional(),
        password: joi.string().required(),
        subscription_plan_id: joi.string().required(),
        email: joi.string().required(),
        phone: joi.string().required(),
        country_code: joi.string().optional(),
        address: joi.string().optional(),
        city: joi.string().optional(),
        country: joi.string().optional(),
        zip_code: joi.number().optional(),
        tag: joi.string().optional()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, FAMILY_EXIST,
      EXIST_PHONE, EXIST_EMAIL, EXIST_USERNAME } = this.outputs;
    let userType = auth.strategy;

    try {
      let familyData, adminObj, duplicateEmail, duplicatePhone, duplicateUsername,
        userPayload, familyPayload, newUser;
      switch (userType) {
        case 'super_admin':
          adminObj = joi.validate(body, this.SuperAdminValidationSchema);

          if (adminObj.error) {
            const error = new Error('ValidationError');
            error.details = adminObj.error.details[0].message;
            throw error;
          }

          duplicateEmail = await this.usersRepository._getByEmail(body.email);

          if (duplicateEmail) {
            const error = new Error(EXIST_EMAIL);
            throw error;
          }

          // check for phone
          duplicatePhone = await this.usersRepository._getByPhone(body.phone);

          if (duplicatePhone) {
            const error = new Error(EXIST_PHONE);
            throw error;
          }

          duplicateUsername = await this.usersRepository._getByArgs({
            where: {
              username: body.username
            }
          })

          if (duplicateUsername) {
            const error = new Error(EXIST_USERNAME);
            throw error;
          }

          let subscriptionData = await this.schoolSubscriptionPlansRepository._getByArgs({
            where: {
              id: body.subscription_plan_id
            }
          })

          let subscription_start_date, subscription_end_date;
          switch (subscriptionData.type) {
            case 'monthly':
              subscription_start_date = moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY");
              subscription_end_date = moment(`${new Date().getMonth(2) + 2}-${moment(
                moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY")
              ).endOf('month')}-${moment().year()}`, "MM/DD/YYYY");
              break;
            case 'yearly':
              subscription_start_date = moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY");
              subscription_end_date = moment(`07-31-${(moment().year()) + 1}`, "MM/DD/YYYY");
              break;
            default:
              break;
          }

          // create user
          userPayload = {
            first_name: body.first_name || "",
            last_name: body.last_name || "",
            password: body.password,
            username: body.username,
            subscription_plan_id: body.subscription_plan_id,
            subscription_start_date,
            subscription_end_date,
            email: body.email,
            phone: body.phone,
            country_code: body.country_code || "",
            address: body.address || "",
            city: body.city || "",
            country: body.country || "",
            zip_code: body.zip_code || null,
            user_type: body.user_type
          };

          familyPayload = {
            m_first_name: body.m_first_name || "",
            m_last_name: body.m_last_name || "",
            m_middle_initial: body.m_middle_initial || "",
            m_address: body.m_address || "",
            m_apt_unit: body.m_apt_unit || "",
            m_city: body.m_city || "",
            m_state: body.m_state || "",
            m_zip_code: body.m_zip_code || "",
            m_phone: body.m_phone || "",
            m_email: body.m_email || "",
            f_first_name: body.f_first_name || "",
            f_last_name: body.f_last_name || "",
            f_middle_initial: body.f_middle_initial || "",
            f_address: body.f_address || "",
            f_apt_unit: body.f_apt_unit || "",
            f_city: body.f_city || "",
            f_state: body.f_state || "",
            f_zip_code: body.f_zip_code || null,
            f_phone: body.f_phone || "",
            f_email: body.f_email || "",
            tag: body.tag || ''
          };

          newUser = await this.usersRepository.add(userPayload);

          familyData = await this.familiesRepository.add(Object.assign(familyPayload, {
            user_id: newUser.id
          }));

          this.emit(SUCCESS, familyData);

          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          adminObj = joi.validate(body, this.SuperAdminValidationSchema);

          if (adminObj.error) {
            const error = new Error('ValidationError');
            error.details = adminObj.error.details[0].message;
            throw error;
          }

          duplicateEmail = await this.usersRepository._getByEmail(body.email);

          if (duplicateEmail) {
            const error = new Error(EXIST_EMAIL);
            throw error;
          }

          // check for phone
          duplicatePhone = await this.usersRepository._getByPhone(body.phone);

          if (duplicatePhone) {
            const error = new Error(EXIST_PHONE);
            throw error;
          }

          duplicateUsername = await this.usersRepository._getByArgs({
            where: {
              username: body.username
            }
          })

          if (duplicateUsername) {
            const error = new Error(EXIST_USERNAME);
            throw error;
          }

          // create user
          userPayload = {
            first_name: body.first_name || "",
            last_name: body.last_name || "",
            password: body.password,
            username: body.username,
            email: body.email,
            phone: body.phone,
            country_code: body.country_code || "",
            address: body.address || "",
            city: body.city || "",
            country: body.country || "",
            zip_code: body.zip_code || null,
            user_type: body.user_type
          };

          familyPayload = {
            m_first_name: body.m_first_name || "",
            m_last_name: body.m_last_name || "",
            m_middle_initial: body.m_middle_initial || "",
            m_address: body.m_address || "",
            m_apt_unit: body.m_apt_unit || "",
            m_country: body.m_country || "",
            m_county: body.m_county || "",
            m_city: body.m_city || "",
            m_state: body.m_state || "",
            m_zip_code: body.m_zip_code || "",
            m_phone: body.m_phone || "",
            m_email: body.m_email || "",
            f_first_name: body.f_first_name || "",
            f_last_name: body.f_last_name || "",
            f_middle_initial: body.f_middle_initial || "",
            f_address: body.f_address || "",
            f_apt_unit: body.f_apt_unit || "",
            f_country: body.m_country || "",
            f_county: body.m_county || "",
            f_city: body.f_city || "",
            f_state: body.f_state || "",
            f_zip_code: body.f_zip_code || null,
            f_phone: body.f_phone || "",
            f_email: body.f_email || "",
            school_id: auth.value.school_id,
            tag: body.tag || ''
          };

          newUser = await this.usersRepository.add(userPayload);

          familyData = await this.familiesRepository.add(Object.assign(familyPayload, {
            user_id: newUser.id
          }));
          this.sendMail(body.email);
          this.emit(SUCCESS, familyData);

          break;
        case 'family':
          const familyObj = joi.validate(body, this.FamilyValidationSchema);

          if (familyObj.error) {
            const error = new Error('ValidationError');
            error.details = familyObj.error.details[0].message;
            throw error;
          }

          let isFamily = await this.familiesRepository._getCustom({
            where: {
              user_id: user.id
            }
          })

          if (isFamily) {
            throw new Error(FAMILY_EXIST);
          }

          familyData = await this.familiesRepository.add(Object.assign(body, {
            user_id: user.id
          }));

          this.emit(SUCCESS, familyData);
          break;
        default:
          this.logger.error('Invalid user type !');
          break;
      }
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          this.emit(VALIDATION_ERROR, error);
          break;
        case FAMILY_EXIST:
          this.emit(FAMILY_EXIST, error);
          break;
        case EXIST_USERNAME:
          this.emit(EXIST_USERNAME, error);
          break;
        case EXIST_EMAIL:
          this.emit(EXIST_EMAIL, error);
          break;
        case EXIST_PHONE:
          this.emit(EXIST_PHONE, error);
          break;
        default:
          this.emit(ERROR, error);
          break;
      }
    }
  }

  sendMail(emailTo){
    var nodemailer = require('nodemailer');
    var mandrillTransport = require('nodemailer-mandrill-transport');

    /*
    * Configuring mandrill transport.
    * Copy your API key here.
    */

    var smtpTransport = nodemailer.createTransport(mandrillTransport({
      auth: {
        apiKey: '0yXvcMVjxB8acSB8wL6eGw'
      }
    }));

    // Put in email details.

    let mailOptions = {
      from: 'bobby@stellaracademic.com',
      to: emailTo,
      subject: 'familiy registered',
      html: 'You are registered to our school as family.'

    };
    // let mandrillOptions = {
    //   template_name: 'new-family-created'
    // }
    // Sending email.
    smtpTransport.sendMail(mailOptions, function (error, response) {
      if (error) {
        throw new Error('Error in sending email');
      }
      console.log('Message sent: ' + JSON.stringify(response));
      // res.send({ "msg": "message sent successfully" });
    });
  }
}

AddFamily.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'FAMILY_EXIST',
  'EXIST_EMAIL', 'EXIST_PHONE', 'EXIST_USERNAME']);

module.exports = AddFamily;
