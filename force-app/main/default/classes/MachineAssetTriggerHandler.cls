public with sharing class MachineAssetTriggerHandler {
	
    public void beforeInsert(List<Machine_Asset__c> newAssets){
        MachineAssetService.prepareAssets(newAssets);
    }
    
    public void beforeUpdate(
        List<Machine_Asset__c> newAssets,
        Map<Id,Machine_Asset__c> oldMap
    ){
        MachineAssetService.handleAssetUpdate(newAssets,oldMap);
    }
    
}