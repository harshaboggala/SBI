public class http_Utrace {
    public String ip				{set;get;}
    public Map<String,object> uMap	{set;get;}
    public void callme(){
        uMap=new Map<String,object>();
        Http p=new Http();
        HttpRequest req=new HttpRequest();
        String url='http://xml.utrace.de/?query='+ip;
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse response=p.send(req);
        String Body=response.getBody();
        Dom.Document doc=new Dom.Document();
        doc.load(Body);
        Dom.XmlNode root=doc.getRootElement();
        List<Dom.XmlNode> c1=root.getChildElements();
        List<Dom.XmlNode> c2=c1[0].getChildElements();
        for(Dom.XmlNode a: c2){
            uMap.put(a.getName(),a.getText());
        }
    }
}