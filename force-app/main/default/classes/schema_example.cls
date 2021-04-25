public class schema_example {
    public List<String> objNames {set;get;}
    public List<String> fldNames {set;get;}
    public Set<String> key {set;get;}
    //public String a {set;get;}
    public schema_example(){
        objNames=new List<String>();
       key=new Set<String>();
        Map<String,Schema.sobjectType> objmap=Schema.getGlobalDescribe();
      key=objmap.keySet();
        for(String s:key){
            Schema.SobjectType obj=objmap.get(s);
            Schema.DescribeSObjectResult results=obj.getDescribe();
            objNames.add(results.getName());
        }
    }
}