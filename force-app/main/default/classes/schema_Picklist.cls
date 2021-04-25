public class schema_Picklist {
    public list<string> fields	{set;get;}
    public list<selectOption> pl{set;get;}
    
    public void callme(){
        fields=new list<string>();
        pl=new list<selectOption>();
        schema.DescribeFieldResult result=Course__c.Subject__c.getDescribe();
        if(result.type == Schema.DisplayType.PICKLIST ){
            list<schema.PicklistEntry> values=new list<schema.PicklistEntry>();
            values=result.getPickListValues();
            for(schema.PicklistEntry s: values){
            fields.add(s.getLabel());
                system.debug(s.getValue());
                //selectOption ss=new selectOption(s.getLabel(),s.getValue(),false);
              //pl.add(ss);
            }
        }
                
    }
}