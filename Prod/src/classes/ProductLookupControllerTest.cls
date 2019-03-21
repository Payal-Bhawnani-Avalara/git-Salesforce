@isTest
public class ProductLookupControllerTest {
  public static testMethod void checkProductLookupOptions(){
    ProductLookupController plc = new ProductLookupController();
    System.AssertNotEquals(plc.optionsForProductLookup, null);
  }
}