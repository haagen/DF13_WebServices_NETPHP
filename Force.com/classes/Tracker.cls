global class Tracker {

	webservice static string GetTrackingNbr(Id OppId) {
		
		Opportunity Opp = [select Id, TrackingNumber__c from Opportunity where Id = :OppId LIMIT 1];
		
		return Opp.TrackingNumber__c;
		
	}

}