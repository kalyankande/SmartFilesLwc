trigger incentiveTrigger on Incentive__c (after update) {
    if(trigger.isAfter && trigger.isUpdate){     
                incentiveHandler.CreatePayoutrecords(trigger.new);   
    }
}