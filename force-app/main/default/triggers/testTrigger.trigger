trigger testTrigger on Account (before insert) {
    for(Account a: Trigger.new){
        a.rating='Warm';
        a.Industry='Education';
        a.Ownership='public';
        
    }
}