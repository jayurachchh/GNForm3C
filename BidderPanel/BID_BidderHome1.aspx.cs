using System;
using System.Data.SqlTypes;
//using System.IO;
//using System.Linq;
using System.Web;
using System.Web.UI;

public partial class BidderPanel_BID_BidderHome1 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!Page.IsPostBack)
		{
            // Initialize page
            LoadStatistics();
        }
	}
    private void LoadStatistics()
    {
        // You can load these from database or configuration
        // For now, they're set in the markup, but you can update them dynamically here
        // Example:
        // lblActiveSuppliers.Text = GetActiveSupplierCount().ToString() + "+";
        // lblRunningTenders.Text = GetRunningTenderCount().ToString() + "+";
        // lblSuccessfulBids.Text = GetSuccessfulBidCount().ToString() + "+";
        // lblValueProcessed.Text = "$" + GetTotalValueProcessed().ToString() + "M+";
    }

    protected void btnGetStarted_Click(object sender, EventArgs e)
    {
        // Redirect to registration page
        Response.Redirect("~/BidderPanel/BID_Registration.aspx");
    }

    protected void btnExploreOpportunities_Click(object sender, EventArgs e)
    {
        // Redirect to opportunities listing page
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx");
    }

    protected void btnPreQual_Click(object sender, EventArgs e)
    {
        // Redirect to pre-qualification opportunities
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx?type=prequalification");
    }

    protected void btnTenders_Click(object sender, EventArgs e)
    {
        // Redirect to tender opportunities
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx?type=tender");
    }

    protected void btnAuctions_Click(object sender, EventArgs e)
    {
        // Redirect to reverse auction opportunities
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx?type=reverseauction");
    }

    protected void btnQuotations_Click(object sender, EventArgs e)
    {
        // Redirect to quotation opportunities
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx?type=quotation");
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        // Redirect to registration page
        Response.Redirect("~/BidderPanel/BID_Registration.aspx");
    }

    protected void btnContactUs_Click(object sender, EventArgs e)
    {
        // Redirect to contact us page
        Response.Redirect("~/BidderPanel/BID_BidderContactus.aspx");
    }

    // Helper methods to get statistics from database (implement as needed)
    private int GetActiveSupplierCount()
    {
        // TODO: Implement database query
        return 500;
    }

    private int GetRunningTenderCount()
    {
        // TODO: Implement database query
        return 150;
    }

    private int GetSuccessfulBidCount()
    {
        // TODO: Implement database query
        return 2500;
    }

    private decimal GetTotalValueProcessed()
    {
        // TODO: Implement database query
        return 50; // in millions
    }
}
