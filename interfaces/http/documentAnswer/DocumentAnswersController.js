const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const DocumentAnswersController = {
  get router() {
    const router = Router();

    router.post('/', inject('addDocumentQuestion'), this.addDocumentQuestion);
    router.post('/getAll', inject('getDocumentQuestion'), this.getDocumentQuestion);

    return router;
  },

  addDocumentQuestion(req, res, next) {
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


      const { addDocumentQuestion } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, ANSWER_EXIST } = addDocumentQuestion.outputs;

      addDocumentQuestion
        .on(SUCCESS, (tag) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addDocumentQuestion").success,
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
        .on(ANSWER_EXIST, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").Error,
              message: i18n.__("addDocumentQuestion").existAnswer
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      addDocumentQuestion.execute(req);
    } catch (error) {
      logger.error(`Add `)
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

  getDocumentQuestion(req, res, next) {

    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.Family,
          strategies.SchoolAdmin
        ]);

      const { getDocumentQuestion } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getDocumentQuestion.outputs;

      getDocumentQuestion
        .on(SUCCESS, (tag) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getDocumentQuestion").success,
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
        .on(ERROR, (error) => {
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            });
        });

      getDocumentQuestion.execute(req);
    } catch (error) {
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

module.exports = DocumentAnswersController;
