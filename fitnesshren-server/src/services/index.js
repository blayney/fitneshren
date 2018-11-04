const history = require('./history/history.service.js');
const users = require('./users/users.service.js');
const trainers = require('./trainers/trainers.service.js');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(history);
  app.configure(users);
  app.configure(trainers);
};
