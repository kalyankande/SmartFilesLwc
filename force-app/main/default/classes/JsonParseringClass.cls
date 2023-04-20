public class JsonParseringClass {
    @AuraEnabled
    public static void getJSONData(list<object> input)
    {
        system.debug(input);
        for(object obj:input){
            
            system.debug('11'+obj);
            
        }
       // list<Account> aa= new list<Account>();
       // aa=(account)input;
        //insert input;
        
         

         	
    }

}