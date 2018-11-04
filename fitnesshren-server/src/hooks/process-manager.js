// Use this hook to manipulate incoming or outgoing data.
// For more information on hooks see: http://docs.feathersjs.com/api/hooks.html

// eslint-disable-next-line no-unused-vars
module.exports = function (options = {}) {
  return async context => {
    const { data } = context;

    if (!data.type) {
    throw new Error ('"type" must exists');
    }

    if (!data.info) {
    throw new Error ('"info" must exists');
    }

    const user = context.params.user;
    const type = context.data.type;
    const info = context.data.info;

    context.data = {
    user,
    type: type,
    info: info,
    date: new Date().getTime()
    };

    return context;
  };
};
