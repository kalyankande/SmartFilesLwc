trigger OpportunityTrigger on Opportunity (after insert) {
    
    incentiveHandler.createIncentiveRecord(Trigger.new);
    

}