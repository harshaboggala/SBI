@isTest
public class OptyTestData {
	@isTest
    public static void testData(){
        Opportunity op=new Opportunity(StageName='Prospecting' ,CloseDate=System.today()+15 ,name='Amazone');
        Opportunity op1=new Opportunity(StageName='Closed Lost' ,CloseDate=System.today() ,name='Flipcart');
        Opportunity op2=new Opportunity(StageName='Closed Won' ,CloseDate=System.today() ,name='Woodan');
        list<Opportunity> opty=new list<Opportunity>{op ,op1 ,op2};
        insert opty;
    }
}