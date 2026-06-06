trigger MachineAssetTrigger on Machine_Asset__c (before insert, before update) {
	
    MachineAssetTriggerHandler handler = new MachineAssetTriggerHandler();
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.beforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            handler.beforeUpdate(Trigger.new,Trigger.oldMap);
        }
    }
}