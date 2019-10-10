const Operation = require('src/app/Operation');
const joi = require('joi');

class GetNotification extends Operation {
  constructor({ notificationsRepository, UserModel,
    NotificationModel, StudentTaskModel, UserRequestModel,
    TransactionModel, StudentCourseModel }) {
    super();
      this.notificationsRepository = notificationsRepository,
      this.UserModel = UserModel,
      this.UserRequestModel = UserRequestModel,
      this.StudentTaskModel = StudentTaskModel,
      this.NotificationModel = NotificationModel,
      this.TransactionModel = TransactionModel,
      this.StudentCoursModel = StudentCourseModel,
      this.validationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        status: joi.string().valid('Active', 'Banned').optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let query_obj, obj, notificationData,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC';
    try {

      obj = joi.validate(body, this.validationSchema);

      if (obj.error) {
        const error = new Error('ValidationError');
        error.details = obj.error.details[0].message;

        throw error;
      }

      query_obj = {
        include: [{
          model: this.StudentTaskModel,
          attributes: ['title'],
          as: 'student_task',
          required: false,
          where: {
            '$notifications.object_type$': 'student task'
          }
        }, {
          model: this.UserRequestModel,
          attributes: ['type', 'comment'],
          as: 'user_request',
          required: false,
          where: {
            '$notifications.object_type$': 'user request'
          }
        }, {
          model: this.TransactionModel,
          attributes: ['status', 'amount'],
          as: 'transaction',
          required: false,
          where: {
            '$notifications.object_type$': 'transaction'
          }
        },
        {
          model: this.StudentCoursModel,
          attributes: ['student_id', 'course_id', 'semester', 'grade', 'credit', 'resource', 'course_type'],
          as: 'student_course',
          required: false,
          where: {
            '$notifications.object_id$': 'SY1566295061551V5VA'
          }
        }
      ],
        order: [
          [orderBy, orderType]
        ],
        where: {
          user_id: user.id
        }
      };

      if (body.skip) {
        query_obj.offset = body.skip;
      }

      if (body.limit) {
        query_obj.limit = body.limit;
      }

      notificationData = await this.notificationsRepository._getAllByArgs(query_obj);
      let newnotificationData = await this.notificationsRepository._getAllByArgs(
        { where: { is_view: 0, user_id: user.id}}
      );
      let count = newnotificationData.length;
      if( count > 99 )
        count = "99+";
      notificationData = await this.NotificationModel.createMessage(notificationData);

      this.emit(SUCCESS, notificationData, count);

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

GetNotification.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetNotification;
