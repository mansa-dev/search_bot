module.exports=function(Sequelize,sequelize){

var Ans = sequelize.define('answers', {
            answer: {
                  type: Sequelize.STRING
            }
           }, 
           {
            freezeTableName: true 
          });

return Ans;
};