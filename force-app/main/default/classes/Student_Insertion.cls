public class Student_Insertion {
    public Student__c std	{set;get;}
    public Student_Insertion(){
        std=new Student__c();
    } 
    public PageReference create(){
       integer count=[select count() from Student__c where First_Name__c=:std.First_Name__c];
        if(count>0){
            apexpages.message msg=new apexpages.message(apexpages.Severity.ERROR,'Duplicate value Found!');
            apexpages.addMessage(msg);
            return null;
        }
        else{
            insert std;
            PageReference p=new PageReference('/'+std.Id);
            return p;
        }
    }
}