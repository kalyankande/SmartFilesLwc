public class UpdatedAccount {
    @AuraEnabled
    public static List<Account> getLastUpdatedAccounts(){
        return [SELECT Id, Name, Phone, AnnualRevenue, Website FROM Account WHERE SystemModStamp>=LAST_N_DAYS:10 LIMIT 10];
    }
}