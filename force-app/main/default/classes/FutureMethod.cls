public class FutureMethod {
    public void FutureMethod(){
        system.debug('bhanu');
        invoke('bhanu','prakash');
    }
    @future()
    public static void invoke(string fname,string lname){
        Student__c std=new Student__c();
        std.First_Name__c=fname;
        std.Last_Name__c=lname;
        insert std;
    }
}