const Operation = require("src/app/Operation");
const User = require("src/domain/user/User");
const joi = require("joi");
const jwt = require("jsonwebtoken");

class ViewNotification extends Operation {
  constructor({
    notificationsRepository,
    NotificationModel,
  }) {
    super();
    this.notificationsRepository = notificationsRepository;
    this.NotificationModel = NotificationModel;
    this.notificationValidationSchema = joi.object().keys({
      // status: joi.string().valid('pending', 'completed').optional(),
      notification_id: joi.string().required()
    });
  }

  async execute({ body, user, params, auth }) {
    const {
      SUCCESS,
      ERROR,
      VALIDATION_ERROR,
      NOT_EXIST_STUDENT
    } = this.outputs;
    let userType = auth.strategy,
      user_id;

    try {
      let obj;
      obj = joi.validate(body, this.notificationValidationSchema);
      // switch (userType) {
      //   case "family":
      //     obj = joi.validate(body, this.familyValidationSchema);
      //     user_id = user.id;
      //     break;
      //   case "school_admin":
      //     obj = joi.validate(body, this.schoolAdminValidationSchema);
      //     user_id = body.user_id;
      //     break;
      //   default:
      //     break;
      // }

      if (obj.error) {
        const error = new Error("ValidationError");
        error.details = obj.error.details[0].message;
        throw error;
      }

      let notificationData = await this.notificationsRepository._getByArgs({
        where: { id: body.notification_id }
      });
      let new_notificationData = notificationData.dataValues;
      new_notificationData.is_view = 1;

      await this.notificationsRepository._editByArgs(
        new_notificationData,
        {
          where: {
            id: body.notification_id
          }
        }
      );
      let response_data = await this.notificationsRepository._getByArgs(
        {
          where: { id: body.notification_id }
        }
      )
      this.emit(SUCCESS, response_data);
    } catch (error) {
      switch (error.message) {
        case "ValidationError":
          return this.emit(VALIDATION_ERROR, error);
        case "NOT_EXIST_STUDENT":
          return this.emit(NOT_EXIST_STUDENT, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

ViewNotification.setOutputs([
  "SUCCESS",
  "ERROR",
  "VALIDATION_ERROR",
  "NOT_EXIST_STUDENT"
]);

module.exports = ViewNotification;
