const { Router } = require('express');
const { inject } = require('awilix-express');
const Status = require('http-status');
const i18n = require('i18n');
const { check, strategies } = require('src/interfaces/http/utils/auth/validate');
const moment = require('moment');

const TransactionsController = {
  get router() {
    const router = Router();

    router.get('/', inject('userOrdersRepository'), inject('nodeMailer'), this.createTransaction);

    return router;
  },

  async createTransaction(req, res, next) {
    let { userOrdersRepository, nodeMailer } = req;
    // console.log(moment(`08-01-${moment().year()}`, "MM/DD/YYYY"));
    // console.log(moment(`07-31-${(moment().year()) + 1}`, "MM/DD/YYYY"));
    // res.render("paymentFail");

    // let subscription_start_date = moment(`${moment().utc().month() + 2}-01-${moment().year()}`, "MM/DD/YYYY");
    // let subscription_end_date = moment(`${moment().utc().month() + 2}-${moment(
    //   moment(`${new Date().getMonth() + 2}-01-${moment().year()}`, "MM/DD/YYYY")
    // ).endOf('month')}-${moment().year()}`, "MM/DD/YYYY");

    // console.log("subscription_end_date : ", subscription_end_date);
    // console.log("subscription_start_date : ", subscription_start_date);

    nodeMailer.sendMandrillEmail('pradipb255@gmail.com', "Testing", "This is email test");

    // let sequelize = require('sequelize');

    // let group_by_count = await userOrdersRepository._getAllByArgs({
    //   attributes: ['id', 'fees_type', 'created_at', [sequelize.fn('count', sequelize.col('fees_type')), 'fees_type_count']],
    //   include: [{
    //     model: FamilyModel,
    //     attributes: [],
    //     required: true,
    //     as: 'family',
    //     where: {
    //       school_id: "U1563621917045J7DS5"
    //     }
    //   }],
    //   group: ['fees_type'],
    //   where: {
    //     [sequelize.Op.and]: [
    //       sequelize.where(sequelize.fn('YEAR', sequelize.col('user_orders.created_at')), moment().utc().year())
    //     ]
    //   }
    // })

    // console.log(group_by_count);
  }

};

module.exports = TransactionsController;
