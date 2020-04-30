/**
*Author:        author
*Company:       company
*Description:   Utility class to house commonly used utility methods across all objects and custom components
*History
*<Date>        <Authors Name>     <Brief Description of Change>
* 2/14/2020     author            Initial version created.    
**/
public with sharing class UtilityClass {
    
    public static String getSObjectTypeName(SObject so) {
        return so.getSObjectType().getDescribe().getName();
    }
    
    public static Map<Id, sObject> cloneObjectsMap(List<sObject> sObjects, Schema.SObjectType objectType){
        List<Id> sObjectIds = new List<Id>{};
        List<String> sObjectFields = new List<String>{};
        Map<Id, sObject> clonedSObjects = new Map<Id, sObject>{};
                    
        if(objectType != null){
            sObjectFields.addAll(objectType.getDescribe().fields.getMap().keySet());
        }
        if (sObjects != null && !sObjects.isEmpty() && !sObjectFields.isEmpty()){
            for (sObject objectInstance: sObjects){
                sObjectIds.add(objectInstance.Id);
            }
            String allSObjectFieldsQuery = 'SELECT ' + sObjectFields.get(0);
            for (Integer i=1 ; i < sObjectFields.size() ; i++){
                allSObjectFieldsQuery += ', ' + sObjectFields.get(i);
            }
            allSObjectFieldsQuery += ' FROM ' +
                objectType.getDescribe().getName() +
                ' WHERE ID IN (\'' + sObjectIds.get(0) +
                '\'';
            
            for (Integer i=1 ; i < sObjectIds.size() ; i++){
                allSObjectFieldsQuery += ', \'' + sObjectIds.get(i) + '\'';
            }
            allSObjectFieldsQuery += ')';
            try{
                for (SObject sObjectFromDatabase : Database.query(allSObjectFieldsQuery)){
                    clonedSObjects.put(sObjectFromDatabase.Id, sObjectFromDatabase.clone(false,true));
                }
            }
            catch (Exception ex){
                throw ex;
            }
        }
        return clonedSObjects;
    }
    
    public static List<String> getPickListValues(String sObjectName, String fieldAPIName){
        List<String> sObjectFieldsList = new List<String>();
        SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap();        
        Set<String> fieldSet = fields.keySet();
        List<String> picklistValues = new List<String>();
        try{   
            for(String s : fieldSet){
                SObjectField fieldToken = fields.get(s);
                DescribeFieldResult selectedField = fieldToken.getDescribe();
                if(selectedField.getName() == fieldAPIName && (selectedField.getType().name() == 'PICKLIST' || selectedField.getType().name() == 'MULTIPICKLIST')){    
                    for(Schema.PicklistEntry pickListEntry : selectedField.getPicklistValues()){
                        picklistValues.add(pickListEntry.getLabel());
                    }
                    break;
                }           
            }  
            return picklistValues;
        }catch(Exception ex){
          picklistValues.clear();
          return picklistValues;           
        }
    }
    
    public static String getAllFields(String sObjectName){
        if(String.isNotBlank(sObjectName)){
            List<String> allFields = new List<String>();
            Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(sObjectName).getDescribe().fields.getMap();
            for(String fieldName : fieldMap.keyset()){
                if(fieldMap.get(fieldName).getDescribe().isAccessible()){
                    if(fieldName == 'recordtypeid'){
                        allFields.add('RecordType.Name');
                    }
                    allFields.add(fieldName);
                }
            }
            return String.join(allFields,',');
        }
        return null;
    }

    public static List<Schema.FieldSetMember> getFieldSet(String fieldSetName, String sObjectName){
        if(Schema.getGlobalDescribe().get(sObjectName).getDescribe().FieldSets.getMap().containsKey(fieldSetName)){
            return Schema.getGlobalDescribe().get(sObjectName).getDescribe().FieldSets.getMap().get(fieldSetName).getFields();
        }else{
            return null;
        }
    } 

    @AuraEnabled
    public static List<sObject> getSearchRecords(String sObjectName, String searchString){
        List<sObject> records = new List<sObject>();
        if(String.isNotBlank(sObjectName)){
            if(String.isNotBlank(searchString)){
                records = Database.query('select Id,Name from ' + sObjectName + ' where Name LIKE \'%' + searchString + '%\' limit 5');
            }
        }
        return records;
    }

    @AuraEnabled(cacheable=true)
    public static List<sObject> getLookupResults(String searchTerm, String objectName, String filters, String recordId, String fields) {
        Integer limitNum = 20;
        String finalQuery = 'SELECT ' + fields + ' FROM ' + objectName;
        if(String.isBlank(recordId)){
            if(String.isNotBlank(searchTerm)){
                finalQuery += ' WHERE Name Like  \'%' + searchTerm + '%\' ';
            }
            if(String.isNotBlank(filters)){
                finalQuery += String.isNotBlank(searchTerm) ? ' AND ' : ' WHERE ';
                finalQuery += filters;
            }
        }else{
            finalQuery += ' WHERE Id =  \'' + recordId + '\'';
        }
        finalQuery+= ' LIMIT ' + limitNum;
        List<sObject> lookUpList = database.query(finalQuery);
        return lookUpList;  
    }
}