trigger testing on Opportunity (after insert, after update ) {
    set<id> oppIds = new set<Id>();
    set<id> list2 = new set<id>();
    
    
    
    if((Trigger.isupdate || trigger.isinsert) && trigger.isafter ){
        for(Opportunity opp:Trigger.new){
            if(opp.StageName=='Closed Won'){
            oppIds.add(opp.ContactId);
                list2.add(opp.id);
            }
        } 
        list<Opportunity> Opplst=[select id, name from Opportunity where ContactId in:oppIds AND id not in:list2];
        list<Opportunity> oppUpdate = new list<Opportunity>();
        for(Opportunity lst:Opplst){
            lst.StageName='Closed Lost';
            oppUpdate.add(lst);
            
        }
        update oppUpdate;
        
        
        
    }
    
 
    
    

}