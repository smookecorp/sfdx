public class TriggerHelper {
    private static Boolean OVERRIDE_TRIGGERHELPER = false;
    private static Boolean OVERRIDE_TRIGGERHELPER_VALUE = true;
    public static Map<String,Boolean> CachedTriggerSettings {get;set;} //Used to turn on/off functionality temporarily
    private static void InitializeCache(){
        if(CachedTriggerSettings == null){
            CachedTriggerSettings = new Map<String,Boolean>();
            Map<String,CS_Trigger_Settings__c> trigSettings = CS_Trigger_Settings__c.getall();
            for(CS_Trigger_Settings__c field : trigSettings.values()){
                CachedTriggerSettings.put(field.Name,field.Enabled__c);
            }
        }
    }
    
    public static Boolean DoExecute(String key){
        if(OVERRIDE_TRIGGERHELPER){return OVERRIDE_TRIGGERHELPER_VALUE;}
        InitializeCache();
        if(CachedTriggerSettings.containsKey(key)){
            return CachedTriggerSettings.get(key);
        }else{
            CS_Trigger_Settings__c newCS = new CS_Trigger_Settings__c(Name = key, Enabled__c = true, Log_Exceptions__c = true);
            insert newCS;
            CachedTriggerSettings.put(key,true);
            return true;
        }
    }
    
    public static void TemporaryOverride(String key, Boolean value){
        InitializeCache();
        CachedTriggerSettings.put(key,value);
    }
    
    public static void OverrideAllSettings(Boolean pTurnOverrideOn, Boolean pValueToOverideWith){
        OVERRIDE_TRIGGERHELPER = pTurnOverrideOn;
        OVERRIDE_TRIGGERHELPER_VALUE = pValueToOverideWith;
    }
}