public with sharing class AccountOrgSegmentService {
    public static final String STARTUP = 'Startup';
    public static final String MID_CAP = 'Mid Cap';
    public static final String ENTERPRISE = 'Enterprise';

    public static String calculateSegment(Decimal annualRevenue) {
        if (annualRevenue == null || annualRevenue < 1000000) {
            return STARTUP;
        }

        if (annualRevenue >= 100000000) {
            return ENTERPRISE;
        }

        return MID_CAP;
    }

    public static List<Account> classifyAccounts(List<Account> accounts) {
        if (accounts == null) {
            return new List<Account>();
        }

        for (Account accountRecord : accounts) {
            if (accountRecord != null) {
                accountRecord.Org_Segment__c = calculateSegment(accountRecord.AnnualRevenue);
            }
        }

        return accounts;
    }
}
