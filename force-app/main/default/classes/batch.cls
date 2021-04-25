global class batch implements Database.Batchable<sObject>{
    global database.QueryLocator start(database.BatchableContext bc){
        String query='Select id from Account limit 3';
       return database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,list<Account> accounts){
        for(Account acc:accounts){
            System.debug(acc.id);
        }
    }
    global void finish(database.BatchableContext bc){
        asyncApexJob aa=[select id from asyncApexJob where id=:bc.getJobId()];
        System.debug(aa);
    }
}