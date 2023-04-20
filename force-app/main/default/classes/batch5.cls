global class batch5 implements Database.Batchable <SObject>{
global Database.QueryLocator start (Database.BatchableContext bc){
    String que='SELECT Id  from Line_Item_c where Merchandisec in(select id from Merchandise_c)';
    return Database.getQueryLocator(que);
}
    global void execute(Database.BatchableContext bc, List<Line_Item__c> line)
   {
       delete line;
   }
    public void finish(Database.BatchableContext bc)
    {
        System.debug('finish');
    }
}