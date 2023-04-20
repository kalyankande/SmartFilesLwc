public with sharing class Task2 {
    @AuraEnabled(cacheable=true)
    public static List<Booking__c> getDue(Id customerID){
        return [Select ActualFare__c,Customer__r.Name from Booking__c  where Paid__c !=true and Customer__r.Id =:customerID];
    }
}