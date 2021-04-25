({
	callme : function(component, event, helper) {
        var evt=$A.get("e.c:first_event");
        var name='bhanu';
        evt.setParams({'name':name});
        evt.fire();
	}
})