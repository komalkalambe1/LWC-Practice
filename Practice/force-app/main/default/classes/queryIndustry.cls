public class queryIndustry {
    public static void method(){
      Map<String, Integer> countmap = new Map<String, Integer>();
	  
			List<aggregateResult> aggregate = [Select Count(id) from Account  Where Industry != null Group by Industry];
			  
			  for(aggregateResult ar:aggregate){
			       String Industry = (String)ar.get('Industry');
                   Integer cout = (Integer)ar.get('Count(id)');
                     countmap.put(Industry, cout);				   
		
  
  }
  
  
        System.debug(countmap);
        
    }
}