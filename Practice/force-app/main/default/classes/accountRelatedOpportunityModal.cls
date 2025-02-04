public without sharing class  accountRelatedOpportunityModal {
    @AuraEnabled(cacheable=true)
    public static List<Account> accountRecordsToDisplay() {
        return [SELECT Id, Name,Industry, Phone FROM Account LIMIT 10];
    }
 
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesRecordsToDisplay(Id accountId) {
        return [SELECT Id, Name, StageName, Amount FROM Opportunity WHERE AccountId = :accountId];
    }
    @AuraEnabled
    public static void updateOpportunity(List<Opportunity> opportunities) {
       update opportunities;
    }
}