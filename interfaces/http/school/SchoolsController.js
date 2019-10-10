const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const SchoolsController = {
  get router() {
    const router = Router();

    router.post("/", inject("addSchool"), this.addSchool);
    router.get("/", inject("getAllSchool"), this.getSchool);
    router.get(
      "/getAllSchoolStaff",
      inject("getAllSchoolStaff"),
      this.getAllSchoolStaff
    );
    router.post(
      "/addSchoolStaff",
      inject("addSchoolStaff"),
      this.addSchoolStaff
    );
    router.post(
      "/editSchoolStaff",
      inject("editSchoolStaff"),
      this.editSchoolStaff
    );
    return router;
  },

  addSchool(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      // check authentication
      check(
        req,
        (next = isAuthenticated => {
          if (!isAuthenticated) {
            throw new Error("UnAuthenticated");
          }
        }),
        [strategies.SuperAdmin]
      );

      const { addSchool } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        EMAIL_EXIST,
        PHONE_EXIST
      } = addSchool.outputs;

      addSchool
        .on(SUCCESS, schoolData => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addSchool").success,
            data: schoolData
          });
        })
        .on(EMAIL_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").Error,
            message: i18n.__("addSchool").existEmail
          });
        })
        .on(PHONE_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").Error,
            message: i18n.__("addSchool").existPhone
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addSchool.execute(req);
    } catch (error) {
      logger.error(`Add school Error : ${error}`);
      switch (error.message) {
        case "UnAuthenticated":
          res.status(Status.UNAUTHORIZED).json({
            message: i18n.__("common").unAuth
          });
          break;
        default:
          res.status(Status.INTERNAL_SERVER_ERROR).json({
            message: i18n.__("common").default
          });
          break;
      }
    }
  },

  getSchool(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      // check authentication
      // check(req, next = (isAuthenticated) => {
      //   if (!isAuthenticated) {
      //     throw new Error('UnAuthenticated');
      //   }
      // }, [
      //     strategies.SuperAdmin
      //   ]);

      const { getAllSchool } = req;
      const { SUCCESS, ERROR } = getAllSchool.outputs;

      getAllSchool
        .on(SUCCESS, schoolData => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getAllSchool").success,
            data: schoolData
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      getAllSchool.execute(req);
    } catch (error) {
      logger.error(`Get all school Error : ${error}`);
      switch (error.message) {
        case "UnAuthenticated":
          res.status(Status.UNAUTHORIZED).json({
            message: i18n.__("common").unAuth
          });
          break;
        default:
          res.status(Status.INTERNAL_SERVER_ERROR).json({
            message: i18n.__("common").default
          });
          break;
      }
    }
  },

  getAllSchoolStaff(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      check(
        req,
        (next = isAuthenticated => {
          if (!isAuthenticated) {
            throw new Error("UnAuthenticated");
          }
        }),
        [strategies.Family, strategies.SchoolAdmin]
      );

      const { getAllSchoolStaff } = req;
      const { SUCCESS, ERROR } = getAllSchoolStaff.outputs;

      getAllSchoolStaff
        .on(SUCCESS, schoolData => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getAllSchoolStaff").success,
            data: schoolData
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      getAllSchoolStaff.execute(req);
    } catch (error) {
      logger.error(`Get all school staff Error : ${error}`);
      switch (error.message) {
        case "UnAuthenticated":
          res.status(Status.UNAUTHORIZED).json({
            message: i18n.__("common").unAuth
          });
          break;
        default:
          res.status(Status.INTERNAL_SERVER_ERROR).json({
            message: i18n.__("common").default
          });
          break;
      }
    }
  },

  addSchoolStaff(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      // check authentication
      check(
        req,
        (next = isAuthenticated => {
          if (!isAuthenticated) {
            throw new Error("UnAuthenticated");
          }
        }),
        [strategies.Family, strategies.SchoolAdmin]
      );

      const { addSchoolStaff } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        EXIST_EMAIL,
        EXIST_USER
      } = addSchoolStaff.outputs;

      addSchoolStaff
        .on(SUCCESS, schoolData => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addSchoolStaff").success,
            data: schoolData
          });
        })
        .on(EXIST_EMAIL, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").Error,
            message: i18n.__("addSchoolStaff").existEmail
          });
        })
        .on(EXIST_USER, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").Error,
            message: i18n.__("addSchoolStaff").existUserName
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addSchoolStaff.execute(req);
    } catch (error) {
      logger.error(`Add school Error : ${error}`);
      switch (error.message) {
        case "UnAuthenticated":
          res.status(Status.UNAUTHORIZED).json({
            message: i18n.__("common").unAuth
          });
          break;
        default:
          res.status(Status.INTERNAL_SERVER_ERROR).json({
            message: i18n.__("common").default
          });
          break;
      }
    }
  },

  editSchoolStaff(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      // check authentication
      check(
        req,
        (next = isAuthenticated => {
          if (!isAuthenticated) {
            throw new Error("UnAuthenticated");
          }
        }),
        [strategies.Family, strategies.SchoolAdmin]
      );

      const { editSchoolStaff } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        EXIST_EMAIL
      } = editSchoolStaff.outputs;

      editSchoolStaff
        .on(SUCCESS, schoolData => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("editSchoolStaff").success,
            data: schoolData
          });
        })
        // .on(EMAIL_EXIST, error => {
        //   res.status(Status.UNPROCESSABLE_ENTITY).json({
        //     status: i18n.__("common").Error,
        //     message: i18n.__("addSchool").existEmail
        //   });
        // })
        .on(EXIST_EMAIL, error => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("editSchoolStaff").existEmail
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      editSchoolStaff.execute(req);
    } catch (error) {
      logger.error(`Add school Error : ${error}`);
      switch (error.message) {
        case "UnAuthenticated":
          res.status(Status.UNAUTHORIZED).json({
            message: i18n.__("common").unAuth
          });
          break;
        default:
          res.status(Status.INTERNAL_SERVER_ERROR).json({
            message: i18n.__("common").default
          });
          break;
      }
    }
  }
};

module.exports = SchoolsController;
