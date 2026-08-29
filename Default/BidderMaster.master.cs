using PUMIS;
using PUMIS.BAL;
//using PUMIS.ENT;
using System;
//using System.Collections.Generic;
//using System.Data;
using System.Data.SqlTypes;
//using System.IO;
//using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class Default_BidderMaster : System.Web.UI.MasterPage
{
    #region 10.0 Variables
   // private string strDomainURL = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
    #endregion 10.0 Variables

    #region 11.0 Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        #region 11.1 Check User Login

        if (Session["BidderID"] == null)
            Response.Redirect("~/Tenders/Login");

        #endregion 11.1 Check User Login

        if (!Page.IsPostBack)
        {
            #region 11.2 Set Default Values

            BID_BidderBAL balBID_Bidder = new BID_BidderBAL();
            Int32 BidderID = Convert.ToInt32(Session["BidderID"]);
            SqlString BidderName = balBID_Bidder.SelectBidderNameByBidderID(Convert.ToInt32(Session["BidderID"]));

            if (!BidderName.IsNull && BidderName.ToString().Trim() != String.Empty)
            {
                lblCurrentUsername.Text = BidderName.ToString();
                lblPageHeaderBidderName_XXXXX.Text = BidderName.ToString();
            }

            this.Page.Title = CV.DefaultUniversityName;

            imgLogo.ImageUrl = "~/Images/GNMIS/TenderManagement.png";

            //if (Session["DefaultReportLogoPath"] != null)
            //    imgLogo.ImageUrl = Convert.ToString(Session["DefaultReportLogoPath"]);

            #endregion 11.2 Set Default Values
        }
    }

    #endregion 11.0 Page Load Event

    #region 12.0 Logout button Click Event
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Clear();
        Session.Abandon();
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));

        if (Request.Cookies["ASP.NET_SessionId"] != null)
        {
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", string.Empty));
        }

        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClearStorage", "sessionStorage.clear(); localStorage.clear();", true);

        Response.Redirect("~/Tenders/Login");
    }

    #endregion 12.0 Logout button click Event

    #region My Profile btn Click Event
    protected void lbtnMyProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BidderPanel/BID_BidderDocumentUpdate.aspx");
    }

    #endregion My Profile btn Click Event

    #region Bank Details btn Click Event
    protected void lbtnBankDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BidderPanel/BID_BidderBankDetailsUpdate.aspx");
    }

    #endregion Bank Details btn Click Event
}
