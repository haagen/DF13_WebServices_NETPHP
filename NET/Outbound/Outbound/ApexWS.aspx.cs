using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NETCustomerStatus
{
    public partial class ApexWS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            
            if (string.IsNullOrWhiteSpace(OppID.ID)) {
                Label1.Text = "Please provide a Salesforce Opportunity ID";
                return;
            }

            try
            {
                // A valid SFDC Session needs to exist
                SforceService.SforceService sfdc = new SforceService.SforceService();
                SforceService.LoginResult lr = sfdc.login("", "");

                ApexTracker.TrackerService client = new ApexTracker.TrackerService();
                client.SessionHeaderValue = new ApexTracker.SessionHeader();
                client.SessionHeaderValue.sessionId = lr.sessionId;
                string Tracker = client.GetTrackingNbr(OppID.Text);
                Label1.Text = "Tracking number is " + Tracker;
            }
            catch (Exception Ex)
            {
                Label1.Text = "Something went wrong... (" + Ex.Message + ")";
            }   
             
        }
    }
}