public with sharing class RecordFileDownloaderController {
    @AuraEnabled
    public static List<Id> getfileIds(String recordId){
        Set<Id> contentDocumentIds = new Set<Id>();
        List<Id> contentVersionIds = new List<Id>();
        
        if(String.isNotBlank(recordId)) {
            for(ContentDocumentLink cdl : [SELECT ContentDocumentId,LinkedEntityId,ContentDocument.FileType FROM ContentDocumentLink WHERE LinkedEntityId =:recordId]) {
                contentDocumentIds.add(cdl.ContentDocumentId);
            }
        }
        if(contentDocumentIds.size() > 0) {
            for(ContentVersion cdv : [SELECT Id FROM ContentVersion WHERE isLatest = true AND ContentDocumentId IN :contentDocumentIds]) {
                contentVersionIds.add(cdv.Id);
            }
        }
        return contentVersionIds;
    }
}