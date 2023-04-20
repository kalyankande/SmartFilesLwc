public with sharing class AccountDataController {
    @AuraEnabled (cacheable=true)
    public static List<Contact> fetchContacts(){
        return [SELECT Id, Name, Email, Phone, LeadSource, AccountId
                FROM Contact
                LIMIT 2000];
    }
}