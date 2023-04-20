public class exam1 {
    public void calculate(list<booking__c> inputRecord,map<id,booking__c> oldmap){
        double distanceInKms=0;
        for(booking__c bookingObj:inputRecord){
            Location loc1=bookingObj.StartLocation__c;
            Location loc2=bookingObj.EndLocation__c;
         	  system.debug('loc1:'+loc1);
            system.debug('loc2:'+loc2);
            distanceInKms=Location.getDistance(loc1,loc2,'km');
            
        }
    }
}