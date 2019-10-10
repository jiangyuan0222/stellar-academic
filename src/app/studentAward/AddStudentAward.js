const Operation = require('src/app/Operation');
const joi = require('joi');

class AddStudentAward extends Operation {
  constructor({ studentAwardsRepository, studentsRepository }) {
    super();
    this.studentAwardsRepository = studentAwardsRepository,
      this.studentsRepository = studentsRepository,
      this.familyValidationSchema = joi.object().keys({
        student_id: joi.string().required(),
        activity: joi.string().required(),
        title: joi.string().required(),
        desc: joi.string().required(),
        start_date: joi.date().iso().optional(),
        end_date: joi.date().iso().greater(joi.ref('start_date')).optional()
      }),
      this.adminValidationSchema = joi.object().keys({
        students: joi.array().required(),
        activity: joi.string().required(),
        title: joi.string().required(),
        desc: joi.string().required(),
        start_date: joi.date().iso().optional(),
        end_date: joi.date().iso().greater(joi.ref('start_date')).optional()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, studentBulkData = [], studentTaskData;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          let isStudent = await this.studentsRepository._getByArgs({
            where: {
              id: body.student_id,
              user_id: user.id
            }
          })

          if (!isStudent) {
            const error = new Error(STUDENT_NOT_EXIST);
            throw error;
          }

          studentTaskData = await this.studentAwardsRepository.add({ ...body, user_id: user.id });


          this.emit(SUCCESS, studentTaskData);
          break;
        case 'school_admin':
          obj = joi.validate(body, this.adminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          // let isStudent = await this.studentsRepository._getByArgs({
          //   where: {
          //     id: body.student_id,
          //     user_id: user.id
          //   }
          // })

          // if (!isStudent) {
          //   const error = new Error(STUDENT_NOT_EXIST);
          //   throw error;
          // }

          for (const index in body.student_id) {
            if (body.student_id.hasOwnProperty(index)) {
              const element = body.student_id[index];
              studentBulkData.push({
                student_id: element.student_id,
                activity: body.activity,
                title: body.title,
                desc: body.desc,
                start_date: body.start_date,
                end_date: body.end_date,
                user_id: element.user_id
              })
            }
          }

          studentTaskData = await this.studentAwardsRepository.addBulk(studentBulkData);

          this.emit(SUCCESS, studentTaskData);
          break;
        default:
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

AddStudentAward.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = AddStudentAward;
