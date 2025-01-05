using GNForm3C;
using GNForm3C.BAL;
using iTextSharp.text.html;
using iTextSharp.text.xml;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class AdminPanel_DataTree_Hospitaldatatree : System.Web.UI.Page
{
    #region 11.0 Variables

    String FormName = "HospitalList";
    static Int32 PageRecordSize = CV.PageRecordSize;//Size of record per page
    static Int32 PageNo = 1;
    Int32 Offset = (PageNo - 1) * PageRecordSize;
    Int32 TotalRecords = 0;
    Int32 TotalPages = 1;
    Int32 PageDisplaySize = CV.PageDisplaySize;
    Int32 DisplayIndex = CV.DisplayIndex;

    #endregion 11.0 Variables

    #region 12.0 Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 12.0 Check User Login

        if (Session["UserID"] == null)
            Response.Redirect(CV.LoginPageURL);

        #endregion 12.0 Check User Login

        if (!IsPostBack)
        {
            #region 12.1 DropDown List Fill Section

            FillDropDownList();

            #endregion 12.1 DropDown List Fill Section
            // LoadHospitals();
            Search(1);

            #region 12.2 Set Default Value

            lblSearchHeader.Text = CV.SearchHeaderText;
            lblSearchResultHeader.Text = CV.SearchResultHeaderText;
            upr.DisplayAfter = CV.UpdateProgressDisplayAfter;

            #endregion 12.2 Set Default Value

            #region 12.3 Set Help Text
            ucHelp.ShowHelp("Help Text will be shown here");
            #endregion 12.3 Set Help Text
        }
    }
    #endregion 12.0 Page Load Event 

    #region 13.0 FillLabels 

    private void FillLabels(String FormName)
    {
    }

    #endregion

    #region 14.0 DropDownList

    #region 14.1 Fill DropDownList

    private void FillDropDownList()
    {

        CommonFunctions.GetDropDownPageSize(ddlPageSizeBottom);
        ddlPageSizeBottom.SelectedValue = PageRecordSize.ToString();

        CommonFillMethods.FillDropDownListHospitalID(ddlHospitalID);
    }

    #endregion 14.1 Fill DropDownList   

    #endregion 14.0 DropDownList

    #region 15.0 Search

    #region 15.1 Button Search Click Event

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Search(1);
    }

    #endregion 15.1 Button Search Click Event

    #region 15.2 Search Function

    private void Search(int PageNo)
    {
        #region Parameters
        SqlInt32 FinYearID = SqlInt32.Null;
        SqlInt32 HospitalID = SqlInt32.Null;
        Int32 Offset = (PageNo - 1) * PageRecordSize;
        Int32 TotalRecords = 0;
        Int32 TotalPages = 1;

        #endregion Parameters

        #region Gather Data

        if (ddlHospitalID.SelectedIndex > 0)
            HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);

        #endregion Gather Data
        HospitalDataTreeBAL hospitalDataTreeBAL = new HospitalDataTreeBAL();

        //MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();

        DataTable dt = hospitalDataTreeBAL.SelectPage(Offset, PageRecordSize, out TotalRecords, HospitalID, FinYearID);

        if (PageRecordSize == 0 && dt.Rows.Count > 0)
        {
            PageRecordSize = dt.Rows.Count;
            TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));
        }
        else
            TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));

        if (dt != null && dt.Rows.Count > 0)
        {
            Div_SearchResult.Visible = true;
            //Div_ExportOption.Visible = true;
            rptHospitals.DataSource = dt;
            rptHospitals.DataBind();



            if (PageNo > TotalPages)
                PageNo = TotalPages;

            ViewState["TotalPages"] = TotalPages;
            ViewState["CurrentPage"] = PageNo;

            CommonFunctions.BindPageList(TotalPages, TotalRecords, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

            lblRecordInfoBottom.Text = CommonMessage.PageDisplayMessage(Offset, dt.Rows.Count, TotalRecords, PageNo, TotalPages);
            lblRecordInfoTop.Text = CommonMessage.PageDisplayMessage(Offset, dt.Rows.Count, TotalRecords, PageNo, TotalPages);

            //lbtnExportExcel.Visible = true;
            if (TotalRecords <= CV.SmallestPageSize)
            {
                Div_Pagination.Visible = false;
                Div_GoToPageNo.Visible = false;
                Div_PageSize.Visible = false;
            }
            else
            {
                Div_Pagination.Visible = true;
                Div_GoToPageNo.Visible = true;
                Div_PageSize.Visible = true;
            }
        }

        else if (TotalPages < PageNo && TotalPages > 0)
            Search(TotalPages);

        else
        {
            Div_SearchResult.Visible = false;
            //lbtnExportExcel.Visible = false;

            ViewState["TotalPages"] = 0;
            ViewState["CurrentPage"] = 1;

            rptHospitals.DataSource = null;
            rptHospitals.DataBind();

            lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
            lblRecordInfoTop.Text = CommonMessage.NoRecordFound();

            CommonFunctions.BindPageList(0, 0, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

            ucMessage.ShowError(CommonMessage.NoRecordFound());
        }
    }



    #endregion 15.2 Search Function

    #endregion 15.0 Search
    /*    private void LoadHospitals()
        {

            // Call the stored procedure without parameters to get all hospitals
            HospitalDataTreeBAL aCC_IncomeListBAL = new HospitalDataTreeBAL();
            DataTable dtHospitals = aCC_IncomeListBAL.SelectPage(null, null);

            // Bind the hospital data to the repeater
            rptHospitals.DataSource = dtHospitals;
            rptHospitals.DataBind();
        }*/
    #region 16.0 Repeater Events

    #region 16.1 Item Command Event

    protected void rptHospitals_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "LoadFinYears")
        {

            Panel panelFinYears = (Panel)e.Item.FindControl("pnlFinYears");
            Button btnshowFinYears = (Button)e.Item.FindControl("btnShowFinYears");
            if (panelFinYears != null)
            {
                if (panelFinYears.Visible)
                {
                    panelFinYears.Visible = false;
                    btnshowFinYears.Text = "+";
                    btnshowFinYears.CssClass = "btn green btn-circle btn-xs tooltips";
                }
                else
                {
                    int hospitalID = Convert.ToInt32(e.CommandArgument);
                    SqlInt32 finyear = SqlInt32.Null;
                    // Find the nested repeater for Financial Years
                    Repeater rptFinYears = (Repeater)e.Item.FindControl("rptFinYears");

                    // Fetch Financial Years for the selected HospitalID
                    HospitalDataTreeBAL aCC_IncomeListBAL = new HospitalDataTreeBAL();
                    DataTable dtFinYears = aCC_IncomeListBAL.SelectPage(Offset, PageRecordSize, out TotalRecords, hospitalID, finyear);

                    btnshowFinYears.Text = "-";
                    btnshowFinYears.CssClass = "btn green btn-circle btn-xs tooltips";

                    // Bind the Financial Years data to the nested repeater
                    rptFinYears.DataSource = dtFinYears;
                    rptFinYears.DataBind();
                    panelFinYears.Visible = true;
                }
                // Set the Panel visibility to true

            }



        }
    }
  
    protected void rptFinYears_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "LoadIncomes")
        {
            Panel panelIncomes = (Panel)e.Item.FindControl("pnlIncomes");
            Button btnshowFinYears = (Button)e.Item.FindControl("btnShowIncomes");
            if (panelIncomes != null)
            {
                if (panelIncomes.Visible)
                {
                    panelIncomes.Visible = false;
                    btnshowFinYears.Text = "+";
                    btnshowFinYears.CssClass = "btn green btn-circle btn-xs tooltips";
                }
                else
                {

                    int finYearID = Convert.ToInt32(e.CommandArgument);

                    // Find the parent RepeaterItem of this financial year (to get HospitalID)
                    RepeaterItem parentItem = (RepeaterItem)((Repeater)sender).NamingContainer;
                    HiddenField hdnHospitalID = (HiddenField)parentItem.FindControl("hdnHospitalID");
                    int hospitalID = Convert.ToInt32(hdnHospitalID.Value);

                    // Find the nested repeater for Income
                    Repeater rptIncomes = (Repeater)e.Item.FindControl("rptIncomes");

                    // Fetch Incomes for the selected HospitalID and FinYearID
                    HospitalDataTreeBAL aCC_IncomeListBAL = new HospitalDataTreeBAL();
                    DataTable dtIncomes = aCC_IncomeListBAL.SelectPage(Offset, PageRecordSize, out TotalRecords, hospitalID, finYearID);

                    btnshowFinYears.Text = "-";
                    btnshowFinYears.CssClass = "btn green btn-circle btn-xs tooltips";

                    // Bind the Income data to the nested repeater
                    rptIncomes.DataSource = dtIncomes;
                    rptIncomes.DataBind();

                    panelIncomes.Visible = true;

                }
            }
        }
    }

    #endregion 16.1 Item Command Event    

    #endregion 16.0 Repeater Events

    #region 17.0 Pagination   

    #region 17.1 Pagination Events

    #region ItemDataBound Event

    protected void rpPagination_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lb = (LinkButton)e.Item.FindControl("lbtnPageNo");
            HtmlGenericControl hgc = (HtmlGenericControl)e.Item.FindControl("liPageNo");
            if (Convert.ToInt32(ViewState["CurrentPage"]) == Convert.ToInt32(lb.CommandArgument))
            {
                hgc.Attributes["class"] = CSSClass.PaginationButtonActive;
                lb.Enabled = false;
            }
            else
                hgc.Attributes["class"] = CSSClass.PaginationButton;
        }
    }

    #endregion ItemDataBound Event

    #region PageChange Event

    protected void PageChange_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)(sender);
        int Value = Convert.ToInt32(lbtn.CommandArgument);
        String Name = lbtn.CommandName.ToString();

        if (Name == "PageNo" || Name == "FirstPage")
            Search(Value);

        else if (Name == "PreviousPage")
            Search(Convert.ToInt32(ViewState["CurrentPage"]) - Value);

        else if (Name == "NextPage")
            Search(Convert.ToInt32(ViewState["CurrentPage"]) + Value);

        else if (Name == "LastPage")
            Search(Convert.ToInt32(ViewState["TotalPages"]));

        else if (Name == "GoPageNo")
        {
            if (txtPageNo.Text.Trim() == String.Empty)
            {
                ucMessage.ShowError(CommonMessage.ErrorRequiredField("Page No"));
                return;
            }
            else
            {
                Value = Convert.ToInt32(txtPageNo.Text);
                if (Value > Convert.ToInt32(ViewState["TotalPages"]))
                {
                    ucMessage.ShowError(CommonMessage.ErrorInvalidField("Page No"));
                    return;
                }
                Search(Value);
            }
        }
    }

    #endregion PageChange Event

    #endregion 17.1 Pagination Events

    #endregion 17.0 Pagination

    #region 18.0 Button Delete Click Event


    #endregion 18.0 Button Delete Click Event


    #region 20.0 Cancel Button Event

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControls();
    }

    #endregion 20.0 Cancel Button Event

    #region 21.0 ddlPageSize Selected Index Changed Event

    protected void ddlPageSizeBottom_SelectedIndexChanged(object sender, EventArgs e)
    {
        PageRecordSize = Convert.ToInt32(ddlPageSizeBottom.SelectedValue);
        Search(Convert.ToInt32(ViewState["CurrentPage"]));
    }

    protected void ddlPageSizeTop_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlPageSizeBottom.SelectedValue = PageRecordSize.ToString();
        Search(Convert.ToInt32(ViewState["CurrentPage"]));
    }

    #endregion 21.0 ddlPageSize Selected Index Changed Event

    #region 22.0 ClearControls

    private void ClearControls()
    {
        ddlHospitalID.SelectedIndex = 0;
        CommonFunctions.BindEmptyRepeater(rptHospitals);
        Div_SearchResult.Visible = false;
        //Div_ExportOption.Visible = false;
        lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
        lblRecordInfoTop.Text = CommonMessage.NoRecordFound();
    }

    #endregion 22.0 ClearControls
}