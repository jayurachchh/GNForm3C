using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;


public partial class Default_MasterPageWithoutLogin : System.Web.UI.MasterPage
{
    #region 10.0 Variables
    private DataTable dtMenu;
    HiddenField hfIsDelete = new HiddenField();
    HiddenField MenuFavourite = new HiddenField();
    private string strDomainURL = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
    #endregion 10.0 Variables

    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            #region Set Default Values

           // if (Session[CVEnum.GlobalConfiguration.DefaultUniversityNameHTML] != null)
            //    lblDefaultUniversityNameHTML.Text = Session[CVEnum.GlobalConfiguration.DefaultUniversityNameHTML].ToString();

            //if (Session[CVEnum.GlobalConfiguration.DefaultUniversityShortNameHTML] != null)
            //    lblDefaultUniversityShortNameHTML.Text = Session[CVEnum.GlobalConfiguration.DefaultUniversityShortNameHTML].ToString();

            #endregion Set Default Values
        }
    }

    #endregion Page Load Event


}
