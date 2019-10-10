const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const NotificationsController = {
  get router() {
    const router = Router();

    // router.use(inject('userSerializer'));

    router.post('/get', inject('getNotification'), this.getNotification);
    router.post('/sendCourseApprovalNotification', inject('sendCourseApprovalNotification'), this.sendCourseApprovalNotification);
    router.post('/viewNotification', inject('viewNotification'), this.viewNotification);
    return router;
  },

  getNotification(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.Family,
          strategies.SchoolAdmin,
          strategies.SchoolManager,
          strategies.SchoolStaff
        ]);

      const { getNotification } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getNotification.outputs;

      getNotification
        .on(SUCCESS, (notification, count) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getNotification").success,
              data: notification,
              count: count
            });
        })
        .on(VALIDATION_ERROR, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").ValidationError,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getNotification.execute(req);
    } catch (error) {
      logger.error(`Get notification Error : ${error}`);
      switch (error.message) {
        case 'UnAuthenticated':
          res
            .status(Status.UNAUTHORIZED)
            .json({
              message: i18n.__("common").unAuth
            });
          break;
        default:
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            });
          break;
      }
    }
  },

  sendCourseApprovalNotification(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
        strategies.Family,
        strategies.SchoolAdmin,
        strategies.SchoolManager,
        strategies.SchoolStaff
      ]);

      const { sendCourseApprovalNotification } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = sendCourseApprovalNotification.outputs;

      sendCourseApprovalNotification
        .on(SUCCESS, (notification) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("sendCourseApprovalNotification").success,
              data: notification
            });
        })
        .on(VALIDATION_ERROR, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").ValidationError,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      sendCourseApprovalNotification.execute(req);
    } catch (error) {
      logger.error(`Get notification Error : ${error}`);
      switch (error.message) {
        case 'UnAuthenticated':
          res
            .status(Status.UNAUTHORIZED)
            .json({
              message: i18n.__("common").unAuth
            });
          break;
        default:
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            });
          break;
      }
    }
  },

  viewNotification(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
        strategies.Family,
        strategies.SchoolAdmin,
        strategies.SchoolManager,
        strategies.SchoolStaff
      ]);

      const { viewNotification } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = viewNotification.outputs;

      viewNotification
        .on(SUCCESS, (notification) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("viewNotification").success,
              data: notification
            });
        })
        .on(VALIDATION_ERROR, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").ValidationError,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      viewNotification.execute(req);
    } catch (error) {
      logger.error(`Get notification Error : ${error}`);
      switch (error.message) {
        case 'UnAuthenticated':
          res
            .status(Status.UNAUTHORIZED)
            .json({
              message: i18n.__("common").unAuth
            });
          break;
        default:
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            });
          break;
      }
    }
  }
};

module.exports = NotificationsController;
