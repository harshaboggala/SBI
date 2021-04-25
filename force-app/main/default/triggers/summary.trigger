trigger summary on Contact (after insert, after update, after delete, before update, after undelete) {
    if(trigger.isAfter && trigger.isInsert){
        summary_Trigger.after(trigger.newmap);
    }  
    if(trigger.isAfter && trigger.isUpdate){
        summary_Trigger.after(trigger.newmap);
    }
    if(trigger.isAfter && trigger.isUndelete){
        summary_Trigger.after(trigger.newmap);
    }
    if(trigger.isAfter && trigger.isdelete){
        summary_Trigger.before(trigger.oldmap);
    }
    if(trigger.isBefore && trigger.isUpdate){
        summary_Trigger.before(trigger.oldmap);
    }
}