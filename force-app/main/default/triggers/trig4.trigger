trigger trig4 on Merchandise__c (after insert) {
	list<id> caseIds = new list<id>();
    for(Merchandise__c c:trigger.new){
        if(c.Quantity__c==20)
        {
            caseIds.add(c.id);
        }   
    }
    list<Line_Item__c> li= [select id,Unit_Price__c from Line_Item__c
                           where Merchandise__r.id IN :caseIds ];
    for(Line_Item__c l:li)
    {
        if(l.Unit_Price__c!=NULL)
            {
                l.Unit_Price__c= 2*l.Unit_Price__c;
            }
     }
    update li;
}