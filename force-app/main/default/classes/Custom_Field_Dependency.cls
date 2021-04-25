public class Custom_Field_Dependency {
    public boolean flag1				{set;get;}
    public boolean flag2				{set;get;}
    public boolean flag3				{set;get;}
    public string state					{set;get;}
    public string Dist					{set;get;}
    public string place					{set;get;}
    public string des					{set;get;}
    public set<string> sList			{set;get;}
    public list<selectOption> stateList	{set;get;}
    public list<selectOption> distList	{set;get;}
    public list<selectOption> placeList	{set;get;}
	public map<string,list<string>> dList		{set;get;}
    public map<string,list<string>> pList		{set;get;}
    public map<string,string> description 			{set;get;}
    public Custom_Field_Dependency(){
        flag1=flag2=flag3=false;
        sList=new set<string>{'Andhrapradesh','Telangana','Karnataka'};
        string[] aplist=new string[]{'Chittoor','Kadapa','Anantapure'};
		string[] tglist=new string[]{'Varangal','Kakinada','Hyderabad'};
        string[] kalist=new string[]{'Bangalore','Mysore','KGF'};
        dList=new map<string,list<string>>();
        dList.put('Andhrapradesh', aplist);
        dList.put('Telangana', tglist);
        dList.put('Karnataka', kalist);
        system.debug(dlist);
        system.debug(dlist.get('Telangana'));
        pList=new map<string,list<string>>();
        string[] chi=new string[]{'Palamaner','Madhanapalli','Tirupati'};
        string[] kad=new string[]{'Kadapa','Jammalamadugu','Proddature'};
        string[] ana=new string[]{'Gooty','Anantapure','Kalikiri'};
        string[] hyd=new string[]{'SRNagar','Maitrivanam','Koti'};
        string[] var=new string[]{'Place1','Place2','Place3'};
        string[] kaki=new string[]{'Kakinada1','Kakinada2','Kakinada3'};
        string[] mys=new string[]{'Mysore1','Mysore2','Mysore3'};
        string[] kgf=new string[]{'kgf1','kgf2','kgf3'};
        string[] ban=new string[]{'Bangalore','Sivsjinagar','Tinfactory'};
        pList.put('Chittoor',chi);
        pList.put('Kadapa',kad);
        pList.put('Anantapure',ana);
        pList.put('Varangal',var);
        pList.put('Kakinada',kaki);
        pList.put('Hyderabad',hyd);
        pList.put('Bangalore',ban);
        pList.put('Mysore',mys);
        pList.put('KGF',kgf);
        description=new map<string,string>();
        stateList=new list<selectOption>();
        distList=new list<selectOption>();
        placeList=new list<selectOption>();
        for(string s: sList){
              selectOption ss=new selectOption(s,s);
            stateList.add(ss);
        }
        
    }
    public void callme(){
        flag1=true;
        flag2=flag3=false;
        //system.debug(state);
        //system.debug(ddlist);
        distList.clear();
        for(string s: dList.get(state)){
            selectOption ss=new selectOption(s,s);
            distList.add(ss);
           // system.debug(s);
        }
    }
    public void callmee(){
        flag2=true;
        flag3=false;
        system.debug(dist);
        placeList.clear();
        for(string s: pList.get(dist)){
            selectOption ss=new selectOption(s,s);
            placeList.add(ss);
        }
    }
    public void callmme(){
        flag3=true;
        des='You are selected the city '+place;
    }
}