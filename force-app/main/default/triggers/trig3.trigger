trigger trig3 on Invoice__c (before delete) {
      
    	
        for(Invoice__c tsk : trigger.old){
            if( tsk.Status__c == 'Closed'){
            tsk.adderror('Task cannot be deleted');
        }
      }

}