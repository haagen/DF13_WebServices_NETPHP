<?php

/*

Removed due to conflict with PHP Toolkit

class ID {
}

class sObject {
  public $fieldsToNull; // string
  public $Id; // ID
}
*/

class AggregateResult {
  public $any; // <anyXML>
}

class Opportunity {
}

class notifications {
  public $OrganizationId; // ID
  public $ActionId; // ID
  public $SessionId; // string
  public $EnterpriseUrl; // string
  public $PartnerUrl; // string
  public $Notification; // OpportunityNotification
}

class OpportunityNotification {
  public $Id; // ID
  public $sObject; // Opportunity
}

class notificationsResponse {
  public $Ack; // boolean
}
  
require_once('soapclient/SforceEnterpriseClient.php');  
  
function notifications(notifications $request) {
    try {

        $response = new notificationsResponse();
        $response->Ack = true;
        
        // Setup callback
        $client = new SforceEnterpriseClient();
        $connection = $client->createConnection('enterprise.wsdl');
        $client->setEndpoint($request->EnterpriseUrl);
        $client->setSessionHeader($request->SessionId);
          
        $opps = array();
        
        if (!is_array($request->Notification)) {
            $request->Notification = array($request->Notification);            
        }

        foreach ($request->Notification as $item) {
            ddebug("Item Id: " . $item->Id);
            ddebug("Item sObject Id: " . $item->sObject->Id);
            ddebug("Item raw: " . print_r($item, true));
            
            $opp = new stdClass();
            $opp->Id = $item->sObject->Id;
            $opp->TrackingNumber__c = "Tracking Number (WF PHP) - " . $item->sObject->Id;
            array_push($opps, $opp);
        }
            
            
        
        
        
        if (count($opps) > 0) {
            
            $res = $client->update($opps, 'Opportunity');
            
        } else {
            
            ddebug('Nothing to do!');
            
        }
    
    } catch (Exception $ex) {
        
        ddebug("Exception: " . print_r($ex, true));
    }
    return $response;
} 
  
function ddebug($str) {
    
    file_put_contents('log.txt', $str . "\n", FILE_APPEND);
    
}  
  
ini_set("soap.wsdl_cache_enabled", "0"); // disabling WSDL cache
$server = new SoapServer('Workflow.wsdl');
$server->addFunction('notifications');
$server->handle();                                      
  
  
?>
