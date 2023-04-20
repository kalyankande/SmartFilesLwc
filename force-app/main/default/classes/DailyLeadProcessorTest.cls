@isTest
private class DailyLeadProcessorTest{
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead(FirstName = 'Chetan' + i, LastName = 'Bhagat', Company = 'The Inc');
            leads.add(l);
        }
        insert leads;
        
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP,new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> checkLeads = new List<Lead>();
        checkLeads = [SELECT Id FROM Lead WHERE LeadSource='Dreamforce' AND Company='The Inc'];
        System.assertEquals(200,checkLeads.size(),'Leads were not created');
    }
}