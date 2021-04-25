@isTest
public class testTrigger {
	@isTest
    private static void testMe(){
        Account acc=new Account(name='salesForce');
        insert acc;
        Account a=[select Rating,Industry,Ownership,id from Account where id=:acc.id];
        System.assertEquals(a.Rating,'Warm');
        System.assertEquals(a.Industry,'Education');
        System.assertEquals(a.Ownership,'public');
    }
}