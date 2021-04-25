trigger Sum_Amount on Contact (after insert, after update, after delete, before update, after undelete) {
    List<id> conId=new List<id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete ){
        for(Contact c:trigger.new){
            conId.add(c.AccountId);
        }
    }
    if(trigger.isUpdate || trigger.isDelete){
        for(Contact c:trigger.old){
            conId.add(c.AccountId);
        }
    }
    List<Account> accList=new List<Account>();
    List<Account> listAcc=[Select id,Total_Amount__c,(Select id,Amount__c from Contacts) from Account where id In :conId];
    for(Account acc: listAcc){
        Decimal TotalAmount = 0;
        for(Contact c: acc.contacts){
            if(c.Amount__c!=null){
                TotalAmount=TotalAmount+c.Amount__c;
            }
        }
        acc.Total_Amount__c=TotalAmount;
        accList.add(acc);
    }
    if(accList !=null){
        update accList;
    }
}