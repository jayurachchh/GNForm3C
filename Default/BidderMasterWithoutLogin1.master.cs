using System;
using System.Data.SqlTypes;
//using System.IO;
//using System.Linq;
using System.Web;
using System.Web.UI;

public partial class Default_BidderMasterWithoutLogin : System.Web.UI.MasterPage
{
    #region Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            imgLogo.ImageUrl = "";
        }
    }

    #endregion Page Load Event

}
