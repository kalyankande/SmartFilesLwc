public class fetchBooking {
    @AuraEnabled
    public static List<Booking__c> getBike(Id hubId){
     return[SELECT Name, BookingTime__c, DistanceKMs__c, Bike__r.Name, Customer__r.Name, Customer__r.Status__c from Booking__c where Bike__r.Hub__c=:hubId];    
    }
}