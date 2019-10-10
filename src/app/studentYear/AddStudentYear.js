const Operation = require('src/app/Operation');
const joi = require('joi');

class AddStudentYear extends Operation {
  constructor({ studentYearsRepository, studentsRepository }) {
    super();
    this.studentYearsRepository = studentYearsRepository,
      this.studentsRepository = studentsRepository,
      this.validationSchema = joi.object().keys({
        student_id: joi.string().required(),
        school_year: joi.string().required(),
        school_grade: joi.string().valid('1st Grade',
          '2nd Grade',
          '3rd Grade',
          '4th Grade',
          '5th Grade',
          '6th Grade',
          '7th Grade',
          '8th Grade',
          '9th Grade',
          '10th Grade',
          '11th Grade',
          '12th Grade',
          'Kindergarten',
          'Adult',
          '1 Year Of College',
          '2 Years Of College',
          '3 Years Of College',
          '4 Years Of College').required(),
      });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST } = this.outputs;

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

      let StudentYearData = await this.studentYearsRepository.add({
        ...body
      })

      this.emit(SUCCESS, StudentYearData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case 'STUDENT_NOT_EXIST':
          return this.emit(STUDENT_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

AddStudentYear.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST']);

module.exports = AddStudentYear;
