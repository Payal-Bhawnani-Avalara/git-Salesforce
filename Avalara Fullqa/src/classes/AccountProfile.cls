public class AccountProfile {

public Account_Profile__c accPro { get; set; }

public AccountProfile (ApexPages.StandardController ctrl) {
    String opportuniyID =(String)ctrl.getRecord().get('Id');
    id prosProRecrdtypeid = [Select Id from RecordType where DeveloperName='Prospect_Profile_1_0' limit 1].Id;
    String query = 'SELECT ';
    for(Schema.FieldSetMember f : this.getFields()) {
        query += f.getFieldPath() + ', ';
    }
    query += 'Id FROM Account_Profile__c where Opportunity__c =: opportuniyID AND recordtypeid= :prosProRecrdtypeid ';
    accPro = (Account_Profile__c)Database.query(query);
}

    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Account_Profile__c.FieldSets.Command_of_The_Message_Prospect_Profile.getFields();
    }
}