/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestOutbound {

    static testMethod void TestOutboundPHP() {
        
		// This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CustomCreditPHPMock());
        
        Account acc1 = new Account(Name = 'My Test Account');
        insert acc1;        
        
        Opportunity opp1 = new Opportunity(Name = 'My Test Opportunity', AccountId = acc1.Id, StageName = 'Qualification', CloseDate = Date.today());
        insert opp1;
        
        Test.startTest();
        
        opp1.StageName = 'Closed Won';
        update opp1;
        
        Test.stopTest();	// Stop test to make sure @future calls has ended
        
        opp1 = [select Id, Customer_Status__c from Opportunity where Id = :opp1.Id];

		System.assertEquals('Mock Status (' + opp1.Id + ' (PHP))', opp1.Customer_Status__c);

    }
}