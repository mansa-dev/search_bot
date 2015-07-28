module.exports=function(Sequelize,sequelize){

var Map = sequelize.define('map', {
           
           }, 
           {
            freezeTableName: true 
          });

return Map;
};