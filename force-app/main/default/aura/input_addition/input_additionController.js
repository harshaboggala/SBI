({
	cal : function(component, event, helper) {
		var a=component.get("v.Amount");
        var b=component.get("v.Rate");
        var c=component.get("v.Years");
        var interest=a*b*c/100;
        var sum=component.set("v.Interest",interest);
	}
})