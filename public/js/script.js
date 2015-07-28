$(function(){
  HandleSearch.init();
});


var Helpers={


Root:window.location.origin,
	RootURL:function(){
                 
               // var sub=this.Root.indexOf("localhost")!=-1 || this.Root.indexOf("127.0.0.1")!=-1?"/"+this.SiteRoot:"";
				return this.Root;
	},

	"AjaxURL":function(action) {
    return this.RootURL() + "/ajax/" + action;
	},

GetJson:function(d){

		var json_=JSON.parse(d);

		 if (json_ && typeof json_ === "object" && json_ !== null) {

		 	return json_;
		 }

		 else {

		 	console.log("Invalid JSON response.");

		 	return false;
		 }

	},

	
};

var HandleSearch={

  FormElement:".app-form",
  TextField:".question-field",
  TargetElement:".answer-container",

	   init:function(){
		var form_=$(this.FormElement),
		this_=this;
		if(form_.length){

			form_.submit(function(e){
		    	e.preventDefault();	
				this_.Begin(form_);
			});
		}
	},

	Begin:function(form_){
	 var field_=form_.find(this.TextField);
		if(field_.length){
			var text_=$.trim(field_.val());
			if(text_){
				this.GetAnswer(form_,text_);
			}
			else{
				alert("Please enter the question.");
				field_.focus();
			}
		}
	},

  GetAnswer:function(form_,text_){

  	var this_=this;

     $.post(Helpers.AjaxURL("getanswer"),{text_:text_},function(d){

     	var d_=Helpers.GetJson(d);

     	if(d_){

     		this_.AfterResponse(form_,d_);
     	}



    });
},

AfterResponse:function(form_,data_){

if(!data_.status){

this.UpdateTarget(data_.message);

}

else {

this.UpdateTarget(data_.data);

}

},
 
UpdateTarget:function(text_){

var target_elm=$(this.TargetElement);

if(target_elm.length){

	target_elm.html(text_);
}


}


};