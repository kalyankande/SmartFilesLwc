public class FetchContacts {
    @AuraEnabled
	public static List<Contact> getContacts(){
        List<Contact> conList =[Select Id,FirstName,LastName,Email,Phone from Contact ];
        return conList;
    }
}