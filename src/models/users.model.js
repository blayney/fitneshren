// See http://docs.sequelizejs.com/en/latest/docs/models-definition/
// for more of what you can do here.
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;

module.exports = function(app) {
  const sequelizeClient = app.get('sequelizeClient');
  const users = sequelizeClient.define('users', {

    email: {
      type: DataTypes.STRING,
      allowNull: false,
      isEmail: true,
      unique: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    isCoach: {
      type: DataTypes.BOOLEAN
      defaultValue: false,
    },
    timestamps: true,
  }, {
    hooks: {
      beforeCount(options) {
        options.raw = true;
      }
    }
  });

  // eslint-disable-next-line no-unused-vars
  users.associate = function(models) {
    if (models.isCoach) {
      models.users = models.hasMany(users);
    } else {
      models.coach = models.belongsTo(user, {
        as: coach
      })
    }
  };

  return users;
};