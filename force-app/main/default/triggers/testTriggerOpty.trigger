trigger testTriggerOpty on Opportunity (before update) {
    for(Opportunity op: trigger.new){
        op.StageName='closed Won';
        op.CloseDate=System.today();
    }
    
}