trigger firsttrigger on first__c (before insert,before update) {
    List<second__c> ju = new List<second__c>();
     for(first__c ca:trigger.new){
         if (ca.Weather__c != null &&
		(ca.Weather__c == 'Hot')){
            ca.Mobile_Number__c = 96385285;
     }
	}
}