/**
*Author:       ssmooke
*Company:      Smooke Corp
*Description:  Custom exception handling class for custom written code 
*History
*<Date>        <Authors Name>     <Brief Description of Change>
* 4/6/2020         ssmooke           Initial version created.    
**/
public without sharing class ExceptionHandlingUtility {

    public static void logDMLException(DMLException dmlEx, System.LoggingLevel level, String csName){
        List<Exception_Log__c> exceptionLogs = new List<Exception_Log__c>();
        if(dmlEx != null && logExceptionFromCustomSetting(csName)){
            exceptionLogs.add(buildExceptionLog(dmlEx, null, level));
            if(!exceptionLogs.isEmpty()){
                insertExceptionLogs(exceptionLogs);
            }        
        }
    }

    public static void logHandledException(Exception ex, System.LoggingLevel level, String csName){
        List<Exception_Log__c> exceptionLogs = new List<Exception_Log__c>();
        if(ex != null && logExceptionFromCustomSetting(csName)){
            exceptionLogs.add(buildExceptionLog(null, ex, level));
            
            if(!exceptionLogs.isEmpty()){
                insertExceptionLogs(exceptionLogs);
            }
        }
    }

    public static void logUnhandledException(Messaging.InboundEmail email){
            //TODO
    }

    public static Exception_Log__c buildExceptionLog(DMLException dmlEx, Exception ex, System.LoggingLevel level){
        Exception_Log__c log = new Exception_Log__c();
        String stackTrace = '';
        String exMessage = '';
        Integer startPoint = -1;

        log.OwnerId = System.Label.Error_Handling_Admin;
        if(dmlEx != null){
            log.Record_Id__c = dmlEx.getDMLId(0);
            exMessage = dmlEx.getMessage();
            if(exMessage != null){
                startPoint = exMessage.indexOf('first error:') + ('first error:').length();
            }
            stackTrace = dmlEx.getStackTraceString();
            log.Stack_Trace__c = stackTrace;
            log.Exception_Type__c = String.valueOf(dmlEx.getDmlType(0));
            log.Line_Number__c = dmlEx.getLineNumber();
        }else if(ex != null){
            log.Record_Id__c = '';
            exMessage = ex.getMessage();
            if(exMessage != null){
                startPoint = exMessage.indexOf('first error:') + ('first error:').length();
                log.Stack_Trace__c = exMessage;
            }
            stackTrace = ex.getStackTraceString();
            log.Exception_Type__c = ex.getTypeName();
            log.Line_Number__c = ex.getLineNumber();
        }else{
            log.Exception_Type__c = 'Unhandled Exception';
        }
        if(startPoint > -1){
            String exceptionCode = exMessage.substring(startPoint).trim();
            if(String.isNotBlank(exceptionCode)){
                exceptionCode = (exceptionCode.split(' '))[0];
                log.Exception_Code__c = exceptionCode.left(exceptionCode.length()-1);
            }
        }
        if(stackTrace != null){
            if(stackTrace.indexOf('Trigger.') > -1){
                String triggerException = stackTrace.substring(stackTrace.indexOf('Trigger.') + 8,stackTrace.length());
                log.Apex_Trigger__c = triggerException.substring(0,triggerException.indexOf(':'));
            }
            if(stackTrace.indexOf('Class.') > -1){
                String classException = stackTrace.substring(stackTrace.indexOf('Class.') + 6,stackTrace.indexOf('column'));
                log.Class_Name__c = classException.substring(0,classException.indexOf('.'));
                log.Method_Name__c = classException.substring(classException.indexOf(log.Class_Name__c) + log.Class_Name__c.length() + 1,classException.indexOf(':'));
            }
        }
        log.Severity__c = level.name();
        
        return log;
    }

    public static Boolean logExceptionFromCustomSetting(String csName){
        Boolean logException = false;
        Map<String,CS_Trigger_Settings__c> trigSettings = CS_Trigger_Settings__c.getall();
        if(!trigSettings.isEmpty() && String.isNotBlank(csName) && trigSettings.containsKey(csName)){
            logException = trigSettings.get(csName).Log_Exceptions__c;
        }
        return logException;
    }

    public static void insertExceptionLogs(List<Exception_Log__c> exceptionLogs){
        if(!exceptionLogs.isEmpty()){
            Database.insert(exceptionLogs);
        }
    }
}