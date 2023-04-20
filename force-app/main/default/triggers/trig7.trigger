trigger trig7 on Opportunity (before insert) {
        List<Id> li=new List<Id>();
    for(Opportunity op:trigger.old)
    {
        li.add(op.Id);
    }
    List<Competitor__c> com=[select Id from Competitor__c where Opportunity__c
                            IN: li];
    delete com;
}