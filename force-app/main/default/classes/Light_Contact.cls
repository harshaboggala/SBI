public class Light_Contact {
	@auraEnabled
    public static List<Account> callme(String name){
        List<Account> conList=[select Id,Name,Rating from Account where Name like :name+'%'];
        return conList;
    }
    @auraEnabled
    public static List<Contact> conRec(List<String> cl){
        list<Contact> cList=[select Id,FirstName,LastName from Contact where Contact.AccountId in :cl];
        return cList;
        // from VS Code
    }
}