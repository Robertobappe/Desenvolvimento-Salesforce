//classe HouseService
public with sharing class HouseService {
    //Para permitir que um método do Apex seja usado em um LWC, anote-o com a 
    //anotação @AuraEnabled
    @AuraEnabled(cacheable=true)
    //método chamado getRecord
    //O método retorna a lista de registros de casas (como uma coleção ordenada) 
    //consultando o objeto House__c.
    public static List<House__c> getRecords() {
        try {
            // Create a list of House records from a SOQL query
            List<House__c> lstHouses = [
                SELECT Id, Name, Address__c, State__c, City__c, Zip__c
                FROM House__c WITH USER_MODE ORDER BY CreatedDate LIMIT 10
                ];
                return lstHouses;
        }
        // Code to handle exception
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());

        }
    }
}