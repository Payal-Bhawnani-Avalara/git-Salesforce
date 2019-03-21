public with sharing class APIValidateRecordLock {
	public static Boolean SkipForUnitTest=true;
    public static void validateRecordLock(List<sObject> listNewObj,Map<Id,sObject> oldObjMap){
    		if(Test.isRunningTest() && APIValidateRecordLock.SkipForUnitTest){
    			return;
    		}
    		if(listNewObj!=null && listNewObj.size()>0 && oldObjMap!=null && oldObjMap.size()>0 ){
			sObject obj=listNewObj[0];
			String sObjName = obj.Id.getSObjectType().getDescribe().getName();
			List<ObjectFieldLock__mdt> listObjMDT=[Select Id,Error_Message__c,Lockable_Fields__c,Never_Editable_Fields__c,Notes__c,
													Object_Name__c,User_Special_Permissions__c ,Other_Fields__c,Always_Editable_Fields__c,
													Locked_Field__c,Was_Record_Locked_Field__c,Exclude_User_IDs__c,EDW_Freeze_Field__c,
													Always_Allow_Permission__c
													From ObjectFieldLock__mdt 
													Where Object_Name__c=:sObjName AND Is_Active__c=true];
			ObjectFieldLock__mdt objMDT;
			if(listObjMDT!=null && listObjMDT.size()==1){
				objMDT=listObjMDT[0];
			}
			if(objMDT!=null){
				Boolean userHasPermissions=false;
				Boolean userIsAlwaysExcluded=false;
				User currentUser=[Select Special_Permission__c From User Where Id=:UserInfo.getUserId()];
				if(String.isNotBlank(currentUser.Special_Permission__c) && String.isNotBlank(objMDT.Always_Allow_Permission__c) && currentUser.Special_Permission__c.toLowerCase().contains(objMDT.Always_Allow_Permission__c.toLowerCase())){
					userIsAlwaysExcluded=true;
				}
				if(userIsAlwaysExcluded){
					return;
				}
				if(String.isNotBlank(currentUser.Special_Permission__c) && String.isNotBlank(objMDT.User_Special_Permissions__c)  && currentUser.Special_Permission__c.toLowerCase().contains(objMDT.User_Special_Permissions__c.toLowerCase())){
					userHasPermissions=true;
				}				
				Map<String,String> mapObjFields=Utility.getSObjectFieldsAndLabels(sObjName);
				for(sObject newObj:listNewObj){
					sObject oldObj=oldObjMap.get(String.valueOf(newObj.get('Id')));
					Object isRecordFrozen=newObj.get(objMDT.EDW_Freeze_Field__c);
					Object isRecordLocked=newObj.get(objMDT.Locked_Field__c);
					Object wasRecordLocked=newObj.get(objMDT.Was_Record_Locked_Field__c);
					Object isRecordLockedOld=oldObj.get(objMDT.Locked_Field__c);
					Object wasRecordFrozen=oldObj.get(objMDT.EDW_Freeze_Field__c);
					//Object wasRecordLockedOld=oldObj.get(objMDT.Was_Record_Locked_Field__c);		
					//if user is excluded then return
					if(
						(!Boolean.valueOf(isRecordFrozen) && String.isNotBlank(objMDT.Exclude_User_IDs__c) && objMDT.Exclude_User_IDs__c.contains(UserInfo.getUserId())) ||
						(Boolean.valueOf(isRecordFrozen)  && !Boolean.valueOf(wasRecordFrozen)) 
						){
						continue;
					}												
					if(Boolean.valueOf(isRecordFrozen) || (Boolean.valueOf(isRecordLocked) && Boolean.valueOf(isRecordLockedOld) && Boolean.valueOf(wasRecordLocked))){
						newObj.addError(objMDT.Error_Message__c);
						continue;						
					}
					if(!userHasPermissions && !Boolean.valueOf(isRecordLocked) && Boolean.valueOf(isRecordLockedOld) && Boolean.valueOf(wasRecordLocked)){
						newObj.addError(objMDT.Error_Message__c);
						continue;						
					}					
					if(Boolean.valueOf(wasRecordLocked)){
						for(String fieldName:mapObjFields.keySet()){
							if(newObj.get(fieldName)!=oldObj.get(fieldName)){
								if(String.isNotBlank(objMDT.Never_Editable_Fields__c) && objMDT.Never_Editable_Fields__c.toLowerCase().contains(fieldName.toLowerCase())){							
									newObj.addError(objMDT.Error_Message__c);
									break;
								}							
								if(!userHasPermissions && String.isNotBlank(objMDT.Lockable_Fields__c) && objMDT.Lockable_Fields__c.toLowerCase().contains(fieldName.toLowerCase())){							
									newObj.addError(objMDT.Error_Message__c);
									break;
								}
								if(
									((String.isNotBlank(objMDT.Never_Editable_Fields__c) && !objMDT.Never_Editable_Fields__c.toLowerCase().contains(fieldName.toLowerCase())) &&
									(String.isNotBlank(objMDT.Lockable_Fields__c) && !objMDT.Lockable_Fields__c.toLowerCase().contains(fieldName.toLowerCase())) &&
									(String.isNotBlank(objMDT.Always_Editable_Fields__c) && !objMDT.Always_Editable_Fields__c.toLowerCase().contains(fieldName.toLowerCase())) )
									&& objMDT.Other_Fields__c=='Not Editable'){							
									newObj.addError(objMDT.Error_Message__c);
									break;
								}						
							}
						}
					}
				}
			}
    		}
    }
}