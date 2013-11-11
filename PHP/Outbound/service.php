<?php
  
function GetCustomerCreditStatus($CustomerId) {
    
    return array("MyString" => 'CreditStatus (' . $CustomerId->MyString .')');
    
}  
  
ini_set("soap.wsdl_cache_enabled", "0"); // disabling WSDL cache

$server = new SoapServer('service.wsdl');
$server->addFunction('GetCustomerCreditStatus');
$server->handle();                                      
  
  
?>
