@isTest
public class calloutTest {
	@isTest
    public static void callme(){
        test_Rest_Insert tr=new test_Rest_Insert();
        test.setMock(HttpCalloutMock.class ,tr);
        RestRequest req=new RestRequest();
        RestResponse res=new RestResponse();
        req.requestURI = '/services/apexrest/createOpportunity';
    	req.httpMethod = 'POST';
        RestContext.request=req;
        RestContext.response=res;
        Test.startTest();
        Rest_Insert.create('sample','Qualification','10/11/2021');
        Rest_Insert.create('sample','','10/11/2021');
    	Test.stopTest();
    }
}