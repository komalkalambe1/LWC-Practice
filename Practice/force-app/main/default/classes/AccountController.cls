public with sharing class AccountController {
    public List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account]; // Respects sharing rules
    }
    
    
}