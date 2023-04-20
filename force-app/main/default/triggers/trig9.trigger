trigger trig9 on Account (before insert) {
        List<Account> li=new List<Account>();
    set<Id> se=new set<id>();
    for(Account acc: Trigger.old)
    {
        se.add(acc.Id);
    }
    Map<Id,Account> m=new Map<Id,Account>([select Id,(select Id from Contacts)from Account where id in: se]);
    for(Account acc:Trigger.old)
    {
        if(m.get(acc.Id).Contacts.size()>3)
        {
            acc.adderror('Account has more than three contacts');
        }
    }
}