/**
*Author:        author
*Company:       company
*Description:   Helper class corresponding to the Object__c Custom Object. All business logic to be added in Helper class. Methods to be separated out by trigger entry criteria.
*History
*<Date>        <Authors Name>     <Brief Description of Change>
* 2/14/2020     ssmooke            Initial version created.    
**/
public with sharing class ObjectHelperTemplate {

    public static void methodName(List<sObject> newList, Map<Id,sObject> oldMap){
        if(TriggerHelper.DoExecute('[SObject API Name].[methodName]')){
            //add business logic within the if statement

            TriggerHelper.TemporaryOverride('[SObject API Name].[methodName]', false);
        }
    }
}