public class Account_Contact {
    public list<Account> accList	{set;get;}
    public String field				{set;get;}
    public String operator			{set;get;}
    public String value				{set;get;}
    public String query				{set;get;}
    public list<selectOption> optrList		{set;get;}
    public list<selectOption> fieldList		{set;get;}
    public list<selectOption> fieldSet		{set;get;}
    public list<string> fieldSetSelected	{set;get;}
    public list<selectOption> valueSet		{set;get;}
    public list<string> valueSetSelected	{set;get;}
    public list<string> mainList			{set;get;}
    public list<selectOption> selectedList		{set;get;}
    public list<string> fields				{set;get;}
    public set<string> mainSet				{set;get;}
    public set<string> selectedSet			{set;get;}
    public Account_Contact(){
        accList=new list<Account>();
        mainSet=new set<string>();
        selectedSet=new set<string>();
        Schema.DescribeSObjectResult a_desc = Account.sObjectType.getDescribe(); 
		Map<String, Schema.SObjectField> a_fields = a_desc.fields.getMap();
        set<string> mapSet=a_fields.keySet();
        mapSet.remove('id');
		fieldSet=new list<selectOption>();
        selectOption s=new selectOption('select','select');
        fieldSet.add(s);
        mainList=new list<string>();
        selectedList=new list<selectOption>();
        valueSet=new list<selectOption>();
        fieldSetSelected=new list<string>();
        valueSetSelected=new list<string>();
        fieldList=new list<selectOption>();
		for(string fld: mapSet){ 
             selectOption so=new selectOption(fld,fld);
            fieldSet.add(so);  
            fieldList.add(so);
            mainList.add(fld);
            //system.debug(fld);
		}
        mainSet.addAll(mainList);
        optrList=new list<selectOption>();
        list<string> optrs=new list<string>{'select','=','<','>','<=','>=','!='};
        fields=new list<string>{'Name','Rating','Industry','AnnualRevenue','Type'};
        for(string o: optrs){
            selectOption s1=new selectOption(o,o);
        	optrList.add(s1);
        }
        for(string s2: fields){
        	selectOption s3=new selectOption(s2,s2);
            fieldList.add(s3);
        }
        accList=new list<Account>();
        accList=[Select Name,Rating,Industry,AnnualRevenue,Type from Account];
    }
    public void search(){
        try{
            fields.clear();
            fields.addAll(selectedSet);
            query='Select id';
            for(string s: selectedSet){
                query=query+','+s;
            }
        query=query+' from Account Where ';
        if(field!='select' && field!='' && operator!='select' && operator!='' && value!=''){
            if(field=='AnnualRevenue' && operator!='select' && operator!='' && value!=''){
            query=query+field+operator+value;
            } else {
            query=query+field+operator+'\''+value+'\'';
            //System.debug(query);
            }
            
        accList=Database.query(query);
        //System.debug(query);
        }
        else{
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You are Entered values are Invalid(in order or in type)'));
        }
        } catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You are Entered values are Invalid(in order or in type)'));
            accList=Database.query(query);
    }
    }
    public void Add(){
        fieldList.clear();
        selectedSet.addAll(fieldSetSelected);
        for(string s: fieldSetSelected){
            mainSet.remove(s);
            selectedSet.add(s);
        }
        selectedList.clear();
        for(string s: selectedSet){
            selectOption so=new selectOption(s,s);
            selectedList.add(so);
        }
        for(string v: mainSet){
            selectOption so=new selectOption(v,v);
            fieldList.add(so);
        }
    }
    public void Remove(){
        fieldList.clear();
        selectedList.clear();
        mainSet.addAll(valueSetSelected);
        mainSet.remove('id');
        for(string s: valueSetSelected){
            selectedSet.remove(s);
            mainSet.add(s);
        }
        for(string v: mainSet){
            selectOption so=new selectOption(v,v);
            fieldList.add(so);
        }
        for(string s: selectedSet){
            selectOption so=new selectOption(s,s);
            selectedList.add(so);
        }
    }
}