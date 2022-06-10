public with sharing class BatchApexExample implements Database.Batchable <SObject>, Database.Stateful {
    
    public Integer contador=0;

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query ='SELECT id, Name FROM Account WHERE Name= "BEDU" ';
        return Database.QueryLocator(query);
    }//start

    global void execute(Database.BatchableContext BC, List<Account> accList){
        List<Account> lst = new List<Account>();

        for(Account item: accList){
            item.Name = 'Bedu';
            lst.add(item);
            contador++;
        }
        update lst;
    }//execute

    global void finish(Database.BatchableContext BC){
        System.debug('Resultado contado:' +contador);
        BatchApexExample2 batch2 = new BatchApexExample2();
        Database.execute(batch2);
    }

}//class
