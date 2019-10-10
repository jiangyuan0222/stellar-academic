const Operation = require("src/app/Operation");
const User = require("src/domain/user/User");
const joi = require("joi");
const jwt = require("jsonwebtoken");

class ReEnrollStudent extends Operation {
  constructor({ studentsRepository, studentYearsRepository }) {
    super();
      this.studentsRepository = studentsRepository;
      this.studentYearsRepository = studentYearsRepository;
      this.isEnrolled = false;
  }

  async execute({ body, user, auth }) {
    const {
      SUCCESS,
      ERROR,
      VALIDATION_ERROR,
      NOT_EXIST_STUDENT,
      NOT_EXIST_STUDENTYEAR
    } = this.outputs;
    let userType = auth.strategy,
      user_id;

    try {
      cron(86400000, () => this.test(), this.reEnrollStudent());
      this.emit(SUCCESS);
    } catch (error) {
      switch (error.message) {
        case "ValidationError":
          return this.emit(VALIDATION_ERROR, error);
        case "NOT_EXIST_STUDENT":
          return this.emit(NOT_EXIST_STUDENT, error);
        case "NOT_EXIST_STUDENTYEAR":
          return this.emit(NOT_EXIST_STUDENTYEAR, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
  async test(){
    let month = new Date().getMonth() + 1;
    let date = new Date().getDate();
    if( month == 7 && date == 1 ){
      console.log("Time to do that");
    }
    console.log("test function" + month + "/" + date);
  }

  async reEnrollStudent(){
    console.log("checked if today is the re-enrolled day.");
    let month = new Date().getMonth() + 1;
    let date = new Date().getDate();
    if (month == 7 && date == 1) {
      console.log("Time to do re - enroll student");
      let activeStudents = await this.studentsRepository._getAllByArgs({
        where: {
          status: 'active'
        }
      });
      for (let index = 0; index < activeStudents.length; index++) {
        let student_id = activeStudents[index].dataValues.id;
        this.updateDataByStudentId(student_id);
      }
    }
    else console.log("today is not re-enrolled day");
  }

  async updateDataByStudentId(student_id){
      let studentData = await this.studentsRepository.getById(student_id);
      //console.log(studentData);
      if (!studentData) {
        const error = new Error("NOT_EXIST_STUDENT");
        throw error;
      }
      let updatedData = studentData.dataValues;
      let current_grade = studentData.dataValues.grade_level;
      let next_grade, stillStudent = 0;
      if (!isNaN(current_grade[0])){
        let id = current_grade.substring(0, 2);
        switch (id){
          case "1s":
            next_grade = "2nd Grade";
            updatedData.grade_level = next_grade;
            stillStudent = 1;
            break;
          case "2n":
            next_grade = "3rd Grade";
            updatedData.grade_level = next_grade;
            stillStudent = 1;
            break;
          case "3r":
          case "4t":
          case "5t":
          case "6t":
          case "7t":
          case "8t":
          case "9t":
            next_grade = Number(current_grade[0]) + 1 + 'th Grade';
            updatedData.grade_level = next_grade;
            stillStudent = 1;
            break;
          case "10":
          case "11":
            next_grade = Number(id) + 1 + 'th Grade';
            updatedData.grade_level = next_grade;
            stillStudent = 1;
            break;
          case "12":
            updatedData.status = 'graduated';
            updatedData.graduation_date = new Date();
            break;
          default:
            break;

        }
      }
      //console.log(updatedData);
      // edit student detail

      if( stillStudent == 1 ){
        let studentYearData = await this.studentYearsRepository._getAllByArgs({
          where: {
            student_id: student_id
          },
          order:[
            ['created_at', 'DESC']
          ]
        });
        if( !studentYearData ){
          const error = new Error('NOT_EXIST_STUDENTYEAR');
          throw error;
        }
        let updatedYearData = studentYearData[0].dataValues;
        let year = updatedYearData.school_year;
        year = '20' + Number(year.substring(5, 7)) + '/' + ( Number(year.substring(5, 7)) + 1 );

        // updatedYearData.school_year = year;
        // updatedYearData.school_grade = updatedData.grade_level;
        let addYearData = {
          student_id: student_id,
          school_year: year,
          school_grade: updatedData.grade_level
        }
        this.studentYearsRepository.add(addYearData);

      }
      await this.studentsRepository._editByArgs(updatedData, {
        where: {
          id: student_id
        }
      });

      console.log("Student successfully re-enrolled.");
  }
}

function cron(ms, fn, isEnrolled) {
  function cb() {
    clearTimeout(timeout);
    timeout = setTimeout(cb, ms);
    fn();
  }
  let timeout = setTimeout(cb, ms);
  return () => { };
}

ReEnrollStudent.setOutputs([
  "SUCCESS",
  "ERROR",
  "VALIDATION_ERROR",
  "NOT_EXIST_STUDENT",
  'NOT_EXIST_STUDENTYEAR'
]);

module.exports = ReEnrollStudent;
