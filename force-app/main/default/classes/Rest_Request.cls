public class Rest_Request {
	public String clientid		{set;get;}
    public String clientsecret	{set;get;}
    public String username		{set;get;}
    public String password		{set;get;}
    public String url			{set;get;}
    public String result		{set;get;}
    public String token			{set;get;}
    public Boolean flag			{set;get;}
    public Boolean flag2		{set;get;}
    public String Name		{set;get;}
    public String Stage		{set;get;}
    public date CloseDate	{set;get;}
    public String status	{set;get;}
    public Rest_Request(){
        flag=true;
        flag2=false;
    }
    public void callme(){
        flag=false;
        flag2=true;
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
    }
    public void create(){
        flag2=false;
        String url='https://ap16.salesforce.com/services/apexrest/createOpportunity';
        Http p=new http();
        String body='{"Name":"'+Name+'"}';
        HttpRequest request=new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setBody(body);
        System.debug('2');
        request.setHeader('Authorization','OAuth '+token);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response=p.send(request);
        status=response.getBody();
        System.debug(status);
    }
}