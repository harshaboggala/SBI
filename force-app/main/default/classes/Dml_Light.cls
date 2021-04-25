public class Dml_Light {
	@auraEnabled
    public static String callme(string name, string phone, string industry){
        Account acc=new Account();
        string result;
        try{
            acc.Name=name;
            acc.Phone=phone;
            acc.Industry=industry;
            insert acc;
            result='Record Insert Successfully';
        }
        catch(exception e){
            result='Record Insert Faild';
        }
        return result;
    }
}