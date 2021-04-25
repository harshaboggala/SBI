@isTest
public class OptyTest {
	@isTest
    private static void Test(){
        OptyTestData.testData();
        list<Opportunity> optyList=[select StageName,CloseDate,id from Opportunity where StageName='Prospecting'];
        for(Opportunity op: optyList){
            op.StageName='Closed Won';
            //op.CoseDate=System.today();
        }
        update optyList;
        for(Opportunity op: optyList){
            System.assertEquals(op.CloseDate, System.today());
        }
    }
}