const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const ResourcesController = {
  get router() {
    const router = Router();

    // router.use(inject('userSerializer'));

    router.post('/', inject('addResource'), this.addResource);
    router.post('/getAll', inject('getAllResource'), this.getAllResource);

    return router;
  },

  addResource(req, res, next) {
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


      const { addResource } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = addResource.outputs;

      addResource
        .on(SUCCESS, (tag) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addResource").success,
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
              status: i18n.__("addResource").exist,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      addResource.execute(req);
    } catch (error) {
      logger.error(`Add resource Error : ${error}`);
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

  getAllResource(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.Family
        ]);

      const { getAllResource } = req;
      const { SUCCESS, ERROR } = getAllResource.outputs;

      getAllResource
        .on(SUCCESS, (tag) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getAllResource").success,
              data: tag
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getAllResource.execute(req);
    } catch (error) {
      logger.error(`Get all resource Error : ${error}`);
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

module.exports = ResourcesController;
