trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account obj:Trigger.New){
        if(obj.Match_Billing_Address__c == true){
            obj.ShippingPostalCode = obj.BillingPostalCode;
        }
    }
}