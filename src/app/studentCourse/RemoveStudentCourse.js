const Operation = require('src/app/Operation');

class RemoveStudentCourse extends Operation {
  constructor({ studentCoursesRepository }) {
    super();
    this.studentCoursesRepository = studentCoursesRepository;
  }

  async execute({ user, params }) {
    const { SUCCESS, ERROR, NOT_EXIST_COURSE } = this.outputs;
    try {
      let studentCourseData = await this.studentCoursesRepository._getByArgs({
        where: {
          id: params.id
        }
      });

      if (!studentCourseData) {
        const error = new Error('NOT_EXIST_COURSE');
        throw error;
      }

      // remove student detail
      let removeStudentData = await this.studentCoursesRepository._removeByArgs({
        where: {
          id: params.id
        }
      });

      this.emit(SUCCESS, removeStudentData);
    } catch (error) {
      switch (error.message) {
        case 'NOT_EXIST_COURSE':
          return this.emit(NOT_EXIST_COURSE, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

RemoveStudentCourse.setOutputs(['SUCCESS', 'ERROR', 'NOT_EXIST_COURSE']);

module.exports = RemoveStudentCourse;
