public without sharing class AdminOperations {
    public List<Account> getAllAccounts() {
        return [SELECT Id, Name FROM Account]; // Ignores sharing rules
    }
}