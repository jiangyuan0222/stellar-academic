const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const CoursesController = {
  get router() {
    const router = Router();

    router.post('/get-all', inject('getCourse'), this.getFiltered);

    return router;
  },

  getFiltered(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.Family
        ]);


      const { getCourse } = req;
      const { SUCCESS, ERROR, COURSE_NOT_EXIST, VALIDATION_ERROR } = getCourse.outputs;

      getCourse
        .on(SUCCESS, (course) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getCourse").success,
              data: course
            });
        })
        .on(COURSE_NOT_EXIST, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              message: i18n.__("getCourse").notExist
            });
        })
        .on(VALIDATION_ERROR, (error) => {
          res.status(Status.BAD_REQUEST).json({
            type: 'ValidationError',
            details: error.details
          });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getCourse.execute(req);
    } catch (error) {
      logger.error(`Get Course Error : ${error}`);
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

module.exports = CoursesController;
