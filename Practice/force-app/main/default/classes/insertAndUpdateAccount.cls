public class insertAndUpdateAccount {
    @AuraEnabled
    public static void accountMethod(String fname, String numb, String billStreet, String billCity, String billState, String billCountry, String description) {
       
        List<Account> eleLists = [select Name,AccountNumber,BillingStreet,BillingCity,BillingState,BillingCountry,Description from Account where Name =: fname];      
        try{
        // update account record
       if(!eleLists.isEmpty()){
        Account eleList = eleLists[0];
        eleList.AccountNumber = numb;
        eleList.BillingStreet = billStreet;
        eleList.BillingCity = billCity;
        eleList.BillingState = billState;
        eleList.BillingCountry = billCountry;
        eleList.Description = description;
        update eleList;
        }

       // insert account record
     else if(eleLists.isEmpty()){
            Account acc = new Account();
            acc.Name = fname;
            acc.AccountNumber = numb;
            acc.BillingStreet = billStreet;
            acc.BillingCity = billCity;
            acc.BillingState = billState;
            acc.BillingCountry = billCountry;
            acc.Description = description;
            insert acc;
   
        }
    }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
     }      
}