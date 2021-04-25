@isTest
public class test_Rest_Insert implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest request){
        String endPoint=request.getEndpoint();
        String method=request.getMethod();
        System.assertEquals(endPoint,'');
        System.assertEquals(method,'GET');
        HttpResponse response=new HttpResponse();
        response.setBody('{"Name":"sample","Stage":"Qualification","CloseDate":"2021/10/11"}');
        
        return response;
    }
}