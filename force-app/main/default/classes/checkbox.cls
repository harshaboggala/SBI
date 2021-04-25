public class checkbox {
    public list<string> names 	{set;get;}
    public list<string> state	{set;get;}
    public list<wrap> wList		{set;get;}
    public string text			{set;get;}
    public boolean check		{set;get;}
    public string result		{set;get;}
    public string sele			{set;get;}
    public wrap	w				{set;get;}
    public checkbox(){
        names=new list<string>{'Andhrapradesh','telangana','karnataka','Tamilnadu','kerala'};
        wList=new list<wrap>();
        state=new list<string>();
        for(string s:names){
             w=new wrap();
            w.name=s;
            w.che=false;
            wList.add(w);
        }
    }
    public void callme(){
        result=text;
        for(wrap w: wList){
            if(w.che==true){
                
                result=result+' '+w.name;
                
            }
        }
    }
    public class wrap{
        public string name		{set;get;}
        public Boolean che		{set;get;}
    }
}