trigger Sum_Amount2 on Contact (after insert, after update, after delete, before update, after undelete) {
    if(trigger.isAfter && trigger.isInsert){
        trigger_Class.after(trigger.newmap);
    }  
    if(trigger.isAfter && trigger.isUpdate){
        trigger_Class.after(trigger.newmap);
    }
    if(trigger.isAfter && trigger.isUndelete){
        trigger_Class.after(trigger.newmap);
    }
    if(trigger.isAfter && trigger.isdelete){
        trigger_Class.before(trigger.oldmap);
    }
    if(trigger.isBefore && trigger.isUpdate){
        trigger_Class.before(trigger.oldmap);
    }
}