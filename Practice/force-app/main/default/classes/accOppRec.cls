public class accOppRec {
   @AuraEnabled(cacheable=true)
    public static List<Opportunity> methodName(Id accId){
       
        if(accId == null){
            throw new AuraHandledException('Account id should not be null');
        }
        system.debug('account id' + accId);
 
        List<Opportunity> oppList = [select id, Name,StageName,CloseDate,Amount,AccountId from Opportunity where AccountId =: accId ORDER BY CloseDate DESC];
        System.debug('Fetched Opportunities: ' + oppList);
        return oppList;
    }
}