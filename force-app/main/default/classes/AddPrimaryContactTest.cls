@isTest
public class AddPrimaryContactTest{
    static testmethod void testQueueable(){
        List<Account> testAccounts = new List<Account>();
        for(Integer i=0; i<50; i++){
            testAccounts.add(new Account(Name='Account '+i, BillingState='CA'));
        }
        for(Integer j=0; j<50; j++){
            testAccounts.add(new Account(Name='Account '+j, BillingState='NY'));
        }
        insert testAccounts;
        
        Contact testContact = new Contact(FirstName='Harry', LastName='Potter');
        insert testContact;
        AddPrimaryContact add = new AddPrimaryContact(testContact, 'CA');
        Test.startTest();
        System.enqueueJob(add);
        Test.stopTest();
        System.assertEquals(50, [SELECT count() FROM Contact WHERE accountId in (SELECT Id FROM Account WHERE BillingState='CA')]);
    }
}