public class fetchOppDigital {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account ORDER BY Name LIMIT 50];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(Id accountId) {
        return [SELECT Id, Name, StageName, CloseDate, Amount FROM Opportunity 
                WHERE AccountId = :accountId ORDER BY CloseDate DESC];
    }

    @AuraEnabled
    public static void updateOpportunityStage(Id opportunityId, String newStage) {
        try {
            Opportunity opp = [SELECT Id, StageName FROM Opportunity WHERE Id = :opportunityId LIMIT 1];
            if (opp != null) {
                opp.StageName = newStage;
                update opp;
            } else {
                throw new AuraHandledException('Opportunity not found.');
            }
        } catch (Exception e) {
            throw new AuraHandledException('Error updating Opportunity Stage: ' + e.getMessage());
        }
    }
}