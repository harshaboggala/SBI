trigger caseTrigger on Case (after insert, after update) {
    Workflow_Trigger_Case wtc=new Workflow_Trigger_Case();
    if(trigger.isAfter && trigger.isInsert){
        wtc.After(trigger.newMap);
    }
    if(trigger.isAfter && trigger.isUpdate){
        wtc.After(trigger.newMap);
        wtc.Before(trigger.newMap);
    }
}