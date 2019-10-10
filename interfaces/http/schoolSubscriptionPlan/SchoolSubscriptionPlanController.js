const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');

const SchoolSubscriptionPlanController = {
  get router() {
    const router = Router();

    router.get('/getList', inject('getSchoolSubscriptionPlanList'), this.getSchoolSubscriptionPlanList);

    return router;
  },

  getSchoolSubscriptionPlanList(req, res, next) {
    const { logger } = req.container.cradle;

    const { getSchoolSubscriptionPlanList } = req;
    const { SUCCESS, ERROR, VALIDATION_ERROR } = getSchoolSubscriptionPlanList.outputs;

    getSchoolSubscriptionPlanList
      .on(SUCCESS, (planList) => {
        res
          .status(Status.CREATED)
          .json({
            status: i18n.__("common").Success,
            message: i18n.__("getSchoolSubscriptionPlanList").success,
            data: planList
          });
      })
      .on(ERROR, (error) => {
        logger.error(`Get School subscription plan list Error : ${error}`);
        res
          .status(Status.INTERNAL_SERVER_ERROR)
          .json({
            message: i18n.__("common").default
          });
      });

    getSchoolSubscriptionPlanList.execute(req);
  }

};

module.exports = SchoolSubscriptionPlanController;
