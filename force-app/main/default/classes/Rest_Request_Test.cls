@isTest
public class Rest_Request_Test {
	@isTest
    public static void testMe(){
        Rest_RequestDummy rr=new Rest_RequestDummy();
        test.setMock(HttpCalloutMock.class ,rr);
        //Rest_requestDummy2 rt=new Rest_requestDummy2();
        //test.setMock(HttpCalloutMock.class ,rt);
        RestRequest req=new RestRequest();
        RestResponse res=new RestResponse();
        req.requestURI = '/services/apexrest/createOpportunity';
    	req.httpMethod = 'POST';
        RestContext.request=req;
        RestContext.response=res;
        Rest_Request aa=new Rest_Request();
        aa.clientid='3MVG9n_HvETGhr3CVqtFt8uOkJYJhJUT.BYFxCLQixSNKbvddsfxoe7EZBSzjwEaYmnkee4sCr997lKXkrZN4';
        aa.clientsecret='FBD45E989459BA71FD306E5AF37200416338DDA51FA31E99968491B4CA9DA465';
        aa.username='harshavardan@codeit.com';
        aa.password='Fack@1995';
        test.startTest();
        aa.callme();
        
        aa.create();
        test.stopTest();
    }
}