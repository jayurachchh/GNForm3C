using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BidderPanel_BID_BidderHome_Final : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initialize page if needed
        }
    }

    #region Hero Portal Cards

    protected void btnPublishTender_Click(object sender, EventArgs e)
    {
        // Redirect to publish tender page
        Response.Redirect("~/BidderPanel/BID_PublishTender.aspx");
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        // Redirect to login page
        Response.Redirect("~/BidderPanel/BID_Login.aspx");
    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {
        // Redirect to registration page
        Response.Redirect("~/BidderPanel/BID_Registration.aspx");
    }

    protected void btnApplyTenders_Click(object sender, EventArgs e)
    {
        // Redirect to opportunities page
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx");
    }

    #endregion

    #region Running Opportunities

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        // Redirect to all opportunities page
        Response.Redirect("~/BidderPanel/BID_Opportunities.aspx");
    }

    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string opportunityId = btn.CommandArgument;
        
        // Redirect to opportunity details page with ID
       // Response.Redirect($"~/BidderPanel/BID_OpportunityDetails.aspx?id={opportunityId}");
    }

    #endregion

    #region CTA Buttons

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

    #endregion
}
