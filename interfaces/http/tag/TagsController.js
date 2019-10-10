const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const TagsController = {
  get router() {
    const router = Router();

    // router.use(inject('userSerializer'));

    router.post('/', inject('addTag'), this.addTag);
    router.post('/getAll', inject('getAllTag'), this.getAllTag);

    return router;
  },

  addTag(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin
        ]);


      const { addTag } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = addTag.outputs;

      addTag
        .on(SUCCESS, (tag) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addTag").success,
              data: tag
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
        .on(EXIST, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("addTag").exist,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      addTag.execute(req);
    } catch (error) {
      logger.error(`Add Tag Error : ${error}`);
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

  getAllTag(req, res, next) {
    const { logger } = req.container.cradle;
    const { getAllTag } = req;
    const { SUCCESS, ERROR } = getAllTag.outputs;

    getAllTag
      .on(SUCCESS, (tag) => {
        res
          .status(Status.CREATED)
          .json({
            status: i18n.__("common").Success,
            message: i18n.__("getAllTag").success,
            data: tag
          });
      })
      .on(ERROR, (error) => {
        logger.error(`Get All Tag Error : ${error}`);
        res
          .status(Status.INTERNAL_SERVER_ERROR)
          .json({
            message: i18n.__("common").default
          });
      });

    getAllTag.execute(req);
  }

};

module.exports = TagsController;
