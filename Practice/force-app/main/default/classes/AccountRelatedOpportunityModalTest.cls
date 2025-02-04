@isTest
public class AccountRelatedOpportunityModalTest {
   
    @testSetup
    static void setupTestData() {
        // Create Account Test Data
           
        Account acc = new Account(
            Name = 'Test Account',
            Industry = 'Technology',
            Phone = '1234567890'
        );
    
        insert acc;

        // Create Opportunity Test Data
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            Amount = 5000,
            CloseDate = Date.today(),
            AccountId = acc.Id
        );
        insert opp;
    }

    @isTest
    static void testAccountRecordsToDisplay() {
        // Call the method
        Test.startTest();
        List<Account> accounts = accountRelatedOpportunityModal.accountRecordsToDisplay();
        Test.stopTest();

        // Assertions
        System.assertNotEquals(accounts.size(), 0, 'Accounts should be returned');
    }

    @isTest
    static void testGetOpportunitiesRecordsToDisplay() {
        // Fetch test Account Id
        Account acc = [SELECT Id FROM Account LIMIT 1];

        // Call the method
        Test.startTest();
        List<Opportunity> opportunities = accountRelatedOpportunityModal.getOpportunitiesRecordsToDisplay(acc.Id);
        Test.stopTest();

        // Assertions
        System.assertNotEquals(opportunities.size(), 0, 'Opportunities should be returned');
    }

    @isTest
    static void testUpdateOpportunity() {
        // Fetch test Opportunity
        Opportunity opp = [SELECT Id, Name FROM Opportunity LIMIT 1];
        opp.Name = 'Updated Test Opportunity';

        Test.startTest();
        accountRelatedOpportunityModal.updateOpportunity(new List<Opportunity>{opp});
        Test.stopTest();

        // Fetch updated Opportunity
        Opportunity updatedOpp = [SELECT Name FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(updatedOpp.Name, 'Updated Test Opportunity', 'Opportunity should be updated');
    }
}