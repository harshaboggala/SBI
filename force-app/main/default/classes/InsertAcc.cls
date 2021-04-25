public class InsertAcc {
    @auraEnabled
    public static string callme(Account acc){
        insert acc;
        return acc.Id;
    }
}