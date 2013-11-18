trigger Opportunity_GetCustomerStatus on Opportunity (before update) {

	for (Opportunity Opp : Trigger.New) 
	{
		
		Opportunity OldOpp = Trigger.oldMap.get(Opp.Id);
		
		if (Opp.StageName != OldOpp.StageName && Opp.StageName == 'Closed Won') 
		{
			
			//CustomerCreditStatus.CallGetStatusPHP(Opp.Id);
			
			CustomerCreditStatus.CallGetDataNET(Opp.Id);
			
		}
		
	
	}


}