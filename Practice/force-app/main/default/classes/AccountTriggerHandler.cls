public with sharing class AccountTriggerHandler {
    public static void handleNameChange(List<Account> newAccounts, List<Account> oldAccounts) {
        List<Account> accountsToUpdate = new List<Account>();
        for(Account acc:newAccounts) {
            if(acc.Name != oldAccounts[0].Name) {
                acc.Name_Changed__c = true;
                accountsToUpdate.add(acc);
            }
           
        }
        update accountsToUpdate;
    
        // List<Account> accountsToUpdate = new List<Account>();

        // for (Integer i = 0; i < newAccounts.size(); i++) {
        //     Account newAcc = newAccounts[i];
        //     Account oldAcc = oldAccounts[i];
            
        //     // Check if the Name field has been changed
        //     if (newAcc.Name != oldAcc.Name) {
        //         newAcc.Name_Changed__c = true;
        //         accountsToUpdate.add(newAcc);
        //     }
        // }

        // if (!accountsToUpdate.isEmpty()) {
        //     update accountsToUpdate;
        // }
    }
}