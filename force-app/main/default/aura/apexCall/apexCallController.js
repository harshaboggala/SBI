({
	show : function(component, event, helper) {
		var abc=component.get("c.callme");
        abc.setCallback(this,function(response){
            var res=response.getState();
            if(res=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("{!v.Result}",result);
            }
        });
        $A.enqueueAction(abc);
	}
})