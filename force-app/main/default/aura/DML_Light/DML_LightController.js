({
	show : function(component, event, helper) {
		var name=component.get("v.Name");
        var phone=component.get("v.Phone");
        var Industry=component.get("v.Industry");
        var abc=component.get("c.callme");
        abc.setParams({name:name,phone:phone,industry:Industry});
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.Result",result);
            }
        });
        $A.enqueueAction(abc);
	}
})