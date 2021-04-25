public class AccConOpp {
    @auraEnabled
    public static list<Account> act(string acc){
        list<account> acclist=[select id,name,phone from Account where name LIKE :('%' + acc + '%')];
        return acclist;
    }
    @auraEnabled
    public static list<Contact> cont(string acc){
        System.debug('con');
        list<account> acclist=[select id,name,phone from Account where name LIKE :('%' + acc + '%')];
        list<contact> con=new list<contact>();
        list<contact> contacts=[select id,name,phone,AccountId from contact ];
        for(Account a: acclist){
            for(contact c:contacts){
                if(c.AccountId==a.id){
                    System.debug(c.AccountId);
            		con.add(c);
                }
            }
        }
        return con;
        //from VS Code
    }
    @auraEnabled
    public static list<opportunity> opty(string acc){
        System.debug('opp');
        list<account> acclist=[select id,name,phone from Account where name LIKE :('%' + acc + '%')];
        list<Opportunity> opp=[select id,Name,StageName,AccountId from Opportunity];
        list<Opportunity> opps=new list<Opportunity>();
        for(Account a:acclist){
        	for(Opportunity o: opp){
                if(o.AccountId==a.id){
                    System.debug(o.AccountId);
                    opps.add(o);
                }
        	}
        }
        return opps;
    }
}
