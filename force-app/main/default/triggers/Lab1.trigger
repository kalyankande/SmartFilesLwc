trigger Lab1 on Contact (after insert,after update) {
    List<Account> acc= new List<Account>();
    for(Contact c:Trigger.New)
    {
        Account a=new Account();
        a.Id=c.AccountId;
        a.Email__c=c.Email;
        acc.add(a);
    }
    update acc;
    

}