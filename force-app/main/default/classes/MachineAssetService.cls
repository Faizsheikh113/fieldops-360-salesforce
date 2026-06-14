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
    Map<Id, Machine_Asset__c> oldMap,
    Boolean isInsert  // NEW PARAMETER
){
    List<Service_Ticket__c> ticketsToCreate = new List<Service_Ticket__c>();
    for(Machine_Asset__c asset : newAssets){

        Boolean shouldCreate = false;

        if(isInsert){
            // On insert — just check status
            shouldCreate = asset.Asset_Status__c == 'Under Maintenance';
        } else {
            // On update — check status changed to Under Maintenance
            Machine_Asset__c oldAsset = oldMap.get(asset.Id);
            shouldCreate = oldAsset.Asset_Status__c != asset.Asset_Status__c
                           && asset.Asset_Status__c == 'Under Maintenance';
        }

        if(shouldCreate){
            String ticketType = 'Maintenance';
            Service_Ticket__c ticket = new Service_Ticket__c();
            ticket.Name					= 'TKT-' + ticketType + '-' + Date.today().format();
            ticket.Machine_Asset__c = asset.Id;
            ticket.Subject__c       = 'Auto: ' + asset.Asset_Name__c + ' needs maintenance';
            ticket.Status__c        = 'Assigned';
            ticket.Priority__c      = 'Medium';
            ticket.Ticket_Type__c   = ticketType; // FIXED
            ticket.SLA_Level__c     = 'Bronze';
            ticket.SLA_Due_Date__c  = DateTime.now().addHours(48);
            ticketsToCreate.add(ticket);
        }
    }
    if(!ticketsToCreate.isEmpty()){
        insert ticketsToCreate;
    }
}


	public static void validateSerialNumbers(
    	List<Machine_Asset__c> assets
	){

    Set<String> serialNumbers = new Set<String>();

    for(Machine_Asset__c asset : assets){

        if(String.isNotBlank(
            asset.Serial_Number__c
        )){
            serialNumbers.add(
                asset.Serial_Number__c
            );
        }
    }

    Map<String, Machine_Asset__c> existingAssets =
        new Map<String, Machine_Asset__c>();

    for(Machine_Asset__c existing : [
        SELECT Id, Serial_Number__c
        FROM Machine_Asset__c
        WHERE Serial_Number__c IN :serialNumbers
    ]){

        existingAssets.put(
            existing.Serial_Number__c,
            existing
        );
    }

    for(Machine_Asset__c asset : assets){
        if(existingAssets.containsKey(
            asset.Serial_Number__c
        )){
            asset.Serial_Number__c.addError(
                'Serial Number already exists.'
            );
        }
    }
	}
}