trigger testtt on Contact (after insert,after update) {
    set<id> list1 = new set<id>();
    list<Account> acclist =new list<Account>();
    
    for(Contact con: Trigger.new){
        list1.add(con.AccountId);
    }
    for(Account acc:[select id,Phone,(select id,Phone from contacts) from Account Where id IN : list1 ]){
        acc.Phone=acc.contacts[0].Phone;
        acclist.add(acc);        
    }
    update acclist;
   
 
}