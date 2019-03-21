public with sharing class FunctionalMatrixRequirementListEdit extends EditableList
{
  // Read the explanation in FunctionalMatrixRequirementListEdit(ApexPages.StandardController)
  // to see when to uncomment the following line.

  // public Account myAccount {get; private set;}

  public FunctionalMatrixRequirementListEdit(ApexPages.StandardController stdController) 
  {
    super(stdController);

    // If necessary, explicitly query for additional metadata on parent record
    // if you are looking to display things that don't come back with the
    // StandardController. In that case, you will need to replace the "Account.X"
    // references in the Visualforce Page with references to an Account variable
    // that you will need to declare in this class (myAccount.X). I have commented out
    // an example.

    // this.myAccount = [SELECT Id,
    //                            Name,
    //                            Custom_Relationship__r.Name
    //                        FROM Account
    //                        WHERE Id =: stdController.getRecord().Id];
    
    this.childList = [SELECT Id,Functional_Matrix_Requirements_Config__r.Name,
                          Date__c,
                          Functional_Matrix__c,
                          Note__c,
                          Name,
                          Sort_Order__c
                      FROM Functional_Matrix_Requirement__c
                      WHERE Functional_Matrix__c =: mysObject.Id];
  }

  /*
   * This method is necessary for reference on the Visualforce page, 
   * in order to reference non-standard fields.
   */
  public List<Functional_Matrix_Requirement__c> getChildren()
  {
    return (List<Functional_Matrix_Requirement__c>)childList;
  }

  public override sObject initChildRecord()
  {
    Functional_Matrix_Requirement__c child = new Functional_Matrix_Requirement__c();
    // Can either use mysObject or acct here
    child.Functional_Matrix__c = mysObject.Id;
    
    return child;
  }
}