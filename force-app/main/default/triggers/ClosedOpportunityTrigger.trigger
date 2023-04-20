trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> ju = new List<Task>();
    
    for(Opportunity ki : Trigger.New){
        if(ki.StageName == 'Closed Won'){
            ju.add(New Task(Subject = 'Follow Up Test Task',WhatId=ki.Id));
           
            
        }
            
    }
    if(ju.size()>0){
        
        insert ju;
    }

}