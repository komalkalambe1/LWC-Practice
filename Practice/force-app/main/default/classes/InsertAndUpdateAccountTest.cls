@IsTest
public class InsertAndUpdateAccountTest {

    @IsTest
    static void testInsertAccount() {
        // Prepare test data for insertion
        String accountName = 'Test Insert Account';
        String accountNumber = '1001';
        String billingStreet = '123 Test St';
        String billingCity = 'Test City';
        String billingState = 'Test State';
        String billingCountry = 'Test Country';
        String description = 'Test account for insert operation';

        // Execute the method
        Test.startTest();
        insertAndUpdateAccount.accountMethod(accountName, accountNumber, billingStreet, billingCity, billingState, billingCountry, description);
        Test.stopTest();

        // Validate insertion
        Account insertedAccount = [SELECT Name, AccountNumber, BillingStreet, BillingCity, BillingState, BillingCountry, Description
                                   FROM Account WHERE Name =: accountName];
       
        System.assertEquals(accountName, insertedAccount.Name, 'Account Name does not match');
        System.assertEquals(accountNumber, insertedAccount.AccountNumber, 'Account Number does not match');
        System.assertEquals(billingStreet, insertedAccount.BillingStreet, 'Billing Street does not match');
        System.assertEquals(billingCity, insertedAccount.BillingCity, 'Billing City does not match');
        System.assertEquals(billingState, insertedAccount.BillingState, 'Billing State does not match');
        System.assertEquals(billingCountry, insertedAccount.BillingCountry, 'Billing Country does not match');
        System.assertEquals(description, insertedAccount.Description, 'Description does not match');
    }

    @IsTest
    static void testUpdateAccount() {
        // Insert a test account for update
        Account testAccount = new Account(
            Name = 'Test Update Account',
            AccountNumber = '2002',
            BillingStreet = 'Old Street',
            BillingCity = 'Old City',
            BillingState = 'Old State',
            BillingCountry = 'Old Country',
            Description = 'Old Description'
        );
        insert testAccount;

        // Prepare updated data
        String updatedAccountName = 'Test Update Account'; // Same name to trigger update
        String updatedAccountNumber = '3003';
        String updatedStreet = '456 New St';
        String updatedCity = 'New City';
        String updatedState = 'New State';
        String updatedCountry = 'New Country';
        String updatedDescription = 'Updated account details';

        // Execute the method
        Test.startTest();
        insertAndUpdateAccount.accountMethod(updatedAccountName, updatedAccountNumber, updatedStreet, updatedCity, updatedState, updatedCountry, updatedDescription);
        Test.stopTest();

        // Validate update
        Account updatedAccount = [SELECT Name, AccountNumber, BillingStreet, BillingCity, BillingState, BillingCountry, Description
                                  FROM Account WHERE Name = :updatedAccountName];

        System.assertEquals(updatedAccountName, updatedAccount.Name, 'Account Name does not match after update');
        System.assertEquals(updatedAccountNumber, updatedAccount.AccountNumber, 'Account Number does not match after update');
        System.assertEquals(updatedStreet, updatedAccount.BillingStreet, 'Billing Street does not match after update');
        System.assertEquals(updatedCity, updatedAccount.BillingCity, 'Billing City does not match after update');
        System.assertEquals(updatedState, updatedAccount.BillingState, 'Billing State does not match after update');
        System.assertEquals(updatedCountry, updatedAccount.BillingCountry, 'Billing Country does not match after update');
        System.assertEquals(updatedDescription, updatedAccount.Description, 'Description does not match after update');
    }
}