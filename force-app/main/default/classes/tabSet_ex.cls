public class tabSet_ex {
    @auraEnabled
    public static string callme(string fname,string lname,string mail,string phone,string qual,string subject){
        Student__c std=new Student__c();
        std.First_Name__c=fname;
        std.Last_Name__c=lname;
        std.Email_ID__c=mail;
        std.Mobile_No__c=phone;
        insert std;
        return std.id;
    }
}