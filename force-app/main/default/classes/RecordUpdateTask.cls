public class RecordUpdateTask {
    public RecordUpdateTask(){}
    public void bhanu(){
        map<id,Student__c> stdMap=new map<id,Student__c>([Select Id,Name__c,Mobile_No__c from Student__c]);
        List<Student__c> stdList=new List<Student__c>([Select Id,Name__c,Mobile_No__c from Student__c]);
        List<Student__c> slist=new List<Student__c>();
        //set<id> con=stdMap.keySet();
        list<Student__c> conList=stdMap.values();
        //system.debug(conList[conList.size()-1]);
        Integer i=1;
        for(Student__c s: stdList){
            s.Mobile_No__c=conList[conList.size()-i].Mobile_No__c;
            system.debug(s.Mobile_No__c);
            i=i+1;
            slist.add(s);
        }
        update slist;
    }
}