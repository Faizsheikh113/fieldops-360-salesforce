public with sharing class MachineAssetService {
	public static void prepareAssets(
    	List<Machine_Asset__c> assets
    ){
        for(Machine_Asset__c asset: assets){
            if(String.isBlank(asset.Asset_Status__c)){
                asset.Asset_Status__c = 'Installed';
            }
            
            if(asset.Warranty_Start__C == null){
                asset.Warranty_Start__c = Date.today();
            }
            
            if(asset.Warranty_End__C == null){
                asset.Warranty_End__c = Date.today().addYears(1);
            }
        }
    }
    
    public static void handleAssetUpdate(
    	List<Machine_Asset__c> newAssets,
        Map<Id,Machine_Asset__c> oldMap
    ){
        for(Machine_Asset__c asset:newAssets){
            Machine_Asset__c oldAsset = oldMap.get(asset.Id);
            if(oldAsset.Asset_Status__c != asset.Asset_Status__c){
                System.debug('Asset Status Changes');
            }
        }
    }
}