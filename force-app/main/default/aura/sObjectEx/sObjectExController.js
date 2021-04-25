({
	show : function(component, event, helper) {
        var ac=component.get("v.acc");
        var abc=component.get("c.callme");
        abc.setParams({acc:ac});
        abc.setCallback(this, function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
            var result=response.getReturnValue();
                component.set("v.result",result);
            }
        });
        $A.enqueueAction(abc);
	}
})