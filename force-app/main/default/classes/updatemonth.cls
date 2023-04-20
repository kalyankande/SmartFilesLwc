global class updatemonth implements Database.Batchable<sObject> {
     public String query = 'select id, name,CreatedDate from Contact ';//WHERE CreatedDate = LAST_N_DAYS:30';

   global Database.QueryLocator start(Database.BatchableContext BC) {
              
           return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Contact> scope){
       // if(scope.size()==0){
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
// Set recipients to two contact IDs.
// Replace IDs with valid record IDs in your org.
message.toAddresses = new String[] { 'kande.kalyan8@gmail.com'};
message.optOutPolicy = 'FILTER';
message.subject = 'Alert!!';
message.plainTextBody = 'Its been 30 days you have been created a record ';
Messaging.SingleEmailMessage[] messages = 
    new List<Messaging.SingleEmailMessage> {message};
         Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: '
          + results[0].errors[0].message);
}
            
         
       // }
        
      
        
       
                
    }
    public void finish(Database.BatchableContext bc){
        
    }
}