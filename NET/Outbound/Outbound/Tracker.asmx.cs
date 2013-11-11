using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace NETCustomerStatus
{
    public class Tracker : INotificationBinding
    {

        notificationsResponse INotificationBinding.notifications(notifications notifications1)
        {
            
            try
            {
                               
                SforceService.SforceService client = new SforceService.SforceService();
                client.Url = notifications1.EnterpriseUrl;
                client.SessionHeaderValue = new SforceService.SessionHeader();
                client.SessionHeaderValue.sessionId = notifications1.SessionId;
               
                List<SforceService.Opportunity> Opps = new List<SforceService.Opportunity>();
                foreach (OpportunityNotification item in notifications1.Notification)
                {
                    SforceService.Opportunity Opp = new SforceService.Opportunity();
                    Opp.Id = item.sObject.Id;
                    Opp.TrackingNumber__c = "Tracking Number (WF .NET) - " + item.Id;
                    Opps.Add(Opp);
                }

                if (Opps.Count > 0)
                {
                    client.update(Opps.ToArray());
                }
                 
            }
            catch (Exception Ex)
            {
                ddebug("Exception: " + Ex.Message);
            }
            notificationsResponse response = new notificationsResponse();
            response.Ack = true;
            return response;
        }

        private void ddebug(string text)
        {
            System.IO.File.AppendAllText(HttpContext.Current.Server.MapPath("~/") + "log.txt", text + "\n");
        }
    }

    
}
