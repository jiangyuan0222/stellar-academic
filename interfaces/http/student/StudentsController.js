const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const StudentsController = {
  get router() {
    const router = Router();

    // router.use(inject('userSerializer'));

    router.post("/", inject("addStudent"), this.add);
    router.put("/:id", inject("editStudent"), this.edit);
    router.post("/remove/:id", inject("removeStudent"), this.remove);
    router.post("/getAll", inject("getAllStudent"), this.getAll);
    router.post("/year", inject("addStudentYear"), this.addYear);
    router.get("/year/:student_id", inject("getStudentYear"), this.getYear);
    router.get(
      "/course/:student_id",
      inject("getStudentCourse"),
      this.getCourse
    );
    router.post("/course", inject("addStudentCourse"), this.addCourse);
    router.post(
      "/attendance",
      inject("addStudentAttendance"),
      this.addAttendance
    );
    router.post(
      "/attendance/getReport",
      inject("getStudentAttendanceReport"),
      this.getStudentAttendanceReport
    );
    router.put("/course/:id", inject("editStudentCourse"), this.editCourse);
    router.delete(
      "/course/:id",
      inject("removeStudentCourse"),
      this.removeCourse
    );
    router.put(
      "/attendance/:id",
      inject("editStudentAttendance"),
      this.editAttendance
    );
    router.post("/task", inject("addStudentTask"), this.addTask);
    router.delete("/task/:id", inject("deleteStudentTask"), this.deleteTask);
    router.put(
      "/task/:id",
      inject("updateStudentTask"),
      this.updateStudentTask
    );
    router.post(
      "/preTask",
      inject("addPreStudentTask"),
      this.addPreStudentTask
    );
    router.post("/task/getList", inject("getStudentTask"), this.getTask);
    router.post(
      "/preTask/getList",
      inject("getPreStudentTask"),
      this.getPreStudentTask
    );
    router.post(
      "/task/status",
      inject("changeStudentTaskStatus"),
      this.changeStudentTaskStatus
    );
    router.post("/award", inject("addStudentAward"), this.addAward);
    router.post(
      "/award/getReport",
      inject("getStudentAwardReport"),
      this.getStudentAwardReport
    );
    router.post("/getAward", inject("getStudentAward"), this.getAward);
    router.post("/get-report", inject("getStudentReport"), this.getReport);
    router.post(
      "/getStudentThisYear",
      inject("getStudentThisYear"),
      this.getStudentThisYear
    );
    router.post("/reEnroll", inject("reEnroll"), this.reEnroll);

    return router;
  },

  add(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff ]
      );

      const { addStudent } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = addStudent.outputs;

      addStudent
        .on(SUCCESS, student => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addStudent").success,
            data: student
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

      addStudent.execute(req);
    } catch (error) {
      logger.error(`Add student Error : ${error}`);
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

  addYear(req, res, next) {
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
        [strategies.Family]
      );

      const { addStudentYear } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST
      } = addStudentYear.outputs;

      addStudentYear
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addStudentYear").success,
            data: studentYear
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(STUDENT_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentYear").notExistStudent
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addStudentYear.execute(req);
    } catch (error) {
      logger.error(`Add student year Error : ${error}`);
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

  addCourse(req, res, next) {
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
        [strategies.Family]
      );

      const { addStudentCourse } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST,
        STUDENT_YEAR_NOT_EXIST,
        STUDENT_COURSE_EXIST,
        COURSE_NOT_EXIST
      } = addStudentCourse.outputs;

      addStudentCourse
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addStudentCourse").success,
            data: studentYear
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(STUDENT_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentCourse").notExistStudent
          });
        })
        .on(STUDENT_YEAR_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentCourse").notExistStudentYear
          });
        })
        .on(STUDENT_COURSE_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentCourse").existStudentCourse
          });
        })
        .on(COURSE_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentCourse").notExistCourse
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addStudentCourse.execute(req);
    } catch (error) {
      logger.error(`Add student course Error : ${error}`);
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

  addAttendance(req, res, next) {
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
        [strategies.Family]
      );

      const { addStudentAttendance } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST,
        STUDENT_YEAR_NOT_EXIST,
        STUDENT_ATTENDANCE_EXIST
      } = addStudentAttendance.outputs;

      addStudentAttendance
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addStudentAttendance").success,
            data: studentYear
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(STUDENT_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentAttendance").notExistStudent
          });
        })
        .on(STUDENT_YEAR_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentAttendance").notExistStudentYear
          });
        })
        .on(STUDENT_ATTENDANCE_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentAttendance").existStudentAttendance
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addStudentAttendance.execute(req);
    } catch (error) {
      logger.error(`Add student attendance Error : ${error}`);
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

  getStudentAttendanceReport(req, res, next) {
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
        [strategies.Family]
      );

      const { getStudentAttendanceReport } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR
      } = getStudentAttendanceReport.outputs;

      getStudentAttendanceReport
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentAttendanceReport").success,
            data: studentYear
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

      getStudentAttendanceReport.execute(req);
    } catch (error) {
      logger.error(`Get student attendance report Error : ${error}`);
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

  editCourse(req, res, next) {
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
        [strategies.Family]
      );

      const { editStudentCourse } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = editStudentCourse.outputs;

      editStudentCourse
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("editStudentCourse").success
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

      editStudentCourse.execute(req);
    } catch (error) {
      logger.error(`Edit student course Error : ${error}`);
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

  editAttendance(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { editStudentAttendance } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        NOT_EXIST_ATTENDANCE
      } = editStudentAttendance.outputs;

      editStudentAttendance
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("editStudentAttendance").success
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(NOT_EXIST_ATTENDANCE, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("editStudentAttendance").notExistAttendance
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      editStudentAttendance.execute(req);
    } catch (error) {
      logger.error(`Edit student attendance Error : ${error}`);
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

  removeCourse(req, res, next) {
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
        [strategies.Family]
      );

      const { removeStudentCourse } = req;
      const { SUCCESS, ERROR, NOT_EXIST_COURSE } = removeStudentCourse.outputs;

      removeStudentCourse
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("removeStudentCourse").success
          });
        })
        .on(NOT_EXIST_COURSE, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("removeStudentCourse").notExist
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      removeStudentCourse.execute(req);
    } catch (error) {
      logger.error(`Remove student course Error : ${error}`);
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

  getYear(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { getStudentYear } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST
      } = getStudentYear.outputs;

      getStudentYear
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentYear").success,
            data: studentYear
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(STUDENT_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("getStudentYear").notExistStudent
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      getStudentYear.execute(req);
    } catch (error) {
      logger.error(`Get student year Error : ${error}`);
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

  getCourse(req, res, next) {
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
        [strategies.Family]
      );

      const { getStudentCourse } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getStudentCourse.outputs;

      getStudentCourse
        .on(SUCCESS, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentCourse").success,
            data: studentCourse
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

      getStudentCourse.execute(req);
    } catch (error) {
      logger.error(`Get student course Error : ${error}`);
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

  edit(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { editStudent } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        NOT_EXIST_STUDENT
      } = editStudent.outputs;

      editStudent
        .on(SUCCESS, student => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("editStudent").success
          });
        })
        .on(NOT_EXIST_STUDENT, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("editStudent").notExistStudent,
            message: error.details
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

      editStudent.execute(req);
    } catch (error) {
      logger.error(`Edit student Error : ${error}`);
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

  remove(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { removeStudent } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        NOT_EXIST_STUDENT
      } = removeStudent.outputs;

      removeStudent
        .on(SUCCESS, student => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("removeStudent").success
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("common").Error,
            message: error.details
          });
        })
        .on(NOT_EXIST_STUDENT, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("removeStudent").notExistStudent,
            message: error.details
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      removeStudent.execute(req);
    } catch (error) {
      logger.error(`Remove student Error : ${error}`);
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

  getAll(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { getAllStudent } = req;
      const {
        SUCCESS,
        ERROR,
        NOT_EXIST_STUDENT,
        VALIDATION_ERROR
      } = getAllStudent.outputs;

      getAllStudent
        .on(SUCCESS, student => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getAllStudent").success,
            data: student
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(NOT_EXIST_STUDENT, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("getAllStudent").notExistStudent,
            message: error.details
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      getAllStudent.execute(req);
    } catch (error) {
      logger.error(`Get All student Error : ${error}`);
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

  addTask(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { addStudentTask } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST,
        FAMILY_NOT_EXIST
      } = addStudentTask.outputs;

      addStudentTask
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addStudentTask").success,
            data: studentYear
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(STUDENT_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentTask").notExistStudent
          });
        })
        .on(ERROR, error => {
          throw error;
        })
        .on(FAMILY_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentTask").notExistFamily
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addStudentTask.execute(req);
    } catch (error) {
      logger.error(`Add student task error : ${error}`);
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

  deleteTask(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { deleteStudentTask } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = deleteStudentTask.outputs;

      deleteStudentTask
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("deleteStudentTask").success
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

      deleteStudentTask.execute(req);
    } catch (error) {
      logger.error(`Add student task error : ${error}`);
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

  updateStudentTask(req, res, next) {
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
        [strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { updateStudentTask } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = updateStudentTask.outputs;

      updateStudentTask
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("updateStudentTask").success
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

      updateStudentTask.execute(req);
    } catch (error) {
      logger.error(`Update student task error : ${error}`);
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

  addPreStudentTask(req, res, next) {
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
        [strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { addPreStudentTask } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = addPreStudentTask.outputs;

      addPreStudentTask
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addPreStudentTask").success,
            data: studentYear
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

      addPreStudentTask.execute(req);
    } catch (error) {
      logger.error(`Add pre student task error : ${error}`);
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

  getTask(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { getStudentTask } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST
      } = getStudentTask.outputs;

      getStudentTask
        .on(SUCCESS, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentTask").success,
            data: studentCourse
          });
        })
        .on(STUDENT_NOT_EXIST, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Error,
            message: i18n.__("getStudentTask").notExistStudent
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

      getStudentTask.execute(req);
    } catch (error) {
      logger.error(`Get student Task Error : ${error}`);
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

  getPreStudentTask(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { getPreStudentTask } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getPreStudentTask.outputs;

      getPreStudentTask
        .on(SUCCESS, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getPreStudentTask").success,
            data: studentCourse
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

      getPreStudentTask.execute(req);
    } catch (error) {
      logger.error(`Get pre student Task Error : ${error}`);
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

  changeStudentTaskStatus(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { changeStudentTaskStatus } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST
      } = changeStudentTaskStatus.outputs;

      changeStudentTaskStatus
        .on(SUCCESS, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("changeStudentTaskStatus").success
          });
        })
        .on(STUDENT_NOT_EXIST, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Error,
            message: i18n.__("changeStudentTaskStatus").notExistStudent
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

      changeStudentTaskStatus.execute(req);
    } catch (error) {
      logger.error(`Change student Task Error : ${error}`);
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

  addAward(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { addStudentAward } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST
      } = addStudentAward.outputs;

      addStudentAward
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("addStudentAward").success,
            data: studentYear
          });
        })
        .on(VALIDATION_ERROR, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            status: i18n.__("common").ValidationError,
            message: error.details
          });
        })
        .on(STUDENT_NOT_EXIST, error => {
          res.status(Status.UNPROCESSABLE_ENTITY).json({
            message: i18n.__("addStudentAward").notExistStudent
          });
        })
        .on(ERROR, error => {
          throw error;
        });

      addStudentAward.execute(req);
    } catch (error) {
      logger.error(`Add student award error : ${error}`);
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

  getStudentAwardReport(req, res, next) {
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
        [strategies.Family]
      );

      const { getStudentAwardReport } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR
      } = getStudentAwardReport.outputs;

      getStudentAwardReport
        .on(SUCCESS, studentYear => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentAwardReport").success,
            data: studentYear
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

      getStudentAwardReport.execute(req);
    } catch (error) {
      logger.error(`Add student award report error : ${error}`);
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

  getAward(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { getStudentAward } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        STUDENT_NOT_EXIST
      } = getStudentAward.outputs;

      getStudentAward
        .on(SUCCESS, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentAward").success,
            data: studentCourse
          });
        })
        .on(STUDENT_NOT_EXIST, studentCourse => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Error,
            message: i18n.__("getStudentAward").notExistStudent
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

      getStudentAward.execute(req);
    } catch (error) {
      logger.error(`Get student award Error : ${error}`);
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

  getReport(req, res, next) {
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
        [strategies.Family]
      );

      const { getStudentReport } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getStudentReport.outputs;

      getStudentReport
        .on(SUCCESS, studentReport => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentReport").success,
            data: studentReport
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

      getStudentReport.execute(req);
    } catch (error) {
      logger.error(`Get student report Error : ${error}`);
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

  getStudentThisYear(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { getStudentThisYear } = req;
      const { SUCCESS, ERROR, VALIDATION_ERROR } = getStudentThisYear.outputs;

      getStudentThisYear
        .on(SUCCESS, student => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("getStudentThisYear").success,
            data: student
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

      getStudentThisYear.execute(req);
    } catch (error) {
      logger.error(`Get student in this year error : ${error}`);
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

  reEnroll(req, res, next) {
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
        [strategies.Family, strategies.SchoolAdmin, strategies.SchoolManager, strategies.SchoolStaff]
      );

      const { reEnroll } = req;
      const {
        SUCCESS,
        ERROR,
        VALIDATION_ERROR,
        NOT_EXIST_STUDENT,
        NOT_EXIST_STUDENTYEAR
      } = reEnroll.outputs;

      reEnroll
        .on(SUCCESS, data => {
          res.status(Status.CREATED).json({
            status: i18n.__("common").Success,
            message: i18n.__("reEnrollStudent").success
          });
        })
        .on(NOT_EXIST_STUDENT, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("reEnrollStudent").notExistStudent,
            message: error.details
          });
        })
        .on(NOT_EXIST_STUDENTYEAR, error => {
          res.status(Status.NOT_FOUND).json({
            status: i18n.__("reEnrollStudent").notExistStudentYear,
            message: error.details
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

      reEnroll.execute(req);
    } catch (error) {
      logger.error(`Edit student Error : ${error}`);
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

module.exports = StudentsController;
