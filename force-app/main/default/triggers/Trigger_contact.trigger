trigger Trigger_contact on Contact (after insert , after delete, after update) {
    /*
     Set<Id> accIds=new Set<Id>();
        map<id,Contact> conmap=trigger.newMap;
        for(Contact c: trigger.new){
            if(trigger.newMap.get(c.id).AccountId != null )
            {
                accIds.add(trigger.newMap.get(c.id).AccountId);
            }
        }
        map<id,Account> accMap=new map<id,Account>([Select Id,name,noof_Contacts__c from Account where id in :accIds]);
        if(trigger.isAfter && trigger.isInsert){
                for(Contact c: trigger.new){
                   // if(c.AccountId!=null){
                   system.debug('bhanu'+accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c);
                    if(accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c== null){
                        if(conmap.get(c.id).AccountId != null )
                        {
                            accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c=1;
                        }
                        
                    }else{
                        if(conmap.get(c.id).AccountId != null )
                        {
                            accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c=accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c+1;
                        }
                    }
                }
            } update accMap.values();
}
    */
    map<id,Account> accMap=new map<id,Account>([Select Id,name,noof_Contacts__c from Account]);
    map<id,Contact> conmap=trigger.newMap;
    if(trigger.isAfter && trigger.isInsert){
        for(Contact c: trigger.new){
           if(accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c== null){
                if(conmap.get(c.id).AccountId != null ){
                    accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c=1;
                }
            }else{
                if(conmap.get(c.id).AccountId != null ){
                    accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c=accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c+1;
                }
           	}
        }
        update accMap.values();
    }  
    if(trigger.isAfter && trigger.isUpdate){
        for(Contact c: trigger.new){
            if(accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c== null){
                if(conmap.get(c.id).AccountId != null ){
                    accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c=1;
                }
            }else{
                if(conmap.get(c.id).AccountId != null ){
                    accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c=accMap.get(conmap.get(c.id).AccountId).noof_Contacts__c+1;
                }
            }
        }
        update accMap.values();
    }
    if(trigger.isAfter && trigger.isDelete){
        
    }
}