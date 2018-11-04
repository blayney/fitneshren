const assert = require('assert');
const feathers = require('@feathersjs/feathers');
const historyProtectFind = require('../../src/hooks/history_protect_find');

describe('\'history_protect_find\' hook', () => {
  let app;

  beforeEach(() => {
    app = feathers();

    app.use('/dummy', {
      async get(id) {
        return { id };
      }
    });

    app.service('dummy').hooks({
      before: historyProtectFind()
    });
  });

  it('runs the hook', async () => {
    const result = await app.service('dummy').get('test');
    
    assert.deepEqual(result, { id: 'test' });
  });
});
