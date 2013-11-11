using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace NETCustomerStatus
{
    public class Service : ICustomerStatus
    {
        public string GetData(string CustomerId)
        {
            return string.Format("Customer Status ({0})", CustomerId);
        }
    }
}
