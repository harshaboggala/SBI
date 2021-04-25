@isTest
public class testData {
	@isTest
    public static void data(){
        Student__c std1=new Student__c(First_Name__c='bhanu', Last_Name__c='prakash',Email_Id__c='bhanu@gmail.com',Mobile_No__c='040-123123');
            insert std1;
    }
}