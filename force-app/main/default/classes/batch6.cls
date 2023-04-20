global class batch6 implements Database.Batchable <SObject>{
global Database.QueryLocator start (Database.BatchableContext bc)
{
    return Database.getQueryLocator('SELECT Priority_c,Invoice_Totalc  from Invoice_c');
}
   global void execute(Database.BatchableContext bc, List<Invoice__c> inList)
   {
       for(Invoice__c inv : inList)
       {
           if(inv.Invoice_Total__c >=0 && inv.Invoice_Total__c<=10000)
           {
               inv.Priority__c='Low';
           }
           else if(inv.Invoice_Total__c >10000 && inv.Invoice_Total__c<=50000)
           {
               inv.Priority__c='Medium';
           }
           else if(inv.Invoice_Total__c >50000)
           {
               inv.Priority__c='High';
           }
           update inList;
       }
   }
    global void finish(Database.BatchableContext bc)
    {
        System.debug('Finish');
    }
}