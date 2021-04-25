({
	Search : function(component, event, helper) {
		var Name=component.get("v.Name");
        var a=[];
        component.set("v.selectedId",a);
        component.set("v.cFlag",false);
        helper.showSpin(component);
        var action=component.get("c.callme");
        action.setParams({name:Name});
        action.setCallback(this,function(response){
            var status=response.getState();
            if(status=="SUCCESS"){
                var result=response.getReturnValue();
                //console.log(result);
                component.set("v.data",result);
                helper.hideSpin(component);
            }
        });
        $A.enqueueAction(action);
	},
    
    Contacts : function(cmp, event, helper){
        var delId=[];
        
        //@@@ we can use code between comments for delete selected records purpose  @@@//
        
    	/*var getAllId=cmp.find("sbox");
        
        if(! Array.isArray(getAllId)){
        	if (getAllId.get("v.value") == true) {
                delId.push(getAllId.get("v.text"));
            } 
            
        }else{
            for (var i = 0; i < getAllId.length; i++) {
       			if (getAllId[i].get("v.value") == true) {
                    delId.push(getAllId[i].get("v.text"));
                }
      		}
            //console.log(delId);
        }*/
        var delId=cmp.get("v.selectedId");
        var selectedRec = event.getSource();
        if(selectedRec.get("v.value")==true){
            delId.push(selectedRec.get("v.text"));
        }
        else{
            var i=delId.indexOf(selectedRec.get("v.text"));
            delId.splice(i,1);
        }
        var list=cmp.get("v.conData");
        
        cmp.set("v.selectedId",delId);
        cmp.set("v.fields",[{label:'Id',fieldName:'Id',type:'text'},
                                  {label:'FirstName',fieldName:'FirstName',type:'text'},
                                  {label:'LastName',fieldName:'LastName',type:'text'}
                                 ]);
        helper.showSpin(cmp);
        var abc=cmp.get("c.conRec");
        abc.setParams({cl:delId});
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
                cmp.set("v.cFlag",true);
                var result=response.getReturnValue();
                cmp.set("v.conData",result);
                helper.hideSpin(cmp);
            }
        });
        $A.enqueueAction(abc);
    },
    showSpinner: function(cmp, event, helper){
        cmp.set("v.asFlag",true);
    },
    hideSpinner: function(cmp, event, helper){
        cmp.set("v.asFlag",false);
    }
})