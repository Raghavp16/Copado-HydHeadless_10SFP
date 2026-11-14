@IsTest
private class AccountOrgSegmentServiceTest {
    @IsTest
    static void testCalculateSegmentBoundaries() {
        System.assertEquals('Enterprise', AccountOrgSegmentService.calculateSegment(100000000));
        System.assertEquals('Mid Cap', AccountOrgSegmentService.calculateSegment(99999999));
        System.assertEquals('Mid Cap', AccountOrgSegmentService.calculateSegment(1000000));
        System.assertEquals('Startup', AccountOrgSegmentService.calculateSegment(999999));
        System.assertEquals('Startup', AccountOrgSegmentService.calculateSegment(null));
    }

    @IsTest
    static void testClassifyAccountsSetsOrgSegment() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Alpha', AnnualRevenue = 100000000),
            new Account(Name = 'Beta', AnnualRevenue = 99999999),
            new Account(Name = 'Gamma', AnnualRevenue = 999999)
        };

        Test.startTest();
        List<Account> classifiedAccounts = AccountOrgSegmentService.classifyAccounts(accounts);
        Test.stopTest();

        System.assertEquals(3, classifiedAccounts.size());
        System.assertEquals('Enterprise', classifiedAccounts[0].Org_Segment__c);
        System.assertEquals('Mid Cap', classifiedAccounts[1].Org_Segment__c);
        System.assertEquals('Startup', classifiedAccounts[2].Org_Segment__c);
    }
}
