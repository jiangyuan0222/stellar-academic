const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const CoursesController = {
  get router() {
    const router = Router();

    // router.use(inject('userSerializer'));

    router.get('/', inject('getProgram'), this.get);

    return router;
  },

  get(req, res, next) {
    const { logger } = req.container.cradle;
    const { getProgram } = req;
    const { SUCCESS, ERROR, PROGRAM_NOT_EXIST } = getProgram.outputs;

    getProgram
      .on(SUCCESS, (family) => {
        res
          .status(Status.CREATED)
          .json({
            status: i18n.__("common").Success,
            message: i18n.__("getProgram").success,
            data: family
          });
      })
      .on(PROGRAM_NOT_EXIST, (error) => {
        res.status(Status.BAD_REQUEST).json({
          status: i18n.__("common").Error,
          message: i18n.__("getProgram").notExist,
        });
      })
      .on(ERROR, (error) => {
        logger.error(`Get program Error : ${error}`);
        res
          .status(Status.INTERNAL_SERVER_ERROR)
          .json({
            message: i18n.__("common").default
          });
      });

    getProgram.execute();
  }
};

module.exports = CoursesController;
