public class apexexample1 {
    public void callme(String accrating){
    List<Account> acclist=[Select id,rating from Account where rating=:accrating];
        for(Account a:acclist){
            a.rating='Worm';
        }
        update acclist;
    }
}