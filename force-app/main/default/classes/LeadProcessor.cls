public class LeadProcessor implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id FROM Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> list1 = new List<Lead>();
        for (Lead l : scope){
            l.LeadSource = 'Dreamforce';
            list1.add(l);
        }
        update list1;
    }
    public void finish(Database.BatchableContext bc){
    }
}