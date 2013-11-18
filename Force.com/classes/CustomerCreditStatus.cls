public class CustomerCreditStatus {

	
	@future(Callout=true)
	public static void CallGetStatusPHP(string OpportunityId) 
	{
		CustomCreditPHP.CustomerCreditServicePort binding = new CustomCreditPHP.CustomerCreditServicePort();
		
		try
		{
		
			string Status = binding.GetCustomerCreditStatus(OpportunityId + ' (PHP)');
			System.debug('External WS returned: ' + Status);
			
			Opportunity Opp = new Opportunity();
			Opp.Id = OpportunityId;
			Opp.Customer_Status__c = Status;
			
			update Opp;	
			
		}
		catch (System.Exception Ex)
		{
			
			System.debug('An error occured: ' + Ex.getMessage());
		
		}
		
	}
	
	@future(Callout=true)
	public static void CallGetDataNET(string OpportunityId)
	{
		
		CustomCreditNET.BasicHttpBinding_ICustomerStatus binding = new CustomCreditNET.BasicHttpBinding_ICustomerStatus();
		
		try
		{

			string Status = binding.GetData(OpportunityId + ' (.NET)');
			System.debug('External WS returned: ' + Status);
			
			Opportunity Opp = new Opportunity();
			Opp.Id = OpportunityId;
			Opp.Customer_Status__c = Status;
			
			update Opp;	
			
		} 
		catch (System.Exception Ex)
		{
			
			System.debug('An error occured: ' + Ex.getMessage());
			
		}
		
	}
	

}