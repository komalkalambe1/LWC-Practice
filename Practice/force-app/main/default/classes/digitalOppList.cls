public class digitalOppList {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> opportunityRecords(Id accountId) {
        return [SELECT Id, Name, StageName, CloseDate FROM Opportunity 
                WHERE AccountId = :accountId ORDER BY CloseDate DESC];
    }
}