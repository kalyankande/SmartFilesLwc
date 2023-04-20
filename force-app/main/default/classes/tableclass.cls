public with sharing class tableclass{
    @AuraEnabled
    public static List<Account> getopportynity() {
        return [SELECT Id, Name, Type,Website,AnnualRevenue,Phone,Rating FROM Account LIMIT 10];
    }
}