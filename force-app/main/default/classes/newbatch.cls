global class newbatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String searchString = '%' + 'ABSYZ' + '%';
        string query = 'Select id,Name From Account WHERE Name LIKE :searchString ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, list<Account> scope){
        list<Account> nnames = new list<Account>();
            for(Account b:scope){
            if(b.Name.contains('ABSYZ'))
    {
        b.Name = b.Name.replace('ABSYZ', ' ');
        nnames.add(b);
    }   
            
            
        }
        update nnames;
    
    }
    global void finish(Database.BatchableContext BC) {
          AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems    from AsyncApexJob where Id =:BC.getJobId()];
        
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'kande.kalyan8@gmail.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Batch Subject ' + a.Status);
            mail.setPlainTextBody('records processed ' + a.TotalJobItems +
           'with '+ a.NumberOfErrors + ' failures.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    

    

}