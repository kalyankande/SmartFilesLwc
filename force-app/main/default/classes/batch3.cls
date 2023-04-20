public class batch3 implements Database.Batchable <SObject> 
{
    public Database.QueryLocator start (Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id from Account order by Name');
    }
    public void execute(Database.BatchableContext bc, List<Account> li)
    {
        Account[] upd=new Account[] {};
        for(AggregateResult ar:[Select AccountId a,count(Id) c from Contact WHERE AccountId in :li group by AccountId])
            upd.add(new Account(Id=(Id)ar.get('a'),Number_Of_Contacts__c=(Decimal)ar.get('c')));
        Update upd;
    }
    public void finish(Database.BatchableContext bc)
    {
        system.debug('Finish');
    }
}