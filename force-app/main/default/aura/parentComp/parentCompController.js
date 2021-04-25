({
	show : function(component, event, helper) {
		//alert('wellcome to events ');
        var name=event.getParam('name');
        //alert(name);
        component.set("{!v.name}",name);
	}
})