//****************************************************************************************************
// @Name  of the Lwc   : AccountTriggerHandler.cls
// @Description        : class used for to auto-updates a custom field when an Account’s name is changed
//                         
//                         
// @Author             : Komal
// @Created Date       : 04/02/2025
// ********************************************************************************************** 
//

public with sharing class AccountTriggerHandler {
    public static void handleAccountNameChange(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
        List<Account> accountsToUpdate = new List<Account>();

        for (Account acc : newAccounts) {
            Account oldAcc = oldAccountMap.get(acc.Id);
            if (oldAcc != null && acc.Name != oldAcc.Name) {
                acc.Name_Changed__c = true; // Mark the custom field as true
                accountsToUpdate.add(acc);
            }
        }

        // No DML needed, since we are modifying Trigger.new records
    }
}