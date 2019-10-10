const Operation = require('src/app/Operation');
const joi = require('joi');

class SendCourseApprovalRequest extends Operation {
  constructor({ studentCoursesRepository, studentYearsRepository, studentsRepository,
    coursesRepository, notificationsRepository }) {
    super();
    this.studentCoursesRepository = studentCoursesRepository,
      this.studentsRepository = studentsRepository,
      this.studentYearsRepository = studentYearsRepository,
      this.coursesRepository = coursesRepository,
      this.notificationsRepository = notificationsRepository,
      this.validationSchema = joi.object().keys({
        student_year_id: joi.string().required(),
      });
  }

  async execute({ body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST, STUDENT_YEAR_NOT_EXIST,
      STUDENT_COURSE_EXIST, COURSE_NOT_EXIST } = this.outputs;

    try {
      let notificationData;
      const obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }
      notificationData = {
        user_id: 'U1564691033253L3VHW', //current send notification to static user_id
        type: 'New Student Course',
        object_id: body.student_year_id,
        object_type: 'add course'
      };
      let newNotificationData = await this.notificationsRepository.add(
        notificationData
      );

      this.emit(SUCCESS, newNotificationData);
    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
      }
    }
  }
}

SendCourseApprovalRequest.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR',
  'STUDENT_NOT_EXIST', 'STUDENT_YEAR_NOT_EXIST',
  'STUDENT_COURSE_EXIST', 'COURSE_NOT_EXIST']);

module.exports = SendCourseApprovalRequest;
