public class Last_Week_Task {
   // public String selectedField	{set;get;}
    public String selectedTime	{set;get;}
    public List<Student__c> std	{set;get;}
    public string str	{set;get;}
    public void Last_Week_Task(){
        str='select Name,Name__c,Date_of_Birth__c,Email_ID__c from Student__c where createdDate ='+selectedTime;
       std=database.query(str);
     //  List<Student__c> std=[str];
      system.debug('std');
    }
    public void bhanu(){
        System.debug('std');
    }
}