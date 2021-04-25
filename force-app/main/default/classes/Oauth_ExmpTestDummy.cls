@isTest
public class Oauth_ExmpTestDummy implements HttpCalloutMock{
    //public String tok	{set;get;}
    public HttpResponSe respond(HttpRequest request){
        String endPoint=request.getEndpoint();
        String Method=request.getMethod();
        System.assertEquals(endPoint,'https://login.salesforce.com/services/oauth2/token');
        System.assertEquals(Method,'POST');
        HttpResponse response=new Httpresponse();
        response.setBody('{"access_token":"true"}');
        return response;
    }
}