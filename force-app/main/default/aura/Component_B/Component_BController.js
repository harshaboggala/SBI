({
	invoke : function(component, event, helper) {
		var name=event.getParam('name');
        //alert(name);
        component.set("{!v.name}",name);
	}
})