
module.exports=function(Sequelize,sequelize){

var User = sequelize.define('keywords', {
            keyword: {
                  type: Sequelize.STRING
            }
           }, 
           {
            freezeTableName: true 
          });

return User;
};

