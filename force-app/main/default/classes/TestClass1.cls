@isTest
public class TestClass1 {
    @isTest
    private static void testMe(){
		Student_Insertion si=new Student_Insertion();
    	Student__c std=new Student__c();
    	std.First_Name__c='bhanu';
        std.Last_Name__c='prakash';
        std.Email_Id__c='bhanu@gmail';
        std.Mobile_No__c='040-1234568';
        si.create();
        
        //testData td=new testData();
        testData.data();
        Student__c s=new Student__c();
    	s.First_Name__c='bhanu';
        s.Last_Name__c='prakash';
        s.Email_Id__c='bhanu@gmail';
        s.Mobile_No__c='040-1234568'; 
        si.create();
        List<Apexpages.Message> msgs = ApexPages.getMessages();
		boolean b = false;
		for(Apexpages.Message msg: msgs){
            if (msg.getDetail().contains('Duplicate value Found!')){
                b = true;
            }
			}
			system.assert(b);
    		}
}