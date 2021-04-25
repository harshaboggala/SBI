({
	show : function(component, event, helper) {
        $A.createComponent("lightning:button",
                           {"label":"create" ,"onclick":component.getReference("c.call")}, 
                           function(cmp, status, err){
                               if(cmp!=null){
                                   var b=component.get("v.body");
                                   b.push(cmp);
                                   component.set("v.body",b);
                               }
                           }
                          );
	},
    call :function(component, event, helper) {
        alert('hi this is dynamic compoonent');
    }
})