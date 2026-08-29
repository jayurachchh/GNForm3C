using System;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

    
public partial class BidderPanel_BID_BidderHome_New : System.Web.UI.Page
{
    #region 10.0 local variable
    String FormName = "BID_Bidder_Home";
    #endregion 10.0 local variable

    #region 11.0 Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadActiveTenders();
        }
    }
    #endregion 11.0 Load Event

    #region 12.0 Active Tenders 
    private void LoadActiveTenders()
    {
        #region Variables

        SqlDateTime CurrentDate = SqlDateTime.Null;

        #endregion Variables

        #region Fill Repeater

        //BID_TenderBAL balBID_Tender = new BID_TenderBAL();
        DataTable dtBID_Tenders = null;

        if (dtBID_Tenders != null && dtBID_Tenders.Rows.Count > 0)
        {
            dtBID_Tenders = dtBID_Tenders.AsEnumerable().Take(4).CopyToDataTable();

            //rpTender.DataSource = dtBID_Tenders;
            //rpTender.DataBind();
            //divSearchResult.Visible = true;
        }
        else
        {
            //rpTender.DataSource = null;
            //rpTender.DataBind();
        }
        #endregion Fill Repeater
    }

    #endregion 12.0  Active Tenders 
}