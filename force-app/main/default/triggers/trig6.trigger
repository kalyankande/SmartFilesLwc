trigger trig6 on Contact (before insert,before update) {
    set<id> getid=new set<id>();
    string contactIds;
    List<Contact> con=new List<Contact>();
     
    if(Trigger.isInsert || Trigger.isupdate)
    {
        for(Contact cont:Trigger.new){
            if(cont.Primary_Contact__c==true){
                getid.add(cont.AccountId);
                ContactIds=cont.Id;
            }
        }
    }
    
    List<Contact> clist=[select id,Primary_Contact__c from contact where
                        AccountId IN: getid AND Primary_Contact__c=true];
    
    if(clist.size()>0){
        for(Contact n:clist){
            if(n.id !=contactIds){
                n.Primary_Contact__c=false;
                con.add(n);
            }
        }
    }
    update con;
}