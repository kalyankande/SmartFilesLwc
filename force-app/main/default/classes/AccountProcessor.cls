public class AccountProcessor {
    @future  
    public static void countContacts(List<Id> Ids) {
        List<Account> list1 = new List<Account>();
        List<Account> list2 = [SELECT Id, Name, (SELECT Id FROM Contacts) from Account Where Id IN :Ids];
        for(Account acc:list2){
            List<Contact> con = acc.Contacts;
            acc.Number_Of_Contacts__c = con.size();
            list1.add(acc);
        }
        update list1;
  }
}