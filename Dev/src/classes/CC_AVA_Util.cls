public with sharing class CC_AVA_Util {
	public static String getSandboxName(){
      String sandboxName=UserInfo.getUserName();
      if(sandboxName.startsWithIgnoreCase('avalarastore@')){
	      sandboxName=sandboxName.toLowerCase();
		  sandboxName=sandboxName.substring(sandboxName.indexOf('@'));
		  if(sandboxName.indexOf('-')>-1){
		  	sandboxName=sandboxName.substring(1,sandboxName.indexOf('-'));
		  }
		else {
	          sandboxName=sandboxName.substringAfterLast('.');
	          sandboxName=sandboxName.toLowerCase();
	        }		  
	      if(UserInfo.getUserName()=='avalarastore@avalaracommunity.force.com'){
	        sandboxName='prod';
	      }
      }
      else
      {
	    sandboxName=sandboxName.substringAfterLast('.');
		sandboxName=sandboxName.toLowerCase();	
 		if(sandboxName=='com'){
 			sandboxName='prod';
		}      	
      }
	  system.debug('sandboxName==='+sandboxName);	
	  return sandboxName;	
	} 	   
}