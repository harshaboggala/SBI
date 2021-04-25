public class God_Details {
    public String clientid		{set;get;}
    public String clientsecret	{set;get;}
    public String username		{set;get;}
    public String password		{set;get;}
    public String url			{set;get;}
    public String result		{set;get;}
    public String token			{set;get;}
    public String Name			{set;get;}
    public String status		{set;get;}
    public void Sample(){
        clientid='3MVG9n_HvETGhr3CVqtFt8uOkJYJhJUT.BYFxCLQixSNKbvddsfxoe7EZBSzjwEaYmnkee4sCr997lKXkrZN4';
        clientsecret='FBD45E989459BA71FD306E5AF37200416338DDA51FA31E99968491B4CA9DA465';
        username='harshavardan@codeit.com';
        password='Fack@1995';
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
    public String gLocation			{set;get;}
    public String gContact			{set;get;}
    public String gGender			{set;get;}
    public void create(){
        String url='https://ap16.salesforce.com/services/apexrest/Search';
        Http p=new http();
        
        String body='{"Name":"'+Name+'"}';
        HttpRequest request=new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setBody(body);
        request.setHeader('Authorization','OAuth '+token);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response=p.send(request);
        result=response.getBody();
        
        System.debug(result);
        /*System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=null){
            jp.nextToken();
            if(jp.getText()==Name){
                //Example ex = (Example)JSON.deserialize(jsonString, Example.class);*/
                God_wrapper g=(God_wrapper)JSON.deserialize(result,God_wrapper.class);
                //God__c g=new God__c();
                gLocation=g.Location;
                gContact=g.ContactNo;
                gGender=g.Gender;
                System.debug(gLocation);
                System.debug(gContact);
                System.debug(gGender);
            //}
        //}
    }
}