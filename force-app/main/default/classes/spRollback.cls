public class spRollback {
    public void roll_Back(){
        //Savepoint sp=Database.setSavepoint();
        try{
        	Account a=new Account();
        	a.Name='spExample';
        	a.Rating='Warm';
        	insert a;
        	Account aa=[select name from Account where id=:a.id];
            System.debug(aa);
            
            Contact c=new Contact(AccountId=a.Id);
            c.LastName='rbExample';
            insert c;
            Contact cc=[select lastname from Contact where id=:c.id];
            System.debug(cc);
        }
        catch(exception ex){
            //Database.rollback(sp);
        }
    }
}