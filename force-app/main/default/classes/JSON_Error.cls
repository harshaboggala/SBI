public class JSON_Error {
    public JSON_Error(){
        try{
            String JsonString='{"Status":"Failed","Errors":{"name":"Required Fields are Missing","phone":"Format nat Supported"}';
        System.JSONParser jp=JSON.createParser(JsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='Failed'){
                jp.nextToken();
                if(jp.getText()=='Errors'){
                    jp.nextToken();
                    JSON_Wrap a=(JSON_Wrap)jp.readValueAs(JSON_Wrap.class);
                    System.debug(a.name);
                    System.debug(a.phone);
                }
            }
        }
        }
        catch(Exception e){
            
        }
    }
}