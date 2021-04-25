@isTest
public class Rest_requestDummy2 {
	public HttpResponse respond(HttpRequest request){
        String endPoint=request.getEndpoint();
        String method=request.getMethod();
        System.assertEquals(endPoint,'https://login.salesforce.com/services/oauth2/token');
        System.assertEquals(method,'POST');
        
        String body='{"Status":"Success"}';
        HttpResponse res=new HttpResponse();
        res.setBody(body);
        
        return res;
    }
}