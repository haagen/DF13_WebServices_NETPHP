//Generated by wsdl2apex

public class CustomCreditNET {
    public class GetData_element {
        public String CustomerId;
        private String[] CustomerId_type_info = new String[]{'CustomerId','http://tempuri.org/',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/','true','false'};
        private String[] field_order_type_info = new String[]{'CustomerId'};
    }
    public class GetDataResponse_element {
        public String GetDataResult;
        private String[] GetDataResult_type_info = new String[]{'GetDataResult','http://tempuri.org/',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/','true','false'};
        private String[] field_order_type_info = new String[]{'GetDataResult'};
    }
    public class BasicHttpBinding_ICustomerStatus {
        public String endpoint_x = 'http://df13-net.4front.se/Service.svc';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://schemas.microsoft.com/2003/10/Serialization/', 'schemasMicrosoftCom200310Serializat', 'http://tempuri.org/', 'CustomCreditNET'};
        public String GetData(String CustomerId) {
            CustomCreditNET.GetData_element request_x = new CustomCreditNET.GetData_element();
            CustomCreditNET.GetDataResponse_element response_x;
            request_x.CustomerId = CustomerId;
            Map<String, CustomCreditNET.GetDataResponse_element> response_map_x = new Map<String, CustomCreditNET.GetDataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://tempuri.org/ICustomerStatus/GetData',
              'http://tempuri.org/',
              'GetData',
              'http://tempuri.org/',
              'GetDataResponse',
              'CustomCreditNET.GetDataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetDataResult;
        }
    }
}