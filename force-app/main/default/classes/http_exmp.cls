public class http_exmp {
    public String url			{set;get;}
    public List<String> places	{set;get;}
    public String value			{set;get;}
    public http_exmp(){
        places=new List<String>();
        url='http://www.postalpincode.in/api/pincode/';
    }
    public void search(){
        url=url+value;
        
        Http p=new Http();
        HttpRequest hr=new HttpRequest();
        hr.setEndPoint(url);
        hr.setMethod('GET');
        HttpResponse res=p.send(hr);
        String body=res.getBody();
        JSONParser jp=JSON.createParser(body);
        while(jp.nextToken()!=null){
            if(jp.getText() =='Name'){
                jp.nextToken();
                places.add(jp.getText());
            }
        }
        
    }
}