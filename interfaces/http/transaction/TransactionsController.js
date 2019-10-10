const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const TransactionsController = {
  get router() {
    const router = Router();

    // router.use(inject('userSerializer'));

    router.post('/', inject('createTransaction'), this.createTransaction);
    router.post('/getList', inject('getTransaction'), this.getTransaction);
    router.get('/success', inject('transactionSuccess'), this.transactionSuccess);
    router.get('/fail', inject('transactionFail'), this.transactionFail);

    return router;
  },

  createTransaction(req, res, next) {
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

      const { createTransaction } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = createTransaction.outputs;

      createTransaction
        .on(SUCCESS, (transaction) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("createTransaction").success,
              data: transaction
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
              status: i18n.__("createTransaction").exist,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      createTransaction.execute(req);
    } catch (error) {
      logger.error(`Create Transaction Error : ${error}`);
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

  getTransaction(req, res, next) {

    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SuperAdmin
        ]);


      const { getTransaction } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = getTransaction.outputs;

      getTransaction
        .on(SUCCESS, (transaction) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getTransaction").success,
              data: transaction
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
              status: i18n.__("getTransaction").exist,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getTransaction.execute(req);
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
  },

  transactionSuccess(req, res, next) {

    const { transactionSuccess } = req;
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = transactionSuccess.outputs;

    transactionSuccess
      .on(SUCCESS, (transaction) => {
        // res
        //   .status(Status.CREATED)
        //   .json({
        //     status: i18n.__("common").Success
        //   });
        res.render("paymentSuccess");
      })
      .on(VALIDATION_ERROR, (error) => {
        res
          .status(Status.UNPROCESSABLE_ENTITY)
          .json({
            status: i18n.__("common").ValidationError
          });
      })
      .on(ERROR, (error) => {
        res
          .status(Status.INTERNAL_SERVER_ERROR)
          .json({
            message: i18n.__("common").default
          });
      });

    transactionSuccess.execute(req);
  },

  transactionFail(req, res, next) {

    const { transactionFail } = req;
    const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST } = transactionFail.outputs;

    transactionFail
      .on(SUCCESS, (transaction) => {
        // res
        //   .status(Status.CREATED)
        //   .json({
        //     status: i18n.__("common").Success
        //   });
        res.render("paymentFail");
      })
      .on(VALIDATION_ERROR, (error) => {
        res
          .status(Status.UNPROCESSABLE_ENTITY)
          .json({
            status: i18n.__("common").ValidationError
          });
      })
      .on(ERROR, (error) => {
        res
          .status(Status.INTERNAL_SERVER_ERROR)
          .json({
            message: i18n.__("common").default
          });
      });

    transactionFail.execute(req);
  },

};

module.exports = TransactionsController;
