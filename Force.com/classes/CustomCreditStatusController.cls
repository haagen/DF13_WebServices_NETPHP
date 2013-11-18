public class CustomCreditStatusController {

	public PageReference doRedirectionPHP() {
		
		if (System.currentPagereference().getParameters().containsKey('Id')) {
			CustomerCreditStatus.CallGetStatusPHP(System.currentPagereference().getParameters().get('Id'));
			return new PageReference('/' + System.currentPagereference().getParameters().get('Id'));
		}
		
		return null;
	}
	
	public PageReference doRedirectionNET() {
		
		if (System.currentPagereference().getParameters().containsKey('Id')) {
			CustomerCreditStatus.CallGetDataNET(System.currentPagereference().getParameters().get('Id'));
			return new PageReference('/' + System.currentPagereference().getParameters().get('Id'));
		}
		
		return null;
	}	

}