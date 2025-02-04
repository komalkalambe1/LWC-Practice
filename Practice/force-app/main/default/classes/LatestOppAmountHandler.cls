public class LatestOppAmountHandler {
      public static void method(List<Opportunity> opplist){
      List<Account> emptylist = new List<Account>();
     for( Opportunity opp:opplist){
	      Account acc = new Account();
		  acc.id = opp.AccountId;
		 acc.Latest_Opportunity_Amount__c   = Opp.Amount;
	       emptylist.add(acc);
	 
	 
	 }
	 
	 if(!emptylist.isempty()){
	     update emptylist;
	 }
  
  }
}