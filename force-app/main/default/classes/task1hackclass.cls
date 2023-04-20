public class task1hackclass {
    @auraEnabled
public static list<Hub__c> getAllhubs()
    {
       list<Hub__c> hu =[select id,Name,Active__c,Rating__c,Color__c from Hub__c];
       return hu;
    }
}