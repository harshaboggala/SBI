public with sharing class popup_Example {

    public Boolean displayPopup {get;set;}
    public list<Account> Acclist {set;get;}
    public popup_Example(ApexPages.StandardController controller) {
		Acclist=new list<Account>();
        Acclist=[select Name,AccountNumber,Industry,Rating from Account];
    }
    
    public void showPopup()
    {
        
    displayPopup = true;

    
    }
    
    public void closePopup() {
        displayPopup = false;
        
    }
    
    public PageReference redirectPopup()
    {
    displayPopup = false;
        //Please uncomment below 3 statements and replace YourObjectId
       // PageReference p=new Pagereference('/'+YourObjectId);
       //  p.setRedirect(true);
       //  return p;
       return null; 
    }
    


}