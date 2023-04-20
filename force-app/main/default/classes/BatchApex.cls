global class BatchApex implements Database.Batchable<sObject>{
    List<Bike__c> casToUpdate = new List<Bike__c>();
    String query = 'SELECT Id,DueToService__c,KMCovered__c,IsServiced__c  FROM 	Bike__c';

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Bike__c> cas){
        for(Bike__c c : cas){
            if(c.KMCovered__c <= 200){
                if(c.IsServiced__c = FALSE){
                c.DueToService__c = TRUE; 
                casToUpdate .add(c );     
                }
            }

        }
        update casToUpdate ;
    }

    global void finish(Database.BatchableContext BC){     
    }    
}