public with sharing class incentiveHandler {
    public static void createIncentiveRecord(List<Opportunity> allOpp) {
        set<id> ids = new set<id>();
        for(Opportunity opp:allOpp){
            if(opp.id!=null){
                ids.add(opp.id);
            }
        }
        Incentive__c incentiveList = new Incentive__c();
        for(Id oppoturnityids : ids){
            incentiveList.Opportunity__c = oppoturnityids;
        }
        insert incentiveList;   
    }
    Public static void CreatePayoutrecords(list<Incentive__c> incs){
        list<Payouts__c>  records = new list<Payouts__c>();
        list<Incentive__c> incId = new list<Incentive__c>();
        /* map<Incentive__c,String> mapInc = new map<Incentive__c,String>();
        for(Incentive__c inc:incs){
        String key = inc.Project_Segment__c + '|' + inc.Opportunity_Owner_Department__c + '|' + inc.Type_of_Sale__c + '|' + inc.Opportunity_Source__c;
        mapInc.put(inc, key);
        }*/
        
        Map< String,list<Building_Blocks__mdt> > mdtMap = new Map<String, list<Building_Blocks__mdt>>();
        for (Building_Blocks__mdt mdt : [Select Name__c,Opportunity_Source__c,Percentage__c,Project_Type__c,Type_of_Sale__c,User_Type__c  FROM Building_Blocks__mdt]) {
            String key = mdt.Project_Type__c + '|' + mdt.User_Type__c + '|' + mdt.Type_of_Sale__c + '|' + mdt.Opportunity_Source__c;
            List<Building_Blocks__mdt> listofBuldingBlocks = new List<Building_Blocks__mdt>();
            system.debug('Key'+key);
            if(mdtMap.get(key) != null){
                listofBuldingBlocks = mdtMap.get(key);
                listofBuldingBlocks.add(mdt);
                mdtMap.put(key,listofBuldingBlocks);
            }
            else{
                listofBuldingBlocks.add(mdt);
                mdtMap.put(key,listofBuldingBlocks);
            }  
        }
        for(Incentive__c inc:incs){
            String key2 = inc.Project_Segment__c + '|' + inc.Opportunity_Owner_Department__c + '|' + inc.Type_of_Sale__c + '|' + inc.Opportunity_Source__c;
            system.debug('key Values -->' + key2);
            if(mdtMap.get(key2) != null)
            {
                if (inc.Payouts__c) {
                    for(Building_Blocks__mdt mdtMaploop:mdtMap.get(key2)){
                        Payouts__c payoutRec = new Payouts__c();
                    payoutRec.Employee_Name__c = mdtMaploop.Name__c;
                    payoutRec.Incentive_Percentage__c = mdtMaploop.Percentage__c;
                    payoutRec.Incentive__c = inc.Id;
                    records.add(payoutRec);
                        
                    }   
                }
                system.debug('Map Values -->' + mdtMap.get(key2));
            }    
        }            
        if(records.size()>0){
            insert records;
        }
    }
}