var Sequelize = require('sequelize');


var sequelize = new Sequelize('search_bot', 'root', 'root', {
                    host: 'localhost',
                    dialect: 'mysql',
                    pool: {
                             max: 5,
                             min: 0,
                             idle: 10000
                          },
                    });

var keywords =require('./keywords.js')(Sequelize,sequelize);
var ans =require('./answers.js')(Sequelize,sequelize);
var map =require('./map.js')(Sequelize,sequelize);

keywords.belongsToMany(ans, { through: map });
ans.belongsToMany(keywords, { through: map });

keywords.sync();
ans.sync();
map.sync();


var db ={
          sequelize:sequelize,
          keywords:keywords,
          ans:ans,
          map:map
        };

module.exports=db;








