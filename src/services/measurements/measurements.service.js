// Initializes the `measurements` service on path `/measurements`
const createService = require('feathers-sequelize');
const createModel = require('../../models/measurements.model');
const hooks = require('./measurements.hooks');

module.exports = function (app) {
  const Model = createModel(app);
  const paginate = app.get('paginate');

  const options = {
    Model,
    paginate
  };

  // Initialize our service with any options it requires
  app.use('/measurements', createService(options));

  // Get our initialized service so that we can register hooks
  const service = app.service('measurements');

  service.hooks(hooks);
};
