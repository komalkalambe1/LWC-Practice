public class digitalAccountOppFetch {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account ORDER BY Name LIMIT 50];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(Id accountId) {
        return [SELECT Id, Name, StageName, CloseDate, Amount FROM Opportunity 
                WHERE AccountId = :accountId ORDER BY CloseDate DESC];
    }
}