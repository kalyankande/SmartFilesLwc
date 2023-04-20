public class eclass3 {
	    public static void method(){
        set<Id> se= new set<Id>();
        list<Merchandise__c>li=new List<Merchandise__c>();
        for(Merchandise__c mer:[SELECT Id,Name,Quantity__c,Price__c FROM Merchandise__c WHERE Price__c!=NULL]){
            se.add(mer.Id);
        }
        for(Merchandise__c l:[SELECT Id,Price__c,Quantity__c,(SELECT Id,Unit_Price__c FROM Line_Items__r) FROM Merchandise__c]){
            Line_Item__c obj1 = new  Line_Item__c();
            Merchandise__c obj2 = new Merchandise__c();
            obj2.Id=l.Id;
            Double x = (Double)obj1.Unit_Price__c;
            Double y = (Double)obj2.Price__c;
            x = y / obj2.Quantity__c;
            li.add(obj2);
        }
        System.debug(li);
        update li;
    }
}