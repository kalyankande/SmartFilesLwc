@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> list1 = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            list1.add(new Lead(LastName='Lead '+i, Company='ABSYZ'));
        }
        insert list1;
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor obj = new LeadProcessor();
		Id batchId = Database.executeBatch(obj);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}