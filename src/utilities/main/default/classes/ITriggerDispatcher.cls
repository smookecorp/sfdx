/**
*Author:        ssmooke 
*Company:       Smooke Corp
*Description:   Trigger Factory Interface
*History
*<Date>        <Authors Name>     <Brief Description of Change>
* 4/6/2020      ssmooke             Initial version created.    
**/
public interface ITriggerDispatcher {
    void bulkBefore();
    void bulkAfter();
    void andFinally();
    void beforeInsert(TriggerParameters tp);
    void beforeUpdate(TriggerParameters tp);
    void beforeDelete(TriggerParameters tp);
    void afterInsert(TriggerParameters tp);
    void afterUpdate(TriggerParameters tp);
    void afterDelete(TriggerParameters tp);
    void afterUnDelete(TriggerParameters tp);
}