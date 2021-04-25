({
	myAction : function(component, event, helper) {
        component.set("v.fields",[{label:'FirstName', fieldName:'FirstName', type:'text'},
                      {label:'LastName',fieldName:'LastName',type:'text'},
                       {label:'ID',fieldName:'id',type:'text'}
                      ]);
        var name=component.get("v.accName");
		var abc=component.get("c.search");
        abc.setParams({"acc":name});
        abc.setCallback(this ,function(response){
               var status=response.getState();
            if(status=='SUCCESS'){
                var data=response.getReturnValue();
                component.set("v.Data",data);
            }
                                      });
        $A.enqueueAction(abc);
	}
})