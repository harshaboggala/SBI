public class eduDetails {
    public id stdid						{set;get;}
    public sscMarks sm					{set;get;}
    public interMarks im				{set;get;}
    public gradMarks gm					{set;get;}
    public AllWrapper	aw				{set;get;}
    public list<AllWrapper> awList		{set;get;}
    public Boolean	sscFlag				{set;get;}
    public Boolean	interFlag			{set;get;}
    public Boolean	gradFlag			{set;get;}
    public Integer rowCount				{set;get;}
    public String email					{set;get;}
    public Boolean SubmitFlag			{set;get;}
    public set<String> Course_Name		{set;get;}
    public string	recordName			{set;get;}
    public string rowName				{set;get;}
    public string editRecord				{set;get;}
    public map<String,AllWrapper> awMap		{set;get;}
    
    public eduDetails(){
        awList=new list<AllWrapper>();
        awMap=new Map<String,AllWrapper>();
        sm=new sscMarks();
        im=new interMarks();
        gm=new gradMarks();
        sscFlag=interFlag=gradFlag=false;
       	SubmitFlag=false;
        Course_Name=new set<String>{'-select-','SSC','Intermediate 1st','Intermediate 2nd','Graduation 1st','Graduation 2nd','Graduation 3rd' };
        rowCount=1;
        AddRow();
    }
    
    public void AddRow(){
        if(awList.size()==0){
            aw=new AllWrapper();
        	awList.add(aw);
        }
        else if(awList.size()!=0){
            awList.clear();
            for(AllWrapper el: awMap.values()){
                
                if(rowName==el.CourseValue){
                    awList.add(awMap.get(el.CourseValue));
        			
                    aw=new AllWrapper();
        			awList.add(aw);
                }
                else{
                    awList.add(awMap.get(el.CourseValue));
                }
        
            }
        }
        aw.editFlag=aw.rowFlag=aw.CancelFlag=false;
        selectList();
        
    }
    public void addListtoMap(){
        awMap.clear();
        for(AllWrapper aw: awList){
            if(aw.CourseValue!=null ){
            awMap.put(aw.CourseValue,aw);
            }
        }
    }
    public void selectList(){
        List<string> optedVal=new List<string>();
        aw.picList=new list<selectOption>();
        if(awList.size()>0){
            for(AllWrapper ed:awList){
                System.debug(ed);
                optedVal.add(ed.CourseValue);
            }
        }
        for(string s: Course_Name){
            if(awList.size()>0){
                if(!optedVal.contains(s)){
                    System.debug(s);
                    aw.picList.add(new selectOption(s,s));
                }
            }
            else{
                aw.picList.add(new selectOption(s,s));
            }
        }
    } 
    public void popup(){
        
        if(aw.CourseValue!='-select-'){
          
        if(aw.CourseValue=='SSC'){
            sscFlag=true;
            interFlag=gradFlag=false;
        }
        
        else if(aw.CourseValue=='Intermediate 1st' || aw.CourseValue=='Intermediate 2nd'){
            interFlag=true;
            sscFlag=gradFlag=false;
        }
        
        else if(aw.CourseValue=='Graduation 1st' || aw.CourseValue=='Graduation 2nd' || aw.CourseValue=='Graduation 3rd'){
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
        List<Education__c> eduList=new List<Education__c>();
        for(AllWrapper all: awList){
            Education__c edu=new Education__c();
            //edu.Student_Name__c=std.id;
            edu.Aquired_Marks__c=all.AquiredMarks;
            edu.Course_Name__c=all.CourseValue;
            edu.Total_Marks__c=all.TotalMarks;
            edu.Subject_Marks__c=all.SubjectMarks;
            edu.Marks_Percentage__c=all.AquiredMarks*100/all.TotalMarks;
            eduList.add(edu);
        }
        insert eduList;
        eduList.clear();
        pageReference pr=new pageReference('/apex/00B2w00000GXkWS');
        return pr;
    }
    public void sscSubmit(){
        if(awList.size()==6){
            submitFlag=true;
            for(AllWrapper al: awList){
                al.rowFlag=false;
            }
        }
        else{
            aw.rowFlag=true;
        }
        aw.editFlag=aw.CancelFlag=true;
        System.debug(aw.cVal);
        aw.SubjectMarks=sm.toString();
        aw.AquiredMarks=sm.Telugu+sm.Hindi+sm.English+sm.Mathamatics+sm.Science+sm.Social;
        aw.TotalMarks=600;
        aw.Percentage=aw.AquiredMarks*100/aw.TotalMarks;
        sm.Telugu=sm.Hindi=sm.English=sm.Mathamatics=sm.Science=sm.Social=null;
        addListtoMap();
        sscFlag=false;
    }
    public void interSubmit(){
        if(awList.size()==6){
            submitFlag=true;
            for(AllWrapper al: awList){
                al.rowFlag=false;
            }
        }
        else{
            aw.rowFlag=true;
        }
        aw.editFlag=aw.CancelFlag=true;
        aw.SubjectMarks=im.toString();
        aw.AquiredMarks=im.Telugu+im.English+im.Mathamatics+im.Physics+im.Chemistry;
        aw.TotalMarks=500;
        aw.Percentage=aw.AquiredMarks*100/aw.TotalMarks;
        im.Telugu=im.English=im.Mathamatics=im.Physics=im.Chemistry=null;
        interFlag=false;
        addListtoMap();
    }
    public void gradSubmit(){
        if(awList.size()==6){
            submitFlag=true;
            for(AllWrapper al: awList){
                al.rowFlag=false;
            }
        }
        else{
            aw.rowFlag=true;
        }
        aw.editFlag=aw.CancelFlag=true;
        aw.SubjectMarks=gm.toString();
        aw.AquiredMarks=gm.Telugu+gm.English+gm.Mathamatics+gm.Computers+gm.Electronics;
        aw.TotalMarks=500;
        aw.Percentage=aw.AquiredMarks*100/aw.TotalMarks;
        gm.Computers=gm.Electronics=gm.English=gm.Mathamatics=gm.Telugu=null;
        gradFlag=false;
        addListtoMap();
    }
    public void popupCancel(){
        sscFlag=interFlag=gradFlag=false;
    }
    public void editPopup(){
        system.debug('hello'+editRecord);
    	aw.CourseValue=editRecord;
        for(AllWrapper aw: awList){
            //if()
        System.debug(String.valueOf(aw.SubjectMarks));
        }
        popup();
    }
    
    public void removeRecord(){
        for(AllWrapper al: awList){
            al.CancelFlag=al.editFlag=al.rowFlag=true;
        }
        
        awMap.remove(recordName);
        awList.clear();
        awList=awMap.values();
        addListtoMap();
    }
    
    class AllWrapper {
		public Education__c eduData	    	{set;get;}
        public sscMarks sscData				{set;get;}
        public interMarks intData			{set;get;}
        public gradMarks gradData			{set;get;}
        public string cVal					{set;get;}
        public List<selectOption> picList	{set;get;}
        public String CourseValue			{set;get;}
        public String SubjectMarks			{set;get;}
        public Integer AquiredMarks			{set;get;}
        public Integer TotalMarks			{set;get;}
        public decimal Percentage			{set;get;}
        public Boolean rowFlag				{set;get;}
        public boolean editFlag				{set;get;}
    	public Boolean CancelFlag			{set;get;}
    	
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