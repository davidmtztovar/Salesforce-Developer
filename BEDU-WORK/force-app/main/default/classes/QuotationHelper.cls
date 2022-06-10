public with sharing class QuotationHelper {

    public QuotationHelper(){

    }

    public void initialConfig() {

        Account acc1 = new Account();
        acc1.Name= 'Compumundo';
 
        Account acc2 = new Account();
        acc2.Name= 'Compuworld';
 
        List<Account> lst= new List<Account>();
        lst.add(acc1);
        lst.add(acc2);
         Try {
        insert lst;
         }  catch (DmlException d){
            Exception Code;
         }
    
    }//fin InitialConfig 



    public List<Inventario__c> productInInventory(){
        List<Inventario__c> myList = [SELECT ProductCode__c, Name FROM Inventario__c]; 
         System.debug ('Ejecutando product inventory');
        return (myList);
    } //productInventory    

    public Boolean confirmProductExistByCode(String Id){
        Product2[] product = [SELECT Id FROM Product2 WHERE ExternalId = :Id
             LIMIT 1
        ];

        return !product.isEmpty();
    }//confirmProductExistByCode

    public Integer searchProductByCode(String code) {
        
        Integer availableQuantity = 0;
        
        if(confirmProductExistByCode(code)) {
            Inventario__c inventory = [
            SELECT Id,Quantity_Available__c,reserved_quantity__c FROM Inventario__c WHERE ProductCode__c = :code
            LIMIT 1
            ];
            availableQuantity = (Integer)(inventory.Quantity_Available__c - inventory.reserved_quantity__c);
        }

        return availableQuantity;
    }//searchProductByCode

}//class
