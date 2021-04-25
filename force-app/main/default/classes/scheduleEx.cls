public class scheduleEx implements schedulable {
    public void execute(schedulableContext sc){
        List<Student__c> std=[select id from Student__c where First_Name__c='bhanu'];
        for(Student__c s:std){
            s.First_Name__c='bhasker';
        }
        update std;
    }
}