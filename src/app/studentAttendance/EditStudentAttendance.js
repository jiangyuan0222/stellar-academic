const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class EditStudentAttendance extends Operation {
  constructor({ studentAttendancesRepository }) {
    super();
    this.studentAttendancesRepository = studentAttendancesRepository
    this.validationSchema = joi.object().keys({
      attendance: joi.array().optional()
    });
  }

  async execute({ body, params }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, NOT_EXIST_ATTENDANCE } = this.outputs;

    try {

      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let isStudentAttendance = await this.studentAttendancesRepository._getByArgs({
        where: {
          id: params.id
        }
      })

      if (!isStudentAttendance) {
        const error = new Error(NOT_EXIST_ATTENDANCE);
        throw error;
      }

      // Update attendance data
      let attendanceArray = isStudentAttendance.attendance;

      if (body.attendance) {
        _.forEach(body.attendance, (value, index) => {
          attendanceArray[value.date - 1].student_status = value.status;
          attendanceArray[value.date - 1].updated_at = moment().utc();
        })
      }

      let StudentAttendanceData = await this.studentAttendancesRepository._editByArgs({
        attendance: attendanceArray
      }, {
          where: {
            id: params.id
          }
        })

      this.emit(SUCCESS, StudentAttendanceData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'NOT_EXIST_ATTENDANCE':
          return this.emit(NOT_EXIST_ATTENDANCE, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

EditStudentAttendance.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'NOT_EXIST_ATTENDANCE']);

module.exports = EditStudentAttendance;
