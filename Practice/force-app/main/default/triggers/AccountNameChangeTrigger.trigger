//****************************************************************************************************
// @Name  of the Lwc   : AccountTriggerHandler.cls
// @Description        : trigger for to auto-updates a custom field when an Account’s name is changed
//                         
//                         
// @Author             : Komal
// @Created Date       : 04/02/2025
// ********************************************************************************************** 
//

trigger AccountNameChangeTrigger on Account (before update) {
  
        if (Trigger.isUpdate) {
                AccountTriggerHandler.handleAccountNameChange(Trigger.new, Trigger.oldMap);
            }
    
}