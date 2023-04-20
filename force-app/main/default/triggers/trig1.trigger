trigger trig1 on Account ( before update, before insert) {
    list<Account> nn =[select id,Name from account];
    set<Account> newname = new set<Account>();
    List<String> new1 = new List<String>();
    for(Account acc:trigger.new){
        //list<Account> ac = [select id,name from account where Name=:acc.Name];
        
        //if(ac.size()>0){
            //acc.adderror('Name is already taken, Please try different name');
           //}
        //else {
          //  acc.Name = 'MR.'+ acc.Name;
        //}
        list<Contact> con1= [select id, name,account.name from Contact where account.name =:acc.Name];
        delete con1;
        
		}
 
	}