global class newbatchclass implements Database.Batchable<sObject> {
   global Database.QueryLocator start(Database.BatchableContext BC) {
       
        String query = 'SELECT Id,Name,MobilePhone FROM Contact';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Contact> conList){
        // process each batch of records
        for(Contact con : conList){
            con.MobilePhone = '0000000000';
        }
        update conList;
        
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}