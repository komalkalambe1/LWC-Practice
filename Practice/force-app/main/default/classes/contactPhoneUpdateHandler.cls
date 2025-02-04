public class contactPhoneUpdateHandler {
    public static void method( List<Account> acclist){
	
	List<Contact> emptylist = new List<Contact>();
	      for(Account acc: acclist){
		        Contact con = new Contact();
				  con.AccountId = acc.id;
				  con.Phone = acc.Phone;
				  emptylist.add(con);
				  
		  
		  }
		  update emptylist;
	
	}

}