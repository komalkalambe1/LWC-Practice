//****************************************************************************************************
// @Name  of the Lwc   : AccountTriggerHandler.cls
// @Description        : Test class used for to test auto-updates a custom field when an Account’s name is changed
//                         
//                         
// @Author             : Komal
// @Created Date       : 04/02/2025
// ********************************************************************************************** 
//

@IsTest
private class accountTriggerTest {

    @IsTest
    static void testSingleAccountUpdate() {
        // Create a test Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Update Account Name
        acc.Name = 'Updated Account';
        update acc;

        // Retrieve the updated record
        Account updatedAcc = [SELECT Name_Changed__c FROM Account WHERE Id = :acc.Id];
        
        // Validate that Name_Changed__c is set to true
        System.assertEquals(true, updatedAcc.Name_Changed__c, 'Name_Changed__c should be true');
    }

    @IsTest
    static void testBulkAccountUpdate() {
        List<Account> accounts = new List<Account>();
        
        // Create multiple test Accounts
        for (Integer i = 0; i < 5; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert accounts;

        // Update all Account Names
        for (Account acc : accounts) {
            acc.Name = acc.Name + ' Updated';
        }
        update accounts;

        // Retrieve updated records
        List<Account> updatedAccounts = [SELECT Name_Changed__c FROM Account WHERE Id IN :accounts];
        
        // Validate all accounts have Name_Changed__c = true
        for (Account acc : updatedAccounts) {
            System.assertEquals(true, acc.Name_Changed__c, 'Name_Changed__c should be true for all records');
        }
    }
}
