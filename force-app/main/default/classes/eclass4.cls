public class eclass4 {
	    public void method(){
        set<id> S = new set<id>();
        List<Invoice__c> obj = new List<Invoice__c>();
        for(Line_Item__c l:[SELECT Id, Name FROM Line_Item__c WHERE Merchandise__r.Order_Complete__c = TRUE]){
            S.add(l.Id);
            System.debug('Set contains the following Ids:' + l.Id);
        }
        for(Invoice__c i:[SELECT Id, Name,(SELECT Id FROM Line_Items__r WHERE Id in :S) FROM Invoice__c]){
            Invoice__c obj1 = new Invoice__c();
            obj1.Id = i.Id;
            obj1.Order_Complete__c = TRUE;
            obj.add(obj1);
        }
        System.debug(obj);
        update obj;
    }
}