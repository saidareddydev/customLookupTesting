public with sharing class ContactsWithPhoto {
    @AuraEnabled(cacheable=true)
    
    public static List<Contact> conList() {
        return [SELECT Id,Name,FirstName,LastName,Email,Title,phone,photoUrl FROM Contact WHERE photoUrl != NULL WITH USER_MODE LIMIT 10];

    }
}