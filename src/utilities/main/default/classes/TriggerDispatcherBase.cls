public virtual class TriggerDispatcherBase implements ITriggerDispatcher {
 
    private static ITriggerHandler beforeInserthandler;
    private static ITriggerHandler beforeUpdatehandler;
    private static ITriggerHandler beforeDeleteHandler;
    private static ITriggerHandler afterInserthandler;
    private static ITriggerHandler afterUpdatehandler;
    private static ITriggerHandler afterDeleteHandler;
    private static ITriggerHandler afterUndeleteHandler;

    public virtual void bulkBefore() {}
    public virtual void bulkAfter() {}
    public virtual void beforeInsert(TriggerParameters tp) {}
    public virtual void beforeUpdate(TriggerParameters tp) {}
    public virtual void beforeDelete(TriggerParameters tp) {}
    public virtual void afterInsert(TriggerParameters tp) {}
    public virtual void afterUpdate(TriggerParameters tp) {}
    public virtual void afterDelete(TriggerParameters tp) {}
    public virtual void afterUnDelete(TriggerParameters tp) {}

    public virtual void andFinally() {}

    protected void execute(ITriggerHandler handlerInstance, TriggerParameters tp, TriggerParameters.TriggerEvent tEvent) {
        if(handlerInstance != null) {
            if(tEvent == TriggerParameters.TriggerEvent.beforeInsert)
                beforeInsertHandler = handlerInstance;
            if(tEvent == TriggerParameters.TriggerEvent.beforeUpdate)
                beforeUpdateHandler = handlerInstance;
            if(tEvent == TriggerParameters.TriggerEvent.beforeDelete)
                beforeDeleteHandler = handlerInstance;
            if(tEvent == TriggerParameters.TriggerEvent.afterInsert)
                afterInsertHandler = handlerInstance;
            if(tEvent == TriggerParameters.TriggerEvent.afterUpdate)
                afterUpdateHandler = handlerInstance;
            if(tEvent == TriggerParameters.TriggerEvent.afterDelete)
                afterDeleteHandler = handlerInstance;
            if(tEvent == TriggerParameters.TriggerEvent.afterUnDelete)
            afterUndeleteHandler = handlerInstance;
            handlerInstance.mainEntry(tp);
            handlerInstance.updateObjects();
        }else {
            if(tEvent == TriggerParameters.TriggerEvent.beforeInsert)
                beforeInsertHandler.inProgressEntry(tp);
            if(tEvent == TriggerParameters.TriggerEvent.beforeUpdate)
                beforeUpdateHandler.inProgressEntry(tp);
            if(tEvent == TriggerParameters.TriggerEvent.beforeDelete)
                beforeDeleteHandler.inProgressEntry(tp);
            if(tEvent == TriggerParameters.TriggerEvent.afterInsert)
                afterInsertHandler.inProgressEntry(tp);
            if(tEvent == TriggerParameters.TriggerEvent.afterUpdate)
                afterUpdateHandler.inProgressEntry(tp);
            if(tEvent == TriggerParameters.TriggerEvent.afterDelete)
                afterDeleteHandler.inProgressEntry(tp);
            if(tEvent == TriggerParameters.TriggerEvent.afterUnDelete)
                afterUndeleteHandler.inProgressEntry(tp);
        }
    }
}