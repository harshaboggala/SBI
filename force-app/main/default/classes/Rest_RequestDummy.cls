@isTest
public class Rest_RequestDummy implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest request){
        String endPoint=request.getEndpoint();
        HttpResponse res=new HttpResponse();
        if(request.getEndpoint().endsWith('token')){
        String method=request.getMethod();
        System.assertEquals(endPoint,'https://login.salesforce.com/services/oauth2/token');
        System.assertEquals(method,'POST');
        
        String body='{"Status":"Success","access_token":""}';
        
        res.setBody(body);
    }
        else if(request.getEndpoint().endsWith('createOpportunity')){
        String method=request.getMethod();
        System.assertEquals(endPoint,'https://ap16.salesforce.com/services/apexrest/createOpportunity');
        System.assertEquals(method,'POST');
        
        String body='{"Status":"Success"}';
        //HttpResponse res=new HttpResponse();
        res.setBody(body);   
        }
        return res;
    }
}