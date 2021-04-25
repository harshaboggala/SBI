public class JSON_Exmp1 {
    public list<Integer> one 	{set;get;}
    public JSON_Exmp1(){
        one=new list<Integer>();
        String jsonString='{"Name":"Bhanu","Age":26 ,"Mobile" :"040-123456"}';
        JSONParser js=JSON.createParser(jsonString);
        while(js.nextToken()!=null){
            if(js.getCurrentToken()==JSONTOKEN.VALUE_NUMBER_INT){
                one.add(js.getIntegerValue());
            }
        }
        System.debug(one);
    }
}