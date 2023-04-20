public with sharing class opportuninyHandler {

   
 public class OpportunityData {
        @AuraEnabled public String ownerName { get; set; }
        @AuraEnabled public Integer numOpportunities { get; set; }
        @AuraEnabled public Decimal successRate { get; set; }
    }

    @AuraEnabled(cacheable=true)
    public static List<OpportunityData> getOpportunityData() {
        List<OpportunityData> opportunityDataList = new List<OpportunityData>();
        Map<Id, OpportunityData> ownerToDataMap = new Map<Id, OpportunityData>();

        for (Opportunity opp : [
                SELECT Owner.Name, OwnerId, StageName
                FROM Opportunity
                WHERE StageName = 'Closed Won'
        ]) {
            Id ownerId = opp.OwnerId;

            if (!ownerToDataMap.containsKey(ownerId)) {
                OpportunityData opportunityData = new OpportunityData();
                opportunityData.ownerName = opp.Owner.Name;
                ownerToDataMap.put(ownerId, opportunityData);
                opportunityDataList.add(opportunityData);
            }

            OpportunityData data = ownerToDataMap.get(ownerId);
            data.numOpportunities++;
            if (opp.StageName == 'Closed Won') {
                data.successRate++;
            }
        }

        for (OpportunityData data : opportunityDataList) {
            data.successRate = data.successRate / data.numOpportunities;
        }

        return opportunityDataList;
    }
}