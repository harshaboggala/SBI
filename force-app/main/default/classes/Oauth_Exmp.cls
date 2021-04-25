public class Oauth_Exmp {
    public String clientid		{set;get;}
    public String clientsecret	{set;get;}
    public String username		{set;get;}
    public String password		{set;get;}
    public String url			{set;get;}
    public String result		{set;get;}
    public String token			{set;get;}
    public void callme(){
        Http p=new Http();
        url='https://login.salesforce.com/services/oauth2/token';
        HttpRequest request=new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        string body='grant_type=password&client_id='+clientid+'&client_secret='+clientsecret+'&username='+username+'&password='+password;
        request.setBody(body);
        HttpResponse response=p.send(request);
        result=response.getBody();
        System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                token=jp.getText();
            }
        }
        System.debug(token);
    }
}