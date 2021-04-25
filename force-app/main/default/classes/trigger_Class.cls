public class trigger_Class {
    public static set<id> accids(map<id,contact> newmap){
        set<id> accid=new set<id>();
        for(contact cc:newmap.values()){
            accid.add(cc.accountid);
        }
        return accid;
    }
    public static void after(map<id,contact> newmap){
        set<id> accid=accids(newmap);
        map<id,Account> accMap=new map<id,Account>([Select Id,name,Total_Amount__c from Account  where id in :accid]);
        System.debug(accMap);
        for(Contact c: newmap.values()){
            if(c.AccountId != null && c.Amount__c != null){
                if(accMap.get(c.AccountId).Total_Amount__c== null){
                    accMap.get(c.AccountId).Total_Amount__c=c.Amount__c;
                }
                else {
                    accMap.get(c.AccountId).Total_Amount__c+=c.Amount__c;
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
        map<id,Account> accMap=new map<id,Account>([Select Id,name,Total_Amount__c from Account  where id in :accid]);
        System.debug(accMap);
        for(Contact c: oldmap.values()){
            if(c.AccountId != null && c.Amount__c!=null && accMap.get(c.AccountId).Total_Amount__c!= null){
                accMap.get(c.AccountId).Total_Amount__c-=c.Amount__c;
            }
        }
        if(accMap!=null){
            System.debug(accMap);
        	update accMap.values();
        }
        
    }
}