global class batch1 implements Database.Batchable <SObject>{
global Database.QueryLocator start (Database.BatchableContext bc)
{
    return Database.getQueryLocator('SELECT name from Account');
}
   global void execute(Database.BatchableContext bc, List<Account> acList)
   {
       for(Account ac :acList)
       {
          ac.name = 'ABSYZ'+ac.name;
           
       }
       
       update acList;
   }
    
    global void finish(Database.BatchableContext bc)
    {
        System.debug('Finish');
    }
    
}