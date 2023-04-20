public class demopclass {
    @AuraEnabled(cacheable=true)
        public static List<wrapperClass> getRelatedFilesByRecordId(String recordId) {
            // Get record file IDs        
            List<ContentDocumentLink> files = [SELECT ContentDocument.Title,ContentDocumentId,ContentDocument.Owner.Name, ContentDocument.FileType, ContentDocument.ContentSize, ContentDocument.LastModifiedDate, ContentDocument.CreatedDate, LinkedEntity.Type FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
            List<ID> fileIDs = new List<ID>();
         
            for (ContentDocumentLink docLink : files) {
               
                fileIDs.add(docLink.ContentDocumentId);
            }
            system.debug('files'+files);
            system.debug('data'+fileIDs);
     
            List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title
                FROM ContentVersion WHERE ContentDocumentId IN : fileIDs];
            Map<ID, ContentVersion> mapIdTitle = new Map<ID, ContentVersion>();
            for (ContentVersion docLink : docs) {
                mapIdTitle.put(docLink.ContentDocumentId, docLink);
            }
            system.debug('data111'+mapIdTitle);
            List<wrapperClass> listOfWrapperClass = new List<wrapperClass>();
                for (ContentDocumentLink docLink : files) {
                wrapperClass a = new wrapperClass();
                a.filetype = docLink.ContentDocument.FileType;
                 a.Ownername = docLink.ContentDocument.Owner.Name;
                a.contentTiTle = docLink.ContentDocument.Title;
                a.lastModified = docLink.ContentDocument.LastModifiedDate;
                 a.size = String.valueOf((docLink.ContentDocument.ContentSize));
                
               /* if(docLink.ContentDocument.ContentSize > 1024){
                    a.size = String.valueOf((docLink.ContentDocument.ContentSize)/1024 +'MB');
                }
                else{
                    a.size = String.valueOf(docLink.ContentDocument.ContentSize +'KB');
                }*/
                
                if(mapIdTitle.containskey(docLink.ContentDocumentId)){
                    a.fielExtension = mapIdTitle.get(docLink.ContentDocumentId).FileExtension;
                     a.ContentDocumentId = docLink.ContentDocumentId;
                    
                }
                listOfWrapperClass.add(a);
                fileIDs.add(docLink.ContentDocumentId);
            }
            return listOfWrapperClass;
            //return mapIdTitle;
            
        }
    
    public class wrapperClass{
        @auraenabled
        public string ContentDocumentId{get;set;}
        @auraenabled
        public string filetype{get;set;}
        @auraenabled
        public string contentTiTle{get;set;}
        @auraenabled
        public Datetime lastModified{get;set;}
        @auraenabled
        public String size{get;set;}
        @auraenabled
        public string fielExtension{get;set;}
        @auraenabled
        public string Ownername{get;set;}
            
    }
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