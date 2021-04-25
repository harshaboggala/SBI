public class summary_Trigger {
    public static set<id> accids(map<id,contact> newmap){
        set<id> accid=new set<id>();
        for(contact cc:newmap.values()){
            accid.add(cc.accountid);
        }
        return accid;
    }
    public static void after(map<id,contact> newmap){
        set<id> accid=accids(newmap);
        map<id,Account> accMap=new map<id,Account>([Select Id,name,noof_Contacts__c from Account  where id in :accid]);
        System.debug(accMap);
        for(Contact c: newmap.values()){
            if(c.AccountId != null){
                if(accMap.get(c.AccountId).noof_Contacts__c == null){
                    accMap.get(c.AccountId).noof_Contacts__c=1;
                }
                else {
                    accMap.get(c.AccountId).noof_Contacts__c+=1;
                }
            }
        }
        if(accMap!=null){
            System.debug(accMap);
        	update accMap.values();
        }
    }
    public static void before(map<id,contact> oldmap){
        set<id> accid=accids(oldmap);
        map<id,Account> accMap=new map<id,Account>([Select Id,name,noof_Contacts__c from Account  where id in :accid]);
        System.debug(accMap);
        for(Contact c: oldmap.values()){
            if(c.AccountId != null && accMap.get(c.AccountId).noof_Contacts__c!= null){
                accMap.get(c.AccountId).noof_Contacts__c-=1;
            }
        }
        if(accMap!=null){
            System.debug(accMap);
        	update accMap.values();
        }
        
    }
}