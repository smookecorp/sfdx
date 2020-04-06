public abstract class TriggerHandlerBase implements ITriggerHandler {
    protected Map<Id, SObject> sObjectsToUpdate = new Map<Id, SObject>();
    public abstract void mainEntry(TriggerParameters tp);

    public virtual void inProgressEntry(TriggerParameters tp) {

    }

    public virtual void updateObjects() {
        if(sObjectsToUpdate.size() > 0)
        update sObjectsToUpdate.values();
    }
}