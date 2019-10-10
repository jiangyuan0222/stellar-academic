const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class AddStudentCourse extends Operation {
  constructor({ studentAttendancesRepository, studentYearsRepository, studentsRepository }) {
    super();
    this.studentAttendancesRepository = studentAttendancesRepository,
      this.studentsRepository = studentsRepository,
      this.studentYearsRepository = studentYearsRepository,
      this.validationSchema = joi.object().keys({
        student_id: joi.string().required(),
        student_year_id: joi.string().required(),
        year: joi.string().required(),
        month: joi.string().required(),
        attendance: joi.array().required()
      });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST, STUDENT_YEAR_NOT_EXIST,
      STUDENT_ATTENDANCE_EXIST } = this.outputs;

    try {

      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let isStudent = await this.studentsRepository._getByArgs({
        where: {
          id: body.student_id
        }
      })

      if (!isStudent) {
        const error = new Error(STUDENT_NOT_EXIST);
        throw error;
      }

      let isStudentYear = await this.studentYearsRepository._getByArgs({
        where: {
          id: body.student_year_id
        }
      })

      if (!isStudentYear) {
        const error = new Error(STUDENT_YEAR_NOT_EXIST);
        throw error;
      }

      let isStudentAttendance = await this.studentAttendancesRepository._getByArgs({
        where: {
          student_id: body.student_id,
          student_year_id: body.student_year_id,
          year: body.year,
          month: body.month
        }
      })

      if (isStudentAttendance) {
        const error = new Error(STUDENT_ATTENDANCE_EXIST);
        throw error;
      }

      // attendance data
      let attendanceArray = [], length = new Date(body.year, body.month, 0).getDate();
      for (let index = 0; index < length; index++) {
        attendanceArray.push({
          date: index + 1,
          student_status: null,
          status: 'Pending',
          created_at: moment().utc(),
          updated_at: moment().utc()
        })
      }

      _.forEach(body.attendance, (value, index) => {
        attendanceArray[value.date - 1].student_status = value.status;
      })

      let StudentAttendanceData = await this.studentAttendancesRepository.add({
        ...body,
        attendance: attendanceArray
      })

      this.emit(SUCCESS, StudentAttendanceData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'STUDENT_NOT_EXIST':
          return this.emit(STUDENT_NOT_EXIST, error);
        case 'STUDENT_YEAR_NOT_EXIST':
          return this.emit(STUDENT_YEAR_NOT_EXIST, error);
        case 'STUDENT_ATTENDANCE_EXIST':
          return this.emit(STUDENT_ATTENDANCE_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

AddStudentCourse.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR',
  'STUDENT_NOT_EXIST', 'STUDENT_YEAR_NOT_EXIST',
  'STUDENT_ATTENDANCE_EXIST']);

module.exports = AddStudentCourse;
