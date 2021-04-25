@isTest
public class test_example1 {
    @isTest
    static void testme(){
        test_data1.sampleData();
        Integer count1=[select count() from Account];
        Integer count2=[select count() from Account where rating='hot'];
        System.assertEquals(count1,2);
        System.assertEquals(count2,1);
        apexexample1 ae=new apexexample1();
        ae.callme('Hot');
        List<Account> acc=[Select id,rating from Account];
        for(Account a:acc){
            System.assertEquals(a.rating,'Worm');
        }
    }

}