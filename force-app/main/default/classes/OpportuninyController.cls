public class OpportuninyController {
	@AuraEnabled(cacheable=true)
    public static List<OpportunityOwnerWrapper> OpportunityOwnerPerformance() {
        List<OpportunityOwnerWrapper> ownerCount = new List<OpportunityOwnerWrapper>();
        Map<Id, OpportunityOwnerWrapper> mapOfOwners = new Map<Id, OpportunityOwnerWrapper>();
        List<Opportunity> opportunities = [SELECT Id, OwnerId, Owner.Name, StageName FROM Opportunity] ; 
        for (Opportunity opp : opportunities) {
            Id ownerId = opp.OwnerId;
            String ownerName = opp.Owner.Name;
            Boolean isClosedWon = opp.StageName == 'Closed Won';
            OpportunityOwnerWrapper ownerWrapper = mapOfOwners.get(ownerId);
            if (ownerWrapper == null) {
                ownerWrapper = new OpportunityOwnerWrapper(opp.Owner, 0, 0, 0);
                mapOfOwners.put(ownerId, ownerWrapper);
            }
            ownerWrapper.OpportunityCount += 1;
            if (isClosedWon) {
                ownerWrapper.ClosedWonCount += 1;
            }
            ownerWrapper.SuccessRate = (ownerWrapper.OpportunityCount > 0) ? (Decimal.valueOf(ownerWrapper.ClosedWonCount) / Decimal.valueOf(ownerWrapper.OpportunityCount)) : 0;
        }
        ownerCount.addAll(mapOfOwners.values());
        return ownerCount;
    }
    public class OpportunityOwnerWrapper {
        @AuraEnabled public User Owner;
        @AuraEnabled public String OwnerName;
        @AuraEnabled public Integer OpportunityCount;
        @AuraEnabled public Integer ClosedWonCount;
        @AuraEnabled public Decimal SuccessRate;
        public OpportunityOwnerWrapper(User owner,Integer opportunityCount,Integer closedWonCount,Decimal successRate){
            this.Owner = owner;
            this.OwnerName = owner.Name;
            this.OpportunityCount = opportunityCount;
            this.ClosedWonCount = closedWonCount;
            this.SuccessRate = successRate;
        }
    }
}