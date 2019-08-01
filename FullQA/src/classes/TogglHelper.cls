global class TogglHelper
{
    webService static String GetObjectType(String idString)
    {
        Id idToProccess = idString;               
        return idToProccess.getSObjectType().getDescribe().getName();
    }
}