({
	show : function(component, event, helper) {
		component.set("v.accCol",[
            {label:'name',fieldName:'Name',type:'text'},
            {label:'phone',fieldName:'Phone',type:'text'}
        ]);
        var abc=component.get("c.act");
        var search=component.get("v.Name");
        abc.setParams({acc:search});
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.acc",result);
            }
        });
        $A.enqueueAction(abc);
        
        component.set("v.conCol",[
            {label:'name',fieldName:'Name',type:'text'},
            {label:'phone',fieldName:'Phone',type:'text'}
        ]);
        var xyz=component.get("c.cont");
        //var search=component.get("v.Name");
        xyz.setParams({acc:search});
        xyz.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.con",result);
            }
        });
        $A.enqueueAction(xyz);
        
        component.set("v.oppCol",[
            {label:'name',fieldName:'Name',type:'text'},
            {label:'StageName',fieldName:'StageName',type:'text'}
        ]);
        var abc=component.get("c.opty");
        //var search=component.get("v.Name");
        abc.setParams({acc:search});
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.opp",result);
            }
        });
        $A.enqueueAction(abc);
	
	}
})