const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const multer = require('multer');
const crypto = require('crypto');
const path = require('path');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

let storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './public');
  },
  filename: (req, file, cb) => {
    crypto.pseudoRandomBytes(16, (err, raw) => {
      if (err) return cb(err);
      cb(null, raw.toString('hex') + path.extname(file.originalname));
    });
  }
});

let fileFilter = (req, file, cb) => {
  if (file.mimetype.match('/*/')) {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const UsersController = {
  get router() {
    const router = Router();

    router.use(inject('userSerializer'));

    router.post('/sign-up', inject('signupUser'), this.signupUser);
    router.get('/profile', inject('getProfile'), this.getProfile);
    router.post('/check', inject('checkUser'), this.checkUser);
    router.get('/school-list', inject('getSchoolList'), this.getSchoolList);
    router.post('/login', inject('userLogin'), this.userLogin);
    router.get('/', inject('getAllUsers'), this.index);
    router.post('/get', inject('getCustomUser'), this.getCustomUser);
    // router.get('/:id', inject('getUser'), this.show);
    router.post('/', inject('createUser'), this.create);
    router.delete('/:id', inject('deleteUser'), this.delete);
    router.put('/change-password', inject('userChangePassword'), this.changePassword);
    router.put('/profile', inject('userUpdateProfile'), this.updateProfile);
    router.put('/profile/:id', inject('updateProfileById'), this.updateProfileById);
    router.put('/password', inject('userUpdateProfile'), this.updateProfile);
    router.post('/request', inject('addUserRequest'), this.addRequest);
    router.put('/request/:id', inject('editUserRequest'), this.editRequest);
    router.delete('/request/:id', inject('removeUserRequest'), this.removeUserRequest);
    router.post('/preRequest', inject('addPreUserRequest'), this.addPreUserRequest);
    router.post('/preRequest/getList', inject('getPreUserRequest'), this.getPreUserRequest);
    // router.put('/request/status/:id', inject('addUserRequest'), this.addRequest);
    router.post('/request/get-all', inject('getAllUserRequest'), this.getAllRequest);
    router.post('/files', inject('addUserFile'), this.addFile);
    router.get('/files/:id', inject('getUserFileById'), this.getUserFileById);
    router.post('/files/get-all', inject('getAllUserFile'), this.getAllFile);
    router.delete('/files/:id', inject('removeUserFile'), this.removeFile);
    router.post('/order', inject('addUserOrder'), this.addUserOrder);
    router.post('/order/statistic', inject('getUserOrderStatistic'), this.getUserOrderStatistic);
    router.put('/order/status', inject('changeUserOrderStatus'), this.changeUserOrderStatus);
    router.post('/order/getList', inject('getUserOrderList'), this.getUserOrderList);
    router.delete('/order/:id', inject('removeUserOrder'), this.removeUserOrder);
    router.post('/file-upload', multer({
      storage: storage,
      limits: {
        fileSize: 1024 * 1024 * 50
      },
      fileFilter: fileFilter
    }).single('file'), this.uploadFile);

    return router;
  },

  index(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { getAllUsers, userSerializer } = req;
      const { SUCCESS, ERROR } = getAllUsers.outputs;

      getAllUsers
        .on(SUCCESS, (users) => {
          res
            .status(Status.OK)
            .json(users.map(userSerializer.serialize));
        })
        .on(ERROR, next);

      getAllUsers.execute();
    } catch (error) {
      logger.error(`Get all user Error : ${error}`);
    }
  },

  show(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { getUser, userSerializer } = req;

      const { SUCCESS, ERROR, NOT_FOUND } = getUser.outputs;

      getUser
        .on(SUCCESS, (user) => {
          res
            .status(Status.OK)
            .json(userSerializer.serialize(user));
        })
        .on(NOT_FOUND, (error) => {
          res.status(Status.NOT_FOUND).json({
            type: 'NotFoundError',
            details: error.details
          });
        })
        .on(ERROR, next);

      getUser.execute(Number(req.params.id));
    } catch (error) {
      logger.error(`Ger user Error : ${error}`);
    }
  },

  create(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { createUser, userSerializer } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = createUser.outputs;

      createUser
        .on(SUCCESS, (user) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              data: user
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
            })
        });

      createUser.execute(req.body);
    } catch (error) {
      logger.error(`Create user Error : ${error}`);
    }
  },

  delete(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { deleteUser } = req;
      const { SUCCESS, ERROR, NOT_FOUND } = deleteUser.outputs;

      deleteUser
        .on(SUCCESS, () => {
          res.status(Status.ACCEPTED).end();
        })
        .on(NOT_FOUND, (error) => {
          res.status(Status.NOT_FOUND).json({
            type: 'NotFoundError',
            details: error.details
          });
        })
        .on(ERROR, next);

      deleteUser.execute(Number(req.params.id));
    } catch (error) {
      logger.error(`Delete user Error : ${error}`);
    }
  },

  signupUser(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { signupUser } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR,
        DUPLICATE_VALUE, EXIST_USERNAME } = signupUser.outputs;

      signupUser
        .on(SUCCESS, (user) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              data: user
            });
        })
        .on(EXIST_USERNAME, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").Error,
              message: i18n.__("createUser").existUsername
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
        .on(DUPLICATE_VALUE, (error) => {
          let status = Status.NOT_ACCEPTABLE;
          switch (error) {
            case 'email':
              res
                .status(status)
                .json({
                  status: i18n.__("common").DUPLICATE_VALUE,
                  message: i18n.__("createUser").existEmail
                });
              break;
            case 'phone':
              res
                .status(status)
                .json({
                  status: i18n.__("common").DUPLICATE_VALUE,
                  message: i18n.__("createUser").existPhone
                });
              break;
            default:
              logger.error(error);
              break;
          }
        })
        .on(ERROR, (error) => {
          logger.error(error);
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            })
        });
      signupUser.execute(req);

    } catch (error) {
      logger.error(`SignUp user Error : ${error}`);
    }
  },

  getProfile(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);


      const { getProfile } = req;

      const { SUCCESS, ERROR, NOT_FOUND } = getProfile.outputs;

      getProfile
        .on(SUCCESS, (user) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              data: user
            });
        })
        .on(NOT_FOUND, (error) => {
          res.status(Status.NOT_FOUND).json({
            type: 'NotFoundError',
            details: error.details
          });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      getProfile.execute(req);
    } catch (error) {
      logger.error(`User Get Profile Error : ${error}`);
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

  checkUser(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { checkUser } = req;

      const { SUCCESS, ERROR, NOT_FOUND, VALIDATION_ERROR } = checkUser.outputs;

      checkUser
        .on(SUCCESS, (user) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              data: user
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

      checkUser.execute(req);
    } catch (error) {
      logger.error(`Check user Error : ${error}`);
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

  getCustomUser(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { getCustomUser } = req;

      const { SUCCESS, VALIDATION_ERROR, ERROR, USER_NOT_EXIST } = getCustomUser.outputs;

      getCustomUser
        .on(SUCCESS, (user) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              data: user
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
        .on(USER_NOT_EXIST, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").Error,
              message: i18n.__("getCustomUser").notExist
            })
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getCustomUser.execute(req);
    } catch (error) {
      logger.error(`Get custom user Error : ${error}`);
      switch (error.message) {
        default:
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            })
          break;
      }
    }
  },

  getSchoolList(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      const { getSchoolList } = req;

      const { SUCCESS, ERROR } = getSchoolList.outputs;

      getSchoolList
        .on(SUCCESS, (user) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getSchoolList").success,
              data: user
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      getSchoolList.execute(req);
    } catch (error) {
      logger.error(`Get School Error : ${error}`);
      switch (error.message) {
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

  userLogin(req, res, next) {
    const { logger } = req.container.cradle;

    try {
      const { userLogin } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, USER_NOT_EXIST, INVALID_PASSWORD, USER_BANNED } = userLogin.outputs;

      userLogin
        .on(SUCCESS, (user) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              data: user
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
        .on(USER_NOT_EXIST, (error) => {
          res
            .status(Status.OK)
            .json({
              status: USER_NOT_EXIST,
              message: i18n.__("loginUser").notExist
            });
        })
        .on(INVALID_PASSWORD, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: INVALID_PASSWORD,
              message: i18n.__("loginUser").InvalidPassword
            });
        })
        .on(USER_BANNED, (error) => {
          res
            .status(Status[410])
            .json({
              message: i18n.__("common").bannedUser
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });

      userLogin.execute(req);
    } catch (error) {
      logger.error(`User login Error : ${error}`);
      switch (error.message) {
        default:
          res
            .status(Status.INTERNAL_SERVER_ERROR)
            .json({
              message: i18n.__("common").default
            })
          break;
      }
    }

  },

  changePassword(req, res, next) {
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

      const { userChangePassword } = req;
      const { SUCCESS, ERROR, INVALID_PASSWORD, VALIDATION_ERROR } = userChangePassword.outputs;

      userChangePassword
        .on(SUCCESS, () => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("userChangePassword").success
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
        .on(INVALID_PASSWORD, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: INVALID_PASSWORD,
              message: i18n.__("userChangePassword").InvalidPassword
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      userChangePassword.execute(req);
    } catch (error) {
      logger.error(`User change password Error : ${error}`);
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

  updateProfile(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { userUpdateProfile } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST_PHONE, EXIST_EMAIL, EXIST_USERNAME } = userUpdateProfile.outputs;

      userUpdateProfile
        .on(SUCCESS, () => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("userUpdateProfile").success
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
        .on(EXIST_USERNAME, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("userUpdateProfile").existUsername,
              message: error.details
            });
        })
        .on(EXIST_PHONE, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("userUpdateProfile").existPhone,
              message: error.details
            });
        })
        .on(EXIST_EMAIL, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("userUpdateProfile").existEmail,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      userUpdateProfile.execute(req);
    } catch (error) {
      logger.error(`User update profile Error : ${error}`);
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

  updateProfileById(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { updateProfileById } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, EXIST_PHONE, EXIST_EMAIL, EXIST_USERNAME } = updateProfileById.outputs;

      updateProfileById
        .on(SUCCESS, () => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("updateProfileById").success
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
        .on(EXIST_USERNAME, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("updateProfileById").existUsername,
              message: error.details
            });
        })
        .on(EXIST_PHONE, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("updateProfileById").existPhone,
              message: error.details
            });
        })
        .on(EXIST_EMAIL, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("updateProfileById").existEmail,
              message: error.details
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      updateProfileById.execute(req);
    } catch (error) {
      logger.error(`User update profile Error : ${error}`);
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

  addRequest(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { addUserRequest } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = addUserRequest.outputs;

      addUserRequest
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addUserRequest").success,
              data
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

      addUserRequest.execute(req);

    } catch (error) {
      logger.error(`Add user request Error : ${error}`);
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

  editRequest(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { editUserRequest } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = editUserRequest.outputs;

      editUserRequest
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("editUserRequest").success,
              data
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

      editUserRequest.execute(req);
    } catch (error) {
      logger.error(`Edit user request Error : ${error}`);
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

  getPreUserRequest(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);


      const { getPreUserRequest } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getPreUserRequest.outputs;

      getPreUserRequest
        .on(SUCCESS, (studentCourse) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getPreUserRequest").success,
              data: studentCourse
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

      getPreUserRequest.execute(req);
    } catch (error) {
      logger.error(`Get pre user request Error : ${error}`);
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

  addPreUserRequest(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);


      const { addPreUserRequest } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = addPreUserRequest.outputs;

      addPreUserRequest
        .on(SUCCESS, (studentYear) => {
          res
            .status(Status.CREATED)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addPreUserRequest").success,
              data: studentYear
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

      addPreUserRequest.execute(req);
    } catch (error) {
      logger.error(`Add pre user request error : ${error}`);
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

  removeUserRequest(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { removeUserRequest } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = removeUserRequest.outputs;

      removeUserRequest
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("removeUserRequest").success,
              data
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

      removeUserRequest.execute(req);
    } catch (error) {
      logger.error(`Remove User Request Error : ${error}`);
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

  addUserOrder(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { addUserOrder } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, FAMILY_NOT_EXIST } = addUserOrder.outputs;

      addUserOrder
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addUserOrder").success,
              data
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
        .on(FAMILY_NOT_EXIST, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").Error,
              message: i18n.__("addUserOrder").notExistFamily
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      addUserOrder.execute(req);
    } catch (error) {
      logger.error(`Add user order Error : ${error}`);
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

  getUserOrderStatistic(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { getUserOrderStatistic } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getUserOrderStatistic.outputs;

      getUserOrderStatistic
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getUserOrderStatistic").success,
              data
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
      getUserOrderStatistic.execute(req);
    } catch (error) {
      logger.error(`Get user order statistic Error : ${error}`);
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

  changeUserOrderStatus(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { changeUserOrderStatus } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = changeUserOrderStatus.outputs;

      changeUserOrderStatus
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("changeUserOrderStatus").success
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
      changeUserOrderStatus.execute(req);
    } catch (error) {
      logger.error(`Change user order status Error : ${error}`);
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

  getUserOrderList(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager,
          strategies.Family
        ]);

      const { getUserOrderList } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getUserOrderList.outputs;

      getUserOrderList
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getUserOrderList").success,
              data
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
      getUserOrderList.execute(req);
    } catch (error) {
      logger.error(`Get user order list Error : ${error}`);
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

  removeUserOrder(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { removeUserOrder } = req;
      const { SUCCESS, ERROR, ORDER_NOT_EXIST } = removeUserOrder.outputs;

      removeUserOrder
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("removeUserOrder").success
            });
        })
        .on(ORDER_NOT_EXIST, (error) => {
          res
            .status(Status.UNPROCESSABLE_ENTITY)
            .json({
              status: i18n.__("common").Error,
              message: i18n.__("removeUserOrder").notExistOrder
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      removeUserOrder.execute(req);
    } catch (error) {
      logger.error(`Remove user order Error : ${error}`);
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

  getAllRequest(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { getAllUserRequest } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getAllUserRequest.outputs;

      getAllUserRequest
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getAllUserRequest").success,
              data
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

      getAllUserRequest.execute(req);
    } catch (error) {
      logger.error(`Get all request Error : ${error}`);
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

  addFile(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { addUserFile } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = addUserFile.outputs;

      addUserFile
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("addUserFile").success,
              data
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
      addUserFile.execute(req);
    } catch (error) {
      logger.error(`Add file Error : ${error}`);
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

  getUserFileById(req, res, next) {
    const { logger } = req.container.cradle;
    try {
      // check authentication
      check(req, next = (isAuthenticated) => {
        if (!isAuthenticated) {
          throw new Error('UnAuthenticated');
        }
      }, [
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { getUserFileById } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getUserFileById.outputs;

      getUserFileById
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getUserFileById").success,
              data
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
      getUserFileById.execute(req);
    } catch (error) {
      logger.error(`Get user file by id Error : ${error}`);
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

  getAllFile(req, res, next) {
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
          strategies.SchoolStaff,
          strategies.SchoolManager
        ]);

      const { getAllUserFile } = req;
      const { SUCCESS, ERROR } = getAllUserFile.outputs;

      getAllUserFile
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("getAllUserFile").success,
              data
            });
        })
        .on(ERROR, (error) => {
          throw error;
        });
      getAllUserFile.execute(req);
    } catch (error) {
      logger.error(`Get all file Error : ${error}`);
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

  removeFile(req, res, next) {
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

      const { removeUserFile } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR, FILE_NOT_EXIST } = removeUserFile.outputs;

      removeUserFile
        .on(SUCCESS, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Success,
              message: i18n.__("removeUserFile").success
            });
        })
        .on(FILE_NOT_EXIST, (data) => {
          res
            .status(Status.OK)
            .json({
              status: i18n.__("common").Error,
              message: i18n.__("removeUserFile").notExistFile
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
      removeUserFile.execute(req);
    } catch (error) {
      logger.error(`Remove file Error : ${error}`);
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

  uploadFile(req, res, next) {
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
          strategies.SchoolAdmin,
          strategies.SchoolStaff,
          strategies.SchoolManager,
          strategies.SuperAdmin
        ]);

      if (!req.file)
        res
          .status(Status.UNPROCESSABLE_ENTITY)
          .json({
            message: i18n.__("uploadFile").notFile
          });
      else
        res
          .status(Status.CREATED)
          .json({
            status: i18n.__("common").Success,
            message: i18n.__("uploadFile").success,
            data: {
              path: req.file.path
            }
          });

    } catch (error) {
      logger.error(`Upload file error`);
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

module.exports = UsersController;
