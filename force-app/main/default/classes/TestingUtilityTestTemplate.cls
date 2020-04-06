@isTest
private class TestingUtilityTestTemplate{

    @isTest
    static void when_objectIsCreated_expect_defaultFieldsArePopulated(){
        Account a = (Account)TestingUtility.createSObject(new Account());
        System.assertEquals('Test Account', a.Name, 'Expecting Default field value is set to specific value');
    }

    @isTest
    static void when_objectIsInserted_expect_defaultFieldsArePopulated(){
        Account a = (Account)TestingUtility.createSObject(new Account(),true);
        a = [SELECT Name FROM Account WHERE Id = :a.Id];
        System.assertEquals('Test Account', a.Name, 'Expecting Default field value is set to specific value');
    }

    @isTest
    static void when_objectIsCreatedWithSpecificDefaultsSet_expect_defaultFieldsArePopulated(){
        Account a = (Account)TestingUtility.createSObject(new Account(), 'TestFactoryDefaults.MyAccountDefaults');
        System.assertEquals('My Test Account', a.Name, 'Expecting Default field value is set to specific value');
    }

    @isTest
    static void when_objectIsInsertedWithSpecificDefaultsSet_expect_defaultFieldsArePopulated(){
        Account a = (Account)TestingUtility.createSObject(new Account(), 'TestFactoryDefaults.MyAccountDefaults', true);
        System.assertEquals('My Test Account', a.Name, 'Expecting Default field value is set to specific value');
    }

    @isTest
    static void when_ListOfObjectsIsCreated_expect_defaultFieldsArePopulated(){
        Account[] aList = (Account[])TestingUtility.createSObjectList(new Account(), 200);
        for(Account a : aList){
            System.assert(a.Name.startsWith('Test Account'), 'Expecting Default field value is set to specific value');
        }
    }

    @isTest
    static void when_ListOfObjectIsInserted_expect_defaultFieldsArePopulated(){
        Account[] aList = (Account[])TestingUtility.createSObjectList(new Account(), 200, true);
        aList = [SELECT Name FROM Account WHERE Id IN :aList ORDER BY Name];
        for(Account a : aList){
            System.assert(a.Name.startsWith('Test Account'), 'Expecting Default field value is set to specific value');
        }
    }

    @isTest
    static void when_ListOfObjectsIsCreatedWithSpecificDefaultsSet_expect_defaultFieldsArePopulated(){
        Account[] aList = (Account[])TestingUtility.createSObjectList(new Account(), 200, 'TestFactoryDefaults.MyAccountDefaults');
        for(Account a : aList){
            System.assert(a.Name.startsWith('My Test Account'), 'Expecting Default field value is set to specific value');
        }
    }

    @isTest
    static void when_ListOfObjectsIsInsertedWithSpecificDefaultsSet_expect_defaultFieldsArePopulated(){
        Account[] aList = (Account[])TestingUtility.createSObjectList(new Account(), 200, 'TestFactoryDefaults.MyAccountDefaults', true);
        aList = [SELECT Name FROM Account WHERE Id IN :aList ORDER BY Name];
        for(Account a : aList){
            System.assert(a.Name.startsWith('My Test Account'), 'Expecting Default field value is set to specific value');
        }
    }

}