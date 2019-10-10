const Operation = require('src/app/Operation');
const _ = require('lodash');

class GetFamilyDashboard extends Operation {
  constructor({ studentCoursesRepository, studentsRepository,
    StudentYearModel, StudentCourseModel, logger,
    StudentAttendanceModel }) {
    super();
    this.StudentYearModel = StudentYearModel,
      this.StudentAttendanceModel = StudentAttendanceModel,
      this.logger = logger,
      this.StudentCourseModel = StudentCourseModel,
      this.studentCoursesRepository = studentCoursesRepository,
      this.studentsRepository = studentsRepository;
  }

  async execute({ user }) {
    const { SUCCESS, ERROR } = this.outputs;

    try {

      let studentData = await this.studentsRepository._getAllByArgs({
        attributes: ['id', 'first_name', 'last_name', 'middle_name'],
        include: [{
          model: this.StudentYearModel,
          attributes: ['id', 'school_year', 'school_grade'],
          include: [{
            model: this.StudentCourseModel,
            as: 'student_courses',
            separate: true,
            attributes: ['grade']
          }, {
            model: this.StudentAttendanceModel,
            as: 'student_attendances',
            separate: true,
            attributes: ['year', 'month', 'attendance']
          }],
          limit: 1,
          order: [
            ['school_year', 'ASC']
          ],
        }],
        where: {
          user_id: user.id
        }
      }),
        res = [],
        grades_point = [
          { grade: 'A', point: 4.0 }, { grade: 'A', point: 4.0 }, { grade: 'A-', point: 3.7 },
          { grade: 'B+', point: 3.3 }, { grade: 'B', point: 3.0 }, { grade: 'B-', point: 2.7 },
          { grade: 'C+', point: 2.3 }, { grade: 'C', point: 2.0 }, { grade: 'C-', point: 1.7 },
          { grade: 'D+', point: 1.3 }, { grade: 'D', point: 1.0 }, { grade: 'D-', point: 0.7 },
          { grade: 'E', point: 4 }, { grade: 'P', point: 3 }, { grade: 'S', point: 2 },
          { grade: 'N', point: 1 }, { grade: 'F', point: 0.0 }, { grade: 'IP', point: 0.0 }];

      _.forEach(studentData, (student, student_index) => {
        let absent_day = 0, present_day = 0,
          total_day = 0,
          grades = [],
          total_point = 0,
          fall_semester = ["07", "08", "09", "10", "11", "12"],
          spring_semester = ["01", "02", "03", "04", "05", "06"],
          average_grade = null,
          is_all_grade = true,
          is_fall_grade = true,
          is_spring_grade = true,
          is_fall_attendance = false,
          is_spring_attendance = false,
          isFailed = false;

        /**
         * - semester list will be
         * FALL - fall
         * SUMMER - fall
         * SPRING - spring
         * FULL YEAR - spring
         */

        res.push({
          student: {
            id: student.id,
            first_name: student.first_name,
            last_name: student.last_name,
            middle_name: student.middle_name,
          }
        })

        // for attendance
        _.forEach(student.student_years, (years, index) => {
          _.forEach(years.student_attendances, (month) => {
            let semester = 'fall';

            if (spring_semester.includes(month.month)) {
              semester = 'spring';
            }

            _.forEach(month.attendance, (attendance) => {
              total_day++;
              if (attendance.student_status === "A") {
                if (semester === 'fall') is_fall_attendance = true;
                else if (semester === 'spring') is_spring_attendance = true;
                absent_day++;
              }
              else if (attendance.student_status === "P") {
                if (semester === 'fall') is_fall_attendance = true;
                else if (semester === 'spring') is_spring_attendance = true;
                present_day++;
              }
            })
          })
        })

        // for grade
        _.forEach(student.student_years, (years, index) => {
          _.forEach(years.student_courses, (course, index) => {
            if (course.grade === "F") {
              isFailed = true;
              return false;
            }

            let grades_point_index = _.findIndex(grades_point, (g) => g.grade === course.grade);

            if (!grades_point[grades_point_index]) {
              this.logger.error("course => ", course);
            }

            if (course.grade === null || course.semester === null) { is_all_grade = false }

            if (course.semester != null
              && ((course.semester === 'FALL' || course.semester === 'fall') || (course.semester === 'SUMMER' || course.semester === 'summer'))
              && course.grade === null) { is_fall_grade = false }

            if (course.semester != null
              && ((course.semester === 'SPRING' || course.semester === 'spring') || (course.semester === 'FULL YEAR' || course.semester === 'full year'))
              && course.grade === null) { is_spring_grade = false }

            total_point += grades_point[grades_point_index] ? grades_point[grades_point_index].point : 0;
            average_grade = Number(total_point / (index + 1)).toFixed(2);
            grades.push({
              grade: course.grade
            })
          })

          res[student_index].grades = grades;
          res[student_index].isFailed = isFailed;
          res[student_index].average_grade = average_grade;
          res[student_index].total_point = total_point;
          res[student_index].absent_day = absent_day;
          res[student_index].present_day = present_day;
          res[student_index].total_day = total_day;
          res[student_index].progress = 0;

          if (years.student_courses.length > 0) {
            if (is_all_grade && is_fall_attendance && is_spring_attendance) {
              res[student_index].progress = 100;
            } else if (is_fall_grade && is_fall_attendance && is_spring_grade) {
              res[student_index].progress = 75;
            } else if (is_fall_grade && is_fall_attendance) {
              res[student_index].progress = 50;
            } else if (is_fall_grade) {
              res[student_index].progress = 25;
            } else {
              res[student_index].progress = 0;
            }
          }

        })

      });

      this.emit(SUCCESS, res);
    } catch (error) {
      console.log(error);
      switch (error.message) {
        case 'ERROR':
          return this.emit(ERROR, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetFamilyDashboard.setOutputs(['SUCCESS', 'ERROR']);

module.exports = GetFamilyDashboard;
