

const processManager = require('../../hooks/process-manager');
const {authenticate} = require('@feathersjs/authentication').hooks;
const historyProtect = require('../../hooks/history-protect');
const historyProtectFind = require('../../hooks/history_protect_find');

module.exports = {
  before: {
    all: [authenticate('jwt') ],
    find: [historyProtectFind()],
    get: [],
    create: [processManager()],
    update: [],
    patch: [],
    remove: []
  },

  after: {
    all: [],
    find: [],
    get: [historyProtect()],
    create: [],
    update: [historyProtect()],
    patch: [historyProtect()],
    remove: [historyProtect()]
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
