/**
*Author:        
*Company:       
*Description:   Testing triggers corresponding to the Object__c custom object
*History
*<Date>        <Authors Name>     <Brief Description of Change>
*2/14/2020        author           Initial version created.    
**/
@isTest
public with sharing class ObjectTestTemplate {

    static testMethod void happyPath() {
        //Test data to be created in TestData class within TestingUtility class
        //TestingUtility.TestData td = new TestingUtility.TestData();

        //add, modify, or delete test data to fire appropriate trigger
        //Test.startTest();
        //td.Account[0].Field__c = 'Changed Value';
        //Test.stopTest();
        
        //query for affected records
        //List<sObject> records = [SELECT Field__c FROM Object__c WHERE Id = :list];

        //assert that trigger fired and performed action successfully
        //System.assert(records[0].Field__c == 'Changed Value', 'Value not updated');
    }

    static testMethod void exceptions() {
        //Test data to be created in TestData class within TestingUtility class
        //TestingUtility.TestData td = new TestingUtility.TestData();

        //add, modify, or delete test data that does not meet trigger entry criteria
        //Test.startTest();
        //td.Account[0].Field__c = 'Changed Value';
        //Test.stopTest();
        
        //query for affected records
        //List<sObject> records = [SELECT Field__c FROM Object__c WHERE Id = :list];

        //assert that trigger did not fire and incorrectly update record
        //System.assert(records[0].Field__c != 'Changed Value', 'Value updated.');
    }

    static testMethod void runningUser() {
        //Test data to be created in TestData class within TestingUtility class
        //TestingUtility.TestData td = new TestingUtility.TestData();

        //Create User with appropriate Profile and Role to test permissions
        //Profile standardUser = [SELECT Id FROM Profile where name = 'Standard User'];
        //UserRole westSales = [SELECT Id FROM UserRole Where Name = 'West Sales'];
        /*User runningUser = new User(
            UserRoleId = westSales.Id,
            ProfileId = standardUser.Id,
            Username = 'randomusername99882211@randomusername.com',
            Alias = 'random',
            Email='randomemail99882211@randomemail.com',
            EmailEncodingKey='UTF-8',
            FirstName='Random',
            LastName='User',
            LanguageLocaleKey='en_US',
            LocaleSidKey='en_US',
            TimeZoneSidKey='America/Chicago');
        insert runningUser;*/
        
        //Running as newly created User
        //System.runAs(runningUser) {
            //Test.startTest();
            //add, modify, or delete test data to fire appropriate trigger
            //td.Account[0].Field__c = 'Changed Value';
            //Test.stopTest(); 
        //}
        
        //query for affected records
        //List<sObject> records = [SELECT Field__c FROM Object__c WHERE Id = :list];

        //assert that trigger did not fire and incorrectly update record
        //System.assert(records[0].Field__c != 'Changed Value', 'Value updated.');
    }
}