public class contactAdd {
    public void callme(){
        list<Account> accList=[Select id,Name from Account where name='GenePoint'];
        List<Contact> con=new List<Contact>();
        for(Account a: accList){
            Contact c=new Contact();
            c.LastName='Bajaj';
            c.phone='1116669999';
            c.AccountId=a.id;
            con.add(c);
        }
        insert con;
    }
}