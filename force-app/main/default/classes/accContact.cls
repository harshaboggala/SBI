public class accContact {
    public void accUpdate(){
        List<conWrapper> cwList=new List<conWrapper>();
        list<Student__c> stdList=[Select id,name__c,Mobile_No__c from Student__c limit 3 ];
        list<Account> accList=[Select id,Name,Phone from Account limit 2];
        for(Account a: accList){
        for(Student__c s: stdList){
            conWrapper cw=new conWrapper();
            cw.Name=s.Name__c;
            cw.phone=s.Mobile_No__c;
            cw.id=a.id;
            cwList.add(cw);
        	}
        }       
        list<Contact> conList=new list<Contact>(); 
        System.debug(cwList.size());
       	for(conWrapper c: cwList){
        	Contact con=new Contact();
            con.LastName=c.Name;
            System.debug(con.LastName);
            con.AccountId=c.id;
            System.debug(con.Account.Name);
            con.phone=c.phone;
            conList.add(con);
       	} 
        insert conList;
    }
}