({
	next : function(component, event, helper) {
        var t=component.get("{!v.tid}");
        if(t=='one'){
            component.set("{!v.tid}",'two');
        }else if(t=='two'){
            component.set("{!v.tid}",'three');
        }
	},
    prev : function(component, event, helper) {
		var t=component.get("{!v.tid}");
        if(t=='two'){
            component.set("{!v.tid}",'one');
        }else if(t=='three'){
            component.set("{!v.tid}",'two');
        }
	},
    show : function(component, event, helper) {
        var fn=component.get("{!v.fname}");
        var ln=component.get("{!v.lname}");
        var m=component.get("{!v.mail}");
        var p=component.get("{!v.phone}");
        var q=component.get("{!v.qual}");
        var s=component.get("{!v.subject}");
        var abc=component.get("{!c.callme}");
        abc.setParams({fname:fn, lname:ln, mail:m, phone:p, qual:q, subject:s});
        abc.setCallback(this,function(response){
          var state=response.getState(); 
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("{!v.result}",result);
            }
        });
        $A.enqueueAction(abc);
    }
})