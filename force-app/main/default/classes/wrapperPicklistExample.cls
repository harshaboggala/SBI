public class wrapperPicklistExample {
    public set<string> listValue			{set;get;}
    public list<listWrapper> 	wrapList	{set;get;}
    public string selected					{set;get;}
    public listWrapper lw					{set;get;}
    public wrapperPicklistExample(){
        listValue=new set<string>{'value1','value2','value3','value4'};
        wrapList=new list<listWrapper>();
        //lw=new listWrapper();
        //wrapList.add(lw);
        addRecords();
    }
    public void addRecords(){
        
        lw=new listWrapper();
        lw.pickList=new list<selectOption>();
        List<String> strs=new List<String>();
        if(wrapList.size()>0){
            for(listWrapper vis:wrapList){
                strs.add(vis.value);
            }
        }
        System.debug('all sts'+strs);
        	for(String s: listValue){
                System.debug(' check pro '+strs+' ---> '+s+'===='+strs.contains(s));
                if(wrapList.size()>0){
                    if(!strs.contains(s)){
                        selectOption ss=new selectOption(s,s);
                        lw.pickList.add(ss);
                    }
                }
                else{
                	lw.pickList.add(new selectOption(s,s));
            	}
            }
        System.debug('vishnu'+lw.pickList);
        lw.value=lw.pickList[0].getValue();
       	wrapList.add(lw);
    }
   public class listWrapper {
        public string  name						{set;get;}
        public string value						{set;get;}
        public string selected					{set;get;}
        public list<selectOption> pickList		{set;get;}
        
    }
}