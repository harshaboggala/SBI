public class Account_Light {
	@auraEnabled
    public static list<Account> invoke(){
        list<Account> accounts=[select id,name,phone from Account];
        return accounts;
	    //from github
    }
}
