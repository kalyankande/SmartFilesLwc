global class MyBatchClass11 implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Query User object to get last name and email address of all users
        return Database.getQueryLocator([
            SELECT FirstName, LastName, Email
            FROM User
        ]);
    }
    
    global void execute(Database.BatchableContext BC, List<User> userList) {
        List<String> matchingLastNames = new List<String>();
        // Query Custom Metadata object to get the text field value
        Kalyan__mdt customMetadata = [SELECT LastName__c FROM Kalyan__mdt LIMIT 1];
        String textFieldValue = customMetadata.LastName__c;
        // Loop through each user and compare last name with text field value
        for (User user : userList) {
            System.debug('user'+user.LastName);
            if (user.LastName == textFieldValue) {
                // If there is a match, add last name and email to list
                matchingLastNames.add(user.LastName + ', ' + user.Email);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[]{user.Email});
                System.debug('User Email is: ' + user.Email);
                mail.setSubject('Reminder to upload carbon footprint records');
                String body = 'Dear ' + user.FirstName + ',\n\n';
                body += 'This a reminder to let you know about the carbon footprint data of last month that needs to be uploaded into the system. If you have any queries or concerns please do get in touch with the system administrator.\n\n';
                body += 'IGNORE, if already uploaded into the system./n/n'; 
                body += 'Have a great day!.\n\n';
                body += 'Thank You.\n';
                body += 'ABSYZ';
                
                mail.setPlainTextBody(body);
                System.debug('Email is: ' + mail);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
            }
        }
        // Do something with the list of matching last names and email addresses
    }
    
    global void finish(Database.BatchableContext BC) {
        // Do any cleanup here
    }
}