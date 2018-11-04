

const processManager = require('../../hooks/process-manager');

module.exports = {
  before: {
    all: [],
    find: [],
    get: [],
    create: [processManager()],
    update: [],
    patch: [],
    remove: []
  },

  after: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
  },

  error: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
  }
};
