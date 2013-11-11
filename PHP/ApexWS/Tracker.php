<?php
ini_set("soap.wsdl_cache_enabled", "0"); // disabling WSDL cache  
require_once('soapclient/SforceEnterpriseClient.php');

if (empty($_REQUEST['ID'])) {
    die("Please provide the Salesforce Opportunity ID as the ID parameter!");
}


// Get session
$sfdc = new SforceEnterpriseClient();
$connection = $sfdc->createConnection('enterprise.wsdl');
$mylogin = $sfdc->login("", "");

// Set SOAP header 
$client = new SoapClient("Tracker.wsdl");
$header = new SoapHeader("http://soap.sforce.com/schemas/class/Tracker", 'SessionHeader', array (
             'sessionId' => $sfdc->getSessionId()
            ));
$client->__setSoapHeaders($header);


$response = $client->GetTrackingNbr(array("OppId" => $_REQUEST['ID']));
 
if (is_object($response)) {
 
    echo "Tracking Number was: " . $response->result . "<br />\n"; 
  
} else {
    
    echo "Web Service call failed <br />\n";
}
  
?>