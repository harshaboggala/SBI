public with sharing class Student_Qualification {
    public boolean flag			{set;get;}
    public Student__c std		{set;get;}
    public id sid				{set;get;}
    public String	mail		{set;get;}
     public id stdid						{set;get;}
    public list<Education__c> eduList	{set;get;}
    public sscMarks sm					{set;get;}
    public interMarks im				{set;get;}
    public gradMarks gm					{set;get;}
    public Education__c	edu				{set;get;}
    public Boolean	sscFlag				{set;get;}
    public Boolean	interFlag			{set;get;}
    public Boolean	gradFlag			{set;get;}
    public Boolean CancelFlag			{set;get;}
    public Boolean pageFlag				{set;get;}
    public Integer rowCount				{set;get;}
    public Integer cc					{set;get;}
    public String email					{set;get;}
    public Boolean SubmitFlag			{set;get;}
    public Boolean mainpage				{set;get;}
    public set<String> Course_Name		{set;get;}
    public list<selectOption> picList	{set;get;}
    public list<String> RemovedList		{set;get;}
    public string	recordName			{set;get;}
    public map<string,Education__c> eduMap	{set;get;}
    
    public Student_Qualification(){
        eduMap=new map<string,Education__c>();
        eduList=new list<Education__c>();
        edu=new Education__c();
        sm=new sscMarks();
        im=new interMarks();
        gm=new gradMarks();
        sscFlag=interFlag=gradFlag=CancelFlag=pageFlag=false;
       	SubmitFlag=mainpage=true;
        Course_Name=new set<String>{'-Select-','SSC','Intermediate 1st','Intermediate 2nd','Graduation 1st','Graduation 2nd','Graduation 3rd' };
        picList=new list<selectOption>();
        addListtoMap();
        RemovedList=new list<string>();
        rowCount=1;
        cc=0;
        eduList.add(edu);
        
        system.debug(stdid);
        system.debug(email);
        flag=true;
        std=new Student__c();
    }
    public pageReference callme(){
        pageFlag=true;
        mainpage=false;
        insert std;
        sid=std.id;
        //sid='00B2w00000GXkWS';
        //mail='bhanu@gmail.com';
        //PageReference pr = new PageReference('/apex/eduDetails');
        //pr.setRedirect(true);
        return null;
    }
    public void validation(){
        flag=false;
    }
    public void AddRow(){
        //eduList=new list<Education__c>();
        cc++;
        if(cc>=1){
            CancelFlag=true;
        }
        if(rowCount<=6){
        edu=new Education__c();
        eduList.add(edu);
        rowCount++;
        }
        addListtoMap();
        
    }
    public void popup(){
        if(edu.Course_Name__c!='-Select-'){
        if(edu.Course_Name__c=='SSC'){
            sscFlag=true;
            interFlag=gradFlag=false;
        }
        
        if(edu.Course_Name__c=='Intermediate 1st' || edu.Course_Name__c=='Intermediate 2nd'){
            interFlag=true;
            sscFlag=gradFlag=false;
        }
        
        if(edu.Course_Name__c=='Graduation 1st' || edu.Course_Name__c=='Graduation 2nd' || edu.Course_Name__c=='Graduation 3rd'){
            gradFlag=true;
            interFlag=sscFlag=false;
        }
        }
        else{
            sscFlag=interFlag=gradFlag=false;
            ApexPages.Message Msg = new ApexPages.Message(ApexPages.severity.ERROR,'Pleas Select Valid Course Name');
            ApexPages.addMessage(Msg);
        }
    }
    public pageReference Submit(){
        insert eduList;
        eduList.clear();
        pageReference pr=new pageReference('/apex/00B2w00000GXkWS');
        return pr;
    }
    public void sscSubmit(){
        addListtoMap();
        //sscMarks sm=new sscMarks();
        //edu.Student_Name__c=stdid;
        edu.Course_Name__c=edu.Course_Name__c;
        edu.Student_Name__c='a012w00000eRAfGAAW';
        edu.Subject_Marks__c=sm.toString();
        system.debug(sm.toString());
        //system.debug(sm.Telugu+sm.Hindi+sm.English+sm.Mathamatics+sm.Science+sm.Social);
        edu.Aquired_Marks__c=sm.Telugu+sm.Hindi+sm.English+sm.Mathamatics+sm.Science+sm.Social;
        edu.Total_Marks__c=600;
        edu.Marks_Percentage__c=(edu.Aquired_Marks__c*100)/edu.Total_Marks__c;
        //eduList.add(edu);
        sm.Telugu=sm.English=sm.Hindi=sm.Mathamatics=sm.Science=sm.Social=null;
        sscFlag=false;
    }
    public void interSubmit(){
        //interMarks im=new interMarks();
        edu.Course_Name__c=edu.Course_Name__c;
        edu.Student_Name__c='a012w00000eRAfGAAW';
        edu.Subject_Marks__c=im.toString();
        edu.Aquired_Marks__c=im.Telugu+im.English+im.Mathamatics+im.Physics+im.Chemistry;
        edu.Total_Marks__c=500;
        edu.Marks_Percentage__c=(edu.Aquired_Marks__c*100)/edu.Total_Marks__c;
        //eduList.add(edu);
        im.Telugu=im.English=im.Mathamatics=im.Physics=im.Chemistry=null;
        interFlag=false;
        addListtoMap();
    }
    public void gradSubmit(){
        //gradMarks gm=new gradMarks();
        edu.Course_Name__c=edu.Course_Name__c;
        edu.Student_Name__c='a012w00000eRAfGAAW';
        edu.Subject_Marks__c=gm.toString();
        edu.Aquired_Marks__c=gm.Telugu+gm.English+gm.Mathamatics+gm.Computers+gm.Electronics;
        edu.Total_Marks__c=500;
        edu.Marks_Percentage__c=(edu.Aquired_Marks__c*100)/edu.Total_Marks__c;
        eduList.add(edu);
        gm.Computers=gm.Electronics=gm.English=gm.Mathamatics=gm.Telugu=null;
        gradFlag=false;
        addListtoMap();
        
    }
    public void popupCancel(){
        sscFlag=interFlag=gradFlag=false;
    }
    
    public void removeRecord(){
        cc=eduList.size();
        if(cc<=2){
            CancelFlag=false;
        }
        
        system.debug(recordName);
        eduMap.remove(recordName);
        eduList.clear();
        eduList=eduMap.values();
        addListtoMap();
    }
    public void addListtoMap(){
        eduMap.clear();
        for(Education__c el: eduList){
            eduMap.put(el.Course_Name__c, el);
        }
    }
    class sscMarks {
       	public integer Telugu		{set;get;}
        public integer Hindi		{set;get;}
        public integer English		{set;get;}
        public integer Mathamatics	{set;get;}
        public integer Science		{set;get;}
        public integer Social		{set;get;}
	}
    class interMarks {
        public integer Telugu		{set;get;}
        public integer English		{set;get;}
        public integer Mathamatics	{set;get;}
        public integer Physics		{set;get;}
        public integer Chemistry	{set;get;}
    }
    class gradMarks {
        public integer Telugu			{set;get;}
        public integer English			{set;get;}
        public integer Mathamatics		{set;get;}
        public integer Computers		{set;get;}
        public integer Electronics		{set;get;}
    }
}