public class eclass2 {
	    public void method(){
        List<Invoice__c> obj = new List<Invoice__c>();
        for(Invoice__c i:[SELECT Id, Name,(SELECT Id FROM Line_Items__r WHERE Line_Item_Total__c > 100) FROM Invoice__c]){
            Invoice__c obj1 = new Invoice__c();
            obj1.Id = i.Id;
            obj1.Status__c = 'Closed';
            obj.add(obj1);
        }
        System.debug(obj);
        update obj;
    }
}