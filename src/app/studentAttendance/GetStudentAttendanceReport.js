const Operation = require('src/app/Operation');
const joi = require('joi');
const _ = require('lodash');
const moment = require('moment');

class GetStudentAttendanceReport extends Operation {
  constructor({ studentAttendancesRepository, studentsRepository, StudentYearModel, StudentAttendanceModel }) {
    super();
    this.studentAttendancesRepository = studentAttendancesRepository,
      this.studentsRepository = studentsRepository,
      this.StudentAttendanceModel = StudentAttendanceModel,
      this.StudentYearModel = StudentYearModel,
      this.Op = require('sequelize').Op,
      this.validationSchema = joi.object().keys({
        student_id: joi.array().items(joi.string()).optional()
      });
  }

  async execute({ body, user }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;

    try {

      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      let studentData = await this.studentsRepository._getAllByArgs(),
        res = [], query_obj;

      query_obj = {
        attributes: ['id', 'first_name', 'last_name', 'middle_name'],
        include: [{
          model: this.StudentYearModel,
          attributes: ['id', 'school_year', 'school_grade'],
          include: [{
            model: this.StudentAttendanceModel,
            as: 'student_attendances',
            separate: true,
            attributes: ['year', 'month', 'attendance']
          }],
          // where: {
          //   id: {
          //     [this.Op.in]: body.student_year_id
          //   }
          // }
        }],
        where: {
          user_id: user.id
        }
      };

      if (body.student_id) {
        query_obj.where.id = {
          [this.Op.in]: body.student_id
        }
      }

      _.forEach(studentData, (student, student_index) => {
        res.push({
          student: {
            id: student.id,
            first_name: student.first_name,
            last_name: student.last_name,
            middle_name: student.middle_name,
          },
          student_year: []
        })

        // for attendance
        _.forEach(student.student_years, (years, student_year_index) => {
          let absent_day = 0, present_day = 0,
            total_day = 0;

          _.forEach(years.student_attendances, (month) => {
            _.forEach(month.attendance, (attendance) => {
              total_day++;
              switch (attendance.student_status) {
                case "A":
                  absent_day++;
                  break;
                case "P":
                  present_day++;
                  break;
                default:
                  break;
              }
            })
          })
          res[student_index].student_year.push({
            school_year: years.school_year,
            school_grade: years.school_grade,
            absent_day: absent_day,
            present_day: present_day,
            total_day: total_day,
          })
        })
      });

      this.emit(SUCCESS, res);
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

GetStudentAttendanceReport.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetStudentAttendanceReport;
