public class RatingHotInsertUpdate {
    public static void method( List<Account> acclist,  Map<Id, Account> oldmap){
  
         for(Account acc:acclist){ 
             if((acc.Industry=='Media' && oldmap == null)  ||(acc.Industry=='Media' && acc.Industry != oldmap.get(acc.id).Industry  )){
                 acc.Rating = 'Hot';
             }
           
         }
        }
         
}