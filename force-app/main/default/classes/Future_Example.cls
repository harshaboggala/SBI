public class Future_Example {
    public void FutureEx(){
        string fname='bhargav';
        string lname='kumar';
        string mno	='9996664441';
        string email='bha@aaa.com';
        callme(fname,lname,mno,email);
    }
    @future(callout=true)
    public static void callme(string fname, string lname, string mno, string email){
        Student__c std= new Student__c();
        std.First_Name__c=fname;
        std.Last_Name__c=lname;
        std.Mobile_No__c=mno;
        std.Email_ID__c=email;
        insert std;
    }
}