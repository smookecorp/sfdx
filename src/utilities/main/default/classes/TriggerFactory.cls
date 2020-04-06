public with sharing class TriggerFactory{

        public static void createTriggerDispatcher(Schema.sObjectType soType) {
                ITriggerDispatcher dispatcher = getTriggerDispatcher(soType);
                if (dispatcher == null)
                        throw new TriggerException('No Trigger dispatcher registered for Object Type: ' + soType);
                execute(dispatcher);
    }
 
        private static void execute(ITriggerDispatcher dispatcher){
                TriggerParameters tp = new TriggerParameters(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap, Trigger.isBefore, Trigger.isAfter, Trigger.isDelete, Trigger.isInsert, Trigger.isUpdate, Trigger.isUnDelete, Trigger.isExecuting);
                if (Trigger.isBefore) {
                        dispatcher.bulkBefore();
            if (Trigger.isDelete)
                        dispatcher.beforeDelete(tp);
            else if (Trigger.isInsert)
                        dispatcher.beforeInsert(tp);
            else if (Trigger.isUpdate)
                        dispatcher.beforeUpdate(tp);        
                }else{
                        dispatcher.bulkAfter();
                    if (Trigger.isDelete)
                                dispatcher.afterDelete(tp);
                    else if (Trigger.isInsert)
                                dispatcher.afterInsert(tp);
                    else if (Trigger.isUpdate)
                            dispatcher.afterUpdate(tp);
                    else if (Trigger.isUndelete)
                                dispatcher.afterUndelete(tp);
                }
                dispatcher.andFinally();
    }
 
    private static ITriggerDispatcher getTriggerDispatcher(Schema.sObjectType soType){
                String originalTypeName = soType.getDescribe().getName();
                String dispatcherTypeName = originalTypeName;
                if (originalTypeName.toLowerCase().endsWith('__c')) {
                        Integer index = originalTypeName.toLowerCase().lastIndexOf('__c');
                        dispatcherTypeName = originalTypeName.substring(0, index);
                }else if(originalTypeName.toLowerCase().endsWith('__e')) {
                        Integer index = originalTypeName.toLowerCase().lastIndexOf('__e');
                        dispatcherTypeName = originalTypeName.substring(0, index);
                }
                dispatcherTypeName = dispatcherTypeName.replace('__', '');//for namespace
                dispatcherTypeName = dispatcherTypeName + '_D';
    
                Type obType = Type.forName(dispatcherTypeName);
                ITriggerDispatcher dispatcher = (obType == null) ? null : (ITriggerDispatcher)obType.newInstance();
                return dispatcher;
        }
}