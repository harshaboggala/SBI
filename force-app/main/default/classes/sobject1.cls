public class sobject1 {
//public string First_Name{set;get;}
//public string Last_Name{set;get;}
//public string Mobile_No{set;get;}
//public string Email_ID{set;get;}
public Student__c std {set;get;}
    public sobject1(){
        std=new Student__c();
    }
    public PageReference create(){
      // std.Date_of_Birth__c=system.today();
        insert std;
      PageReference p=new PageReference('/'+std.Id);
      return p;
    }
    public void cancel(){
        std=new Student__c();
    }
}