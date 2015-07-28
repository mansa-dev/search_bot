var express = require('express');
var router = express.Router();
var keywordsModel = require('../models').keywords;
var ansModel = require('../models').ans;
var mapModel = require('../models').map;


function GetResponseArray(status_,message_,data_){

	return {

		"status":status_,
		"message":message_,
		"data":data_?data_:""
	};
}

function mysql_real_escape_string (str) {
    return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
        switch (char) {
            case "\0":
            return "\\0";
            case "\x08":
            return "\\b";
            case "\x09":
            return "\\t";
            case "\x1a":
            return "\\z";
            case "\n":
            return "\\n";
            case "\r":
            return "\\r";
            case "\"":
            case "'":
            case "\\":
            case "%":
                return "\\"+char; // prepends a backslash to backslash, percent,
                                  // and double/single quotes
                              }
                          });
}

function format_message(data_){

    return data_.supportingText+" "+ data_.keyword+"?";

}


function GetKeywordById(id_,res){

	keywordsModel.findOne({where:{id:id_}}).then(function(data_){
     

      if(data_!=null){

        var response_=GetResponseArray(true,"Results found",format_message(data_));


    }


    else {

       var response_=GetResponseArray(false,"No results found");

   }

   res.send(JSON.stringify(response_, null, 4));


});
}



function mode(array)
{
    if(array.length == 0)
        return null;
    var modeMap = {};
    var maxEl = array[0], maxCount = 1;
    for(var i = 0; i < array.length; i++)
    {
        var el = array[i];
        if(modeMap[el] == null)
            modeMap[el] = 1;
        else
            modeMap[el]++;  
        if(modeMap[el] > maxCount)
        {
            maxEl = el;
            maxCount = modeMap[el];
        }
    }
    return maxEl;
}


router.post('/getanswer', function(req, res, next) {
     var keywordString=req.body.text_;
         keywordString=keywordString.replace(/[^a-zA-Z ]/g, "");
     var arrayString=keywordString.split(" ");
     var searchString='';

     arrayString.forEach(function(val,ind,arr){
            if(ind){
                searchString=searchString +",'"+mysql_real_escape_string(val)+"'";
            }
            else
            {
                searchString=searchString +"'"+mysql_real_escape_string(val)+"'";
            }
            
     });    
keywordsModel.findAll({where:["`keyword` IN ("+searchString+")"],include: [
    { model: ansModel }]}).then(function(data){
   
    var ids=Array();
             for(var i=0;i<data.length;i++)
             {
                var temp=data[i].answers;
                for(var j=0;j<temp.length;j++)
                {
                   ids.push(temp[j].id);
                }
                
             }
            
           var ans = mode(ids);
          ansModel.findOne({where:{id:ans}}).then(function(ansdata){

            if(ansdata==null){
             res.send(JSON.stringify(GetResponseArray(false,"No results found"), null, 4));
             }
            else{
               res.send(JSON.stringify(GetResponseArray(true,"Results found",ansdata.answer)));   
             }


          })
              

      });
});

module.exports = router;
