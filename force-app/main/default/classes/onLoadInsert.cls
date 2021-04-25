public class onLoadInsert {
    public onLoadInsert(){
        //create();
    }
    public void create(){
        Account acc=new Account();
        acc.Name='NHSollutions';
        acc.AnnualRevenue=100000000;
        acc.AccountSource='web';
        acc.Industry='Education';
        acc.Rating='Warm';
        insert acc;
    }
}