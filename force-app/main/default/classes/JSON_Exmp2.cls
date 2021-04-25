public class JSON_Exmp2 {
    public JSON_Exmp2(){
        String jsonString='{"Name":"Bhanu" ,"Age":30 ,"Number":123.2}';
        JSONParser jp=JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getCurrentToken()==JSONTOKEN.VALUE_NUMBER_INT){
                System.debug(jp.getIntegerValue());
            }
            if(jp.getCurrentToken()==JSONTOKEN.VALUE_NUMBER_FLOAT){
                System.debug(jp.getDecimalValue());
            }
        }
    }
}