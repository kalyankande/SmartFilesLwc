public inherited sharing class LWCExamples {
 
    @AuraEnabled(Cacheable = true)
    public static list<Contact> retriveAccs(String strAccName) {
        strAccName = '%' + strAccName + '%';
        list<Contact> lstAccs = [SELECT  Id, Name,AccountId,Phone,Email From Contact WHERE Name LIKE :strAccName];

        if(lstAccs.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return lstAccs; 
    }
}