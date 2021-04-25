public class contactRecords {
@auraEnabled
    public static list<contact> search(string acc){
        list<contact> conList=[Select id,firstname,lastname from contact where contact.account.name=:acc];
        return conList;
    }
}