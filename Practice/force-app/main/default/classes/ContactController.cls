public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<RecordType> getContactRecordTypes() {
        return [SELECT Id, Name FROM RecordType WHERE SObjectType = 'Contact' AND IsActive = true];
    }
}