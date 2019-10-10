const Operation = require('src/app/Operation');
const joi = require('joi');

class FindFamily extends Operation {
  constructor({ familiesRepository, UserModel, StudentModel }) {
    super();
    this.familiesRepository = familiesRepository,
      this.UserModel = UserModel,
      this.StudentModel = StudentModel,
      this.Op = require('sequelize').Op,
      this.validationSchema = joi.object().keys({
        m_first_name: joi.string().optional(),
        m_last_name: joi.string().optional(),
        f_first_name: joi.string().optional(),
        f_last_name: joi.string().optional(),
        phone: joi.string().optional(),
        email: joi.string().optional(),
        address: joi.string().optional(),
        city: joi.string().optional(),
        tag: joi.string().optional(),
        status: joi.string().valid('Active', 'Banned', 'graduated',
          'withdrawn',
          'pending_approval',
          'pending_re_enrollment').optional(),
        country: joi.string().optional(),
        county: joi.string().optional(),
        zip_code: joi.number().optional(),
        student: joi.object({
          first_name: joi.string().optional(),
          last_name: joi.string().optional(),
          birth_date: joi.string().optional(),
          tag: joi.string().optional()
        }).optional()
      });
  }

  async execute({ body, user }) {
    const { SUCCESS, ERROR, FAMILY_NOT_EXIST, VALIDATION_ERROR } = this.outputs;

    try {

      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;
        throw error;
      }

      let query_obj = {
        include: [{
          model: this.UserModel,
          where: {}
        }, {
          model: this.StudentModel,
          where: {},
          as: 'students'
        }],
        where: {}
      },
        family = ['m_first_name', 'm_last_name', 'f_first_name', 'f_last_name', 'status'],
        user = ['phone', 'email', 'address', 'city', 'country', 'county', 'zip_code'],
        student = ['first_name', 'last_name', 'birth_date', 'tag'];

      for (const key in body) {
        if (body.hasOwnProperty(key)) {
          const element = body[key];

          switch (key) {
            case 'student':
              for (const student_key in body[key]) {
                if (body[key].hasOwnProperty(student_key)) {
                  const element = body[key][student_key];
                  query_obj.include[1].where[student_key] = {
                    [this.Op.like]: `%${body[key][student_key]}%`
                  }
                }
              }
              break;
            default:
              if (family.includes(key)) {
                query_obj.where[key] = {
                  [this.Op.like]: `%${body[key]}%`
                }
              } else if (user.includes(key)) {
                query_obj.include[0].where[key] = {
                  [this.Op.like]: `%${body[key]}%`
                }
              } else { }
              break;
          }

        }
      }

      let familyData = await this.familiesRepository._getAllByArgs(query_obj)

      this.emit(SUCCESS, familyData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          this.emit(VALIDATION_ERROR, error);
          break;
        case 'FAMILY_NOT_EXIST':
          this.emit(FAMILY_NOT_EXIST, error);
          break;
        default:
          this.emit(ERROR, error);
          break;
      }
    }
  }
}

FindFamily.setOutputs(['SUCCESS', 'ERROR', 'FAMILY_NOT_EXIST', 'VALIDATION_ERROR']);

module.exports = FindFamily;
