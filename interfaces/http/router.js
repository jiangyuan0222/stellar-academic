const { Router } = require('express');
const statusMonitor = require('express-status-monitor');
const cors = require('cors');
const pug = require('pug');
const bodyParser = require('body-parser');
const compression = require('compression');
const methodOverride = require('method-override');
const controller = require('./utils/createControllerRoutes');
const i18n = require('i18n');

module.exports = ({ config, containerMiddleware, loggerMiddleware, errorHandler, swaggerMiddleware, authStrategy }) => {
  const router = Router();

  /* istanbul ignore if */
  if (config.env === 'development') {
    router.use(statusMonitor());
  }

  /* istanbul ignore if */
  if (config.env !== 'test') {
    router.use(loggerMiddleware);
  }

  const apiRouter = Router();

  apiRouter
    .use(methodOverride('X-HTTP-Method-Override'))
    .use(cors())
    .use(bodyParser.json())
    .use(bodyParser.urlencoded({
      extended: true
    }))
    .use(compression())
    .use(containerMiddleware)
    .use('/docs', swaggerMiddleware)
    .use(authStrategy)
    .use(i18n.init);

  /*
   * Add your API routes here
   *
   * You can use the `controllers` helper like this:
   * apiRouter.use('/users', controller(controllerPath))
   *
   * The `controllerPath` is relative to the `interfaces/http` folder
   */

  apiRouter.use('/users', controller('user/UsersController'));
  apiRouter.use('/families', controller('family/FamiliesController'));
  apiRouter.use('/programs', controller('program/ProgramsController.js'));
  apiRouter.use('/students', controller('student/StudentsController'));
  apiRouter.use('/courses', controller('course/CoursesController.js'));
  apiRouter.use('/schools', controller('school/SchoolsController.js'));
  apiRouter.use('/tags', controller('tag/TagsController.js'));
  apiRouter.use('/resources', controller('resource/ResourcesController.js'));
  apiRouter.use('/documentQuestions', controller('documentQuestion/DocumentQuestionsController.js'));
  apiRouter.use('/documentAnswers', controller('documentAnswer/DocumentAnswersController.js'));
  apiRouter.use('/notifications', controller('notification/NotificationsController.js'));
  apiRouter.use('/subscription', controller('schoolSubscriptionPlan/SchoolSubscriptionPlanController.js'));
  apiRouter.use('/transaction', controller('transaction/TransactionsController.js'));
  apiRouter.use('/test', controller('test/TestController.js'));

  router.use('/api/v1', apiRouter);

  router.use(errorHandler);

  return router;
};
