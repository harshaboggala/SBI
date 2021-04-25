public class JSON_Example {
    
    public JSON_Example(){
        String jString='{"Name":"Bhanu","Age":26,"Salay":9.5,"Phone":"7382687243"}';
        JSONParser jp=JSON.createParser(jString);
        While(jp.nextToken()!=null){
            if(jp.getCurrentToken()==JSONTOKEN.VALUE_NUMBER_INT){
                Integer a=(Integer)jp.getIntegerValue();
                System.debug('Integer value is: '+a);
            }
            if(jp.getCurrentToken()==JSONTOKEN.VALUE_NUMBER_FLOAT ){
                Decimal b=(Decimal)jp.getDecimalValue();
                System.debug('Decimal value is: '+b);
            }
        }
    }
}