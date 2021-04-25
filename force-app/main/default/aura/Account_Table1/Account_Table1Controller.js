({
	init : function(component, event, helper) {
        component.set("v.columns",[
            {label:'name',fieldName:'Name',type:'text'},
            {label:'phone',fieldName:'Phone',type:'text'}
        ]);
        helper.showSpinner(component);
		var abc=component.get("c.invoke");
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.data",result);
                helper.hideSpinner(component);
            }
        });
        $A.enqueueAction(abc);
	},
    handleShowSpinner: function(component, event, helper) {
        component.set("v.showSpinner", true); 
    },
     
    //Call by aura:doneWaiting event 
    handleHideSpinner : function(component,event,helper){
        component.set("v.showSpinner", false);
    }
})