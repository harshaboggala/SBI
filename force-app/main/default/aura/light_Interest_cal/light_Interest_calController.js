({
	callme : function(component, event, helper) {
		var a=component.get("v.Amt");
        var y=component.get("v.yrs");
        var r=component.get("v.rt");
        var res=component.get("c.show");
        res.setParams({amount:a , years:y , rate:r});
        res.setCallback(this,function(response){
           var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.intrt",result);
            }
        });
        $A.enqueueAction(res);
	}
})