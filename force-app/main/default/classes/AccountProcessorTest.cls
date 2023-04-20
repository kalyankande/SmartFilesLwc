@IsTest
private class AccountProcessorTest{
    @IsTest
    private static void testCountContacts(){
        Account newAcc = new Account(Name = 'Test Account');
        insert newAcc;
        
        Contact newCon1 = new Contact(FirstName='Virat', LastName='Kohli', AccountId=newAcc.Id);
        insert newCon1;
        
		Contact newCon2 = new Contact(FirstName='Hardik', LastName='Pandya', AccountId=newAcc.Id);
        insert newCon2;
        
        List<Id> Ids = new List<Id>();
		Ids.add(newAcc.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(Ids);
        Test.stopTest();
    }
}