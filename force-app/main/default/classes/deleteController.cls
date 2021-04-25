public class deleteController {

   public String bkId {get; set;}  
   public List<Student__c> bankList {get{
   return [ select Id,First_Name__c,Last_Name__c,Mobile_No__c,Email_ID__c from Student__c Limit 5];
   } set;} 

 public deleteController() {     
      Student__c delbank = new Student__c();
     //bankList = [ Select Id, Name, Source__c, Services__c, Region__c from Bank__c Limit 10];
   }
   public PageReference save() {
     update bankList;
     return null;
    } 
   public PageReference deleteRecord(){
        Student__c remBank = [select id from Student__c where id =: bkId limit 1];
       system.debug(bkId);
        if(remBank != null)
        {
            try{
                delete remBank;
            }
            catch(DmlException ex){
                ApexPages.addMessages(ex);
            }
        }
       return null;
   }  

}