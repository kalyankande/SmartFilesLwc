public with sharing class AccountHandler {
	
	public static Account insertNewAccount(String accName){
	
		try{
			Account a = new Account(Name=accName);
			
				insert a;
				return a;
			
			}catch (exception e){
				return null;
			}
			
	}

}