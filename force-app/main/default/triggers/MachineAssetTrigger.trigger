trigger MachineAssetTrigger on Machine_Asset__c (before insert, before update, after insert) {
	
    MachineAssetTriggerHandler handler = new MachineAssetTriggerHandler();
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.beforeInsert(Trigger.new);
            handler.validateDuplicateSerialNumbers(Trigger.new);
        }
        if(Trigger.isUpdate){
            handler.beforeUpdate(Trigger.new,Trigger.oldMap);
        }
    }

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            handler.afterInsert(Trigger.new);
        }
    }
}