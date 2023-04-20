public class eclass1 {
        public Map<Merchandise__c, List<Line_Item__c>> method(){
        Map<Merchandise__c, List<Line_Item__c>> obj = new Map <Merchandise__c, List<Line_Item__c>>();
        for(Merchandise__c m:[SELECT Id, Name,(SELECT Name, Unit_Price__c FROM Line_Items__r) FROM Merchandise__c]){
            obj.put(m,m.Line_Items__r);
        }
        System.debug(obj);
        return obj;
    }

}