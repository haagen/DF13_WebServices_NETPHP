<?php

ini_set("soap.wsdl_cache_enabled", "0"); // disabling WSDL cache
$client = new SoapClient("http://df13-php.4front.se/Outbound/service.wsdl");
$return = $client->GetCustomerCreditStatus(array('MyString' => '12345'));
print_r($return);
?>
