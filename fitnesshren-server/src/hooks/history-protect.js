// Use this hook to manipulate incoming or outgoing data.
// For more information on hooks see: http://docs.feathersjs.com/api/hooks.html

// eslint-disable-next-line no-unused-vars
module.exports = function (options = {}) {
  return async context => {
	  
    const { result } = context;
    
	if (result.user != context.params.user)
		{
		throw new Error ("Accessing to another user's record");
		}
	
	return context;
  };
};
