public class vf1class{
public String accountId {get; set;}
        public vf1class(apexPages.standardcontroller controller){
             accountId= ApexPages.currentPage().getParameters().get('Id');
             system.debug('accountId+'+accountId);
}
         public void callmethod()
         {
          system.debug('call method was called');
          for( contact ct :[select id from contact where accountid=: accountId])
          {
                 system.debug('ct+'+ct);
                 delete ct;
          }
}
   }