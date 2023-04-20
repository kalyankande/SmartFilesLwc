trigger trig5 on Merchandise__c (after insert,after update){
    list<id> i = new list<id>();
    for(Merchandise__c c:trigger.new){
        if(c.Name!=NULL)
        {
            i.add(c.id);
        }   
    }
    list<Line_Item__c> li= [select id from Line_Item__c
                           where Merchandise__r.id IN :i];
    for(Line_Item__c l:li)
    {
        if(l.Name!=NULL)
            {
                l.Merchandise__r.Count__c= l.Merchandise__r.Count__c + 1;
            }
     }
    update li;
}