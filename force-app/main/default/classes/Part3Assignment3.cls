public with sharing class Part3Assignment3 {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppRecords(integer searchname) {
       system.debug('search+'+searchname);
        return [SELECT name, CloseDate, Amount, StageName FROM Opportunity where Amount= : searchname];
    }
}