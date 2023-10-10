public with sharing class CustomLookupController {
  @AuraEnabled(cacheable = true)
    public static List<sObject> searchRecords(string objApiName, string searchKey) {
       
        List<sObject> sObjectList = new List<sObject>();
        if(String.isNotBlank(searchKey)){
            string key = '%'+ searchKey +'%';
            string queryString = 'SELECT Id, Name FROM '+ objApiName + ' WHERE Name LIKE : key';
            sObjectList = Database.query(queryString, AccessLevel.USER_MODE);
        }
        return sObjectList;

    }
}