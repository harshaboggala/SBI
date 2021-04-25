public class Rest_Practice {
    public String pin				{set;get;}
    public List<string> villeges	{set;get;}
    public void search(){
        villeges=new List<String>();
        http h=new http();
        httpRequest request=new httpRequest();
        String str='http://www.postalpincode.in/api/pincode/'+pin;
        request.setEndpoint(str);
        request.setMethod('GET');
        httpResponse response=h.send(request);
        String result=response.getBody();
        System.debug(result);
        System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='Name'){
                jp.nextToken();
                villeges.add(jp.getText());
            }
        }
    }
}