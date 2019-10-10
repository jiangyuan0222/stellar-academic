const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const FamiliesController = {
  get router() {
    const router = Router();

    router.use(inject('familySerializer'));

    router.post('/', inject('addFamily'), this.add);
    router.get('/', inject('getFamily'), this.get);
    router.get('/:id', inject('getFamilyDetail'), this.getFamilyDetail);
    router.post('/getList', inject('getFamilyList'), this.getFamilyList);
    router.post('/note', inject('addFamilyNote'), this.addFamilyNote);
    // router.post('/getAll', inject('getFamilyList'), this.getFamilyList);
    router.put('/', inject('editFamily'), this.edit);
    router.post('/dashboard', inject('getFamilyDashboard'), this.dashboard);
    router.post('/find', inject('findFamily'), this.find);

    return router;
  },

  add(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.Family,
          strategies.SuperAdmin,
          strategies.SchoolAdmin,
          strategies.SchoolManager,
          strategies.SchoolStaff
        ]);

      const { addFamily, familySerializer } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, FAMILY_EXIST,
        EXIST_PHONE, EXIST_EMAIL, EXIST_USERNAME } = addFamily.outputs;

      addFamily
        .on(SUCCESS, (family) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addFamily").success,
              data: family
            });
        })
        .on(EXIST_USERNAME, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("addFamily").existUsername,
          });
        })
        .on(EXIST_EMAIL, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("addFamily").existEmail,
          });
        })
        .on(EXIST_PHONE, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("addFamily").existPhone,
          });
        })
        .on(FAMILY_EXIST, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("addFamily").exist,
          });
        })
        .on(VALIDATION_ERROR, (error) => {
          res.status(Status.BAD_REQUEST).json({
            type: 'ValidationError',
            details: error.details
          });
        })
        .on(ERROR, (error) => {
          throw (error);
        });

      addFamily.execute(req);
    } catch (error) {
      logger.error(`Add family error : ${error}`);
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

  edit(req, res, next) {
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

      const { editFamily } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, FAMILY_NOT_EXIST } = editFamily.outputs;

      editFamily
        .on(SUCCESS, (family) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("editFamily").success
            });
        })
        .on(FAMILY_NOT_EXIST, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("editFamily").notExist,
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

      editFamily.execute(req);
    } catch (error) {
      logger.error(`Edit family error : ${error}`);
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

  get(req, res, next) {
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

      const { getFamily } = req;
      const { SUCCESS, ERROR, FAMILY_NOT_EXIST } = getFamily.outputs;

      getFamily
        .on(SUCCESS, (family) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getFamily").success,
              data: family
            });
        })
        .on(FAMILY_NOT_EXIST, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("getFamily").notExist,
          });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getFamily.execute(req);
    } catch (error) {
      logger.error(`Get family error : ${error}`);
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

  getFamilyDetail(req, res, next) {

    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolManager,
          strategies.SchoolStaff
        ]);

      const { getFamilyDetail } = req;
      const { SUCCESS, ERROR, FAMILY_NOT_EXIST } = getFamilyDetail.outputs;

      getFamilyDetail
        .on(SUCCESS, (family) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getFamilyDetail").success,
              data: family
            });
        })
        .on(FAMILY_NOT_EXIST, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("getFamilyDetail").notExist,
          });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getFamilyDetail.execute(req);
    } catch (error) {
      logger.error(`Get family detail error : ${error}`);
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

  getFamilyList(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SuperAdmin,
          strategies.SchoolAdmin,
          strategies.SchoolManager,
          strategies.SchoolStaff
        ]);

      const { getFamilyList } = req;
      const { SUCCESS, ERROR, FAMILY_NOT_EXIST } = getFamilyList.outputs;

      getFamilyList
        .on(SUCCESS, (family) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getFamilyList").success,
              data: family
            });
        })
        .on(FAMILY_NOT_EXIST, (error) => {
          res.status(Status.BAD_REQUEST).json({
            status: i18n.__("common").Error,
            message: i18n.__("getFamilyList").notExist,
          });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getFamilyList.execute(req);
    } catch (error) {
      logger.error(`Get family list error : ${error}`);
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

  addFamilyNote(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolManager,
          strategies.SchoolStaff
        ]);

      const { addFamilyNote } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = addFamilyNote.outputs;

      addFamilyNote
        .on(SUCCESS, (family) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addFamilyNote").success,
              data: family
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

      addFamilyNote.execute(req);
    } catch (error) {
      logger.error(`Add family notes error : ${error}`);
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

  dashboard(req, res, next) {
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

      const { getFamilyDashboard } = req;
      const { SUCCESS, ERROR } = getFamilyDashboard.outputs;

      getFamilyDashboard
        .on(SUCCESS, (data) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getFamilyDashboard").success,
              data
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getFamilyDashboard.execute(req);

    } catch (error) {
      logger.error(`Get family dashboard Error : ${error}`);
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

  find(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolManager,
          strategies.SchoolStaff
        ]);

      const { findFamily } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = findFamily.outputs;

      findFamily
        .on(SUCCESS, (data) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("findFamily").success,
              data
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

      findFamily.execute(req);

    } catch (error) {
      logger.error(`Find family Error : ${error}`);
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

module.exports = FamiliesController;
