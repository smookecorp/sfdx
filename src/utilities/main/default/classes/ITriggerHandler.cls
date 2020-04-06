/**
*Author:        
*Company:       
*Description:   
*History
*<Date>        <Authors Name>     <Brief Description of Change>
*                                    Initial version created.    
**/
public interface ITriggerHandler {
    void mainEntry(TriggerParameters tp);
    void inProgressEntry(TriggerParameters tp);
    void updateObjects();
}