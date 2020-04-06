/**
*Author:        author
*Company:       company
*Description:   Dispatcher class corresponding to the Object__c Custom Object. State methods to be commented and uncommented as needed.
*History
*<Date>        <Authors Name>     <Brief Description of Change>
*2/14/2020       author            Initial version created.    
**/
public class ObjectDispatcherTemplate extends TriggerDispatcherBase {
    private static Boolean isBeforeInsertProcessing = false;
    private static Boolean isBeforeUpdateProcessing = false;
    private static Boolean isBeforeDeleteProcessing = false;
    private static Boolean isAfterInsertProcessing = false;
    private static Boolean isAfterUpdateProcessing = false;
    private static Boolean isAfterDeleteProcessing = false;
    private static Boolean isAfterUnDeleteProcessing = false;
 
    /*public virtual override void beforeInsert(TriggerParameters tp) {
        if(!isBeforeInsertProcessing) {
            isBeforeInsertProcessing = true;
        // execute(new [SOBJECT API NAME  (without __c)]BeforeInsert(), tp, TriggerParameters.TriggerEvent.beforeInsert);
            isBeforeInsertProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.beforeInsert);
    }*/
    
 
    /*public virtual override void beforeUpdate(TriggerParameters tp) {
        if(!isBeforeUpdateProcessing) {
            isBeforeUpdateProcessing = true;
            // execute(new [SOBJECT API NAME  (without __c)]BeforeUpdate(), tp, TriggerParameters.TriggerEvent.beforeUpdate);
            isBeforeUpdateProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.beforeUpdate);
    }*/
 
    /*public virtual override void beforeDelete(TriggerParameters tp) {
        if(!isBeforeDeleteProcessing) {
            isBeforeDeleteProcessing = true;
            //execute(new [SOBJECT API NAME  (without __c)]BeforeDelete(), tp, TriggerParameters.TriggerEvent.beforeDelete);
            isBeforeDeleteProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.beforeDelete);
    }*/

    /*public virtual override void afterInsert(TriggerParameters tp) {
        if(!isAfterInsertProcessing) {
            isAfterInsertProcessing = true;
            execute(new [SOBJECT API NAME (without __c)]AfterInsert(), tp, TriggerParameters.TriggerEvent.afterInsert);
            isAfterInsertProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.afterInsert);
    }*/

    /*public virtual override void afterUpdate(TriggerParameters tp) {
        if(!isAfterUpdateProcessing) {
            isAfterUpdateProcessing = true;
            execute(new [SOBJECT API NAME  (without __c)]AfterUpdate(), tp, TriggerParameters.TriggerEvent.afterUpdate);
            isAfterUpdateProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.afterUpdate);
    }*/
 
    /*public virtual override void afterDelete(TriggerParameters tp) {
        if(!isAfterDeleteProcessing) {
            isAfterDeleteProcessing = true;
            execute(new [SOBJECT API NAME  (without __c)]AfterDelete(), tp, TriggerParameters.TriggerEvent.afterDelete);
            isAfterDeleteProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.afterDelete);
    }*/
 
    /*public virtual override void afterUnDelete(TriggerParameters tp) {
        if(!isAfterUnDeleteProcessing) {
            isAfterUnDeleteProcessing = true;
            execute(new [SOBJECT API NAME  (without __c)]AfterUnDelete(), tp, TriggerParameters.TriggerEvent.afterUnDelete);
            isAfterUnDeleteProcessing = false;
        }
        else execute(null, tp, TriggerParameters.TriggerEvent.afterUnDelete);
    }*/
}