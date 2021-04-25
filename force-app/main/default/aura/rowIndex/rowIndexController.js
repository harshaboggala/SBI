({
    invokeAll : function(component, event, helper) {
        var list=component.get("{!v.nameList}");
    },
    invoke : function(component, event, helper) {
        
    },
    show : function(component, event, helper) {
        var txt=component.get("{!v.text");
        component.set("{!v.textt}",list,txt);
    }
})