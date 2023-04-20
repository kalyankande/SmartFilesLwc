trigger Lab1_1 on Batch__c (before insert) {
    List<Account> li=[select Id,Name from Account];
    map<String,Id> m =new map<String,Id>();
    for(Account a:li)
    {
        m.put(a.Name,a.Id);
    }
    for(Batch__c b:Trigger.New)
    {
        if(m.containskey(b.Company_Name__c	))
        {
           b.Account__c=m.get(b.Company_Name__c); 
        }
    }

}