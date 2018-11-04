// Use this hook to manipulate incoming or outgoing data.
// For more information on hooks see: http://docs.feathersjs.com/api/hooks.html

// eslint-disable-next-line no-unused-vars
module.exports = function (options = {}) {
  return async context => {
	
    const { params } = context;	
	  
	if (!params.query)
		context.params.query = {user: context.params.user};
	else if (!params.query.user)
		context.params.query = {user: context.params.user};
	else if (params.query.user != context.params.user)
		context.query.user = context.params.user;
	  
    return context;
  };
};
