public class JSON2_Exmp {
    public String AccName		{set;get;}
    public String jsonString	{set;get;}
    public void search(){
        List<Account> accList=[Select Name,Phone,Industry From Account where name=:AccName];
        System.JSONGenerator js=JSON.createGenerator(true);
            js.writeStartObject();
        if(accList.size()>0){
            //js.writeStartObject();
            js.writeStringField('Status','Success');
        	js.writeNumberField('Records',accList.size());
        	js.writeFieldName('Result');

            js.writeStartArray();
            for(Account a: accList){
                js.writeStartObject();
                js.writeStringField('Name',a.Name);
                js.writeStringField('Phone',a.Phone);
                js.writeStringField('Industry',a.Industry);
                js.writeEndObject();
            }
            js.writeEndArray();
            
        }
        js.writeEndObject();
            jsonString=js.getAsString();
        System.debug(jsonString);
    }
}