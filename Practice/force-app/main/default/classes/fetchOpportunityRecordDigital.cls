public class fetchOpportunityRecordDigital {
    @AuraEnabled
    public static List<Opportunity> opportunityRecords() {
        List<Opportunity> oppList = [SELECT Id, Name, StageName, CloseDate, Amount, AccountId 
                                     FROM Opportunity ORDER BY CloseDate DESC];
        return oppList;
    }

    @AuraEnabled
    public static void updateOpportunity(List<Opportunity> opportunities) {
        try {
            update opportunities;
        } catch (DmlException e) {
            throw new AuraHandledException('Error updating opportunities: ' + e.getMessage());
        }
    }
}