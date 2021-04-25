public class SOQL_example {
    public List<SelectOption> operators {set;get;}
    public List<SelectOption> fields{set;get;}
    public String SelectOperator {set;get;}
    public String SelectField {set;get;}
    public String value {set;get;}
    public List<Student__c> stdList {set;get;}
    public String result {set;get;}
    public SOQL_example(){
        fields=new List<SelectOption>();
        List<String> options=new List<String>{'Name','Phone','Age'};
        List<String> optlist=new List<String>{'=','!=','<','>'};
        operators=new List<SelectOption>();
        SelectOption n=new SelectOption('none','-none-');
        fields.add(n);
        operators.add(n);
        for(String s1:options){
            SelectOption op1=new SelectOption(s1,s1);
            fields.add(op1);
        }
        for(String s2:optlist){
            SelectOption op2=new SelectOption(s2,s2);
            operators.add(op2);
        }
    }
    public void callme(){
        // stdList=new List<Student__c>();
      // stdList='select Name,Age from Student__c where :SelectFields :SelectOperators :value'; 
    	result='where  '+SelectField+SelectOperator+value;
    }
}