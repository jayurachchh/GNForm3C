using GNForm3C;
using GNForm3C.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class AdminPanel_Account_ACC_Expense_ExpInm_LedgerList : System.Web.UI.Page
{
    #region 11.0 Variables

    String FormName = "ExpInm_LedgerList";
    static Int32 PageRecordSize = CV.PageRecordSize;//Size of record per page
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

        if (!Page.IsPostBack)
        {
            #region 12.1 Set Default Dates

            SetDefaultDates();

            #endregion 12.1 Set Default Dates


            #region 12.2 Search Records

            Search(1);

            #endregion 12.2 Search Records

            #region 12.3 DropDown List Fill Section
           FillDropDownList();

            #endregion 12.3 DropDown List Fill Section

            #region 12.4 Set Default Value

            lblSearchHeader.Text = CV.SearchHeaderText;
            lblSearchResultHeader.Text = CV.SearchResultHeaderText;
            upr.DisplayAfter = CV.UpdateProgressDisplayAfter;

            #endregion 12.4 Set Default Value

            #region 12.4 Set Help Text
            ucHelp.ShowHelp("Help Text will be shown here");
            #endregion 12.4 Set Help Text
        }
    }

    #endregion 12.0 Page Load Event

    #region 13.0 Fill DropDownList
    private void FillDropDownList()
    {
      CommonFillMethods.FillDropDownListType(ddlType);
    }
    #endregion 13.0 Fill DropDownList
    #region 13.0 Set Default Dates

    private void SetDefaultDates()
    {
        var today = DateTime.Today;
        var firstDay = new DateTime(today.Year, today.Month, 1);
        var lastDay = firstDay.AddMonths(1).AddDays(-1);

        dtpFromdate.Text = firstDay.ToString("dd/MM/yyyy");
        dtpTodate.Text = lastDay.ToString("dd/MM/yyyy");
    }

    #endregion 13.0 Set Default Dates

    #region 14.0 Search

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Search(1);
    }
    //private void Search(int PageNo)
    //{
    //    #region Parameters


    //    SqlDateTime Fromdate = SqlDateTime.Null;
    //    SqlDateTime Todate = SqlDateTime.Null;
    //    SqlString Type = SqlString.Null;
    //    Int32 Offset = (PageNo - 1) * PageRecordSize;
    //    Int32 TotalRecords = 0;
    //    Int32 TotalPages = 1;


    //    #endregion Parameters

    //    #region Gather Data
    //    if (dtpFromdate.Text.Trim() != String.Empty)
    //       Fromdate = Convert.ToDateTime(dtpFromdate.Text.Trim());

    //    if (dtpTodate.Text.Trim() != String.Empty)
    //        Todate = Convert.ToDateTime(dtpTodate.Text.Trim());
    //    if (txtType.Text.Trim() != String.Empty)
    //        Type = txtType.Text.Trim();


    //    #endregion Gather Data

    //    ACC_ExpenseLedgerBAL aCC_ExpenseLedgerBAL = new ACC_ExpenseLedgerBAL();

    //    DataTable dt = aCC_ExpenseLedgerBAL.SelectPage(Offset, PageRecordSize, out TotalRecords, Fromdate, Todate,Type);

    //    if (PageRecordSize == 0 && dt.Rows.Count > 0)
    //    {
    //        PageRecordSize = dt.Rows.Count;
    //        TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));
    //    }
    //    else
    //        TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));

    //    if (dt != null && dt.Rows.Count > 0)
    //    {
    //        Div_SearchResult.Visible = true;
    //        //Div_ExportOption.Visible = true;
    //        rpData.DataSource = dt;
    //        rpData.DataBind();

    //        if (PageNo > TotalPages)
    //            PageNo = TotalPages;

    //        ViewState["TotalPages"] = TotalPages;
    //        ViewState["CurrentPage"] = PageNo;

    //        CommonFunctions.BindPageList(TotalPages, TotalRecords, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

    //        lblRecordInfoBottom.Text = CommonMessage.PageDisplayMessage(Offset, dt.Rows.Count, TotalRecords, PageNo, TotalPages);
    //        lblRecordInfoTop.Text = CommonMessage.PageDisplayMessage(Offset, dt.Rows.Count, TotalRecords, PageNo, TotalPages);

    //        //lbtnExportExcel.Visible = true;
    //        if (TotalRecords <= CV.SmallestPageSize)
    //        {
    //            Div_Pagination.Visible = false;
    //            Div_GoToPageNo.Visible = false;
    //            Div_PageSize.Visible = false;
    //        }
    //        else
    //        {
    //            Div_Pagination.Visible = true;
    //            Div_GoToPageNo.Visible = true;
    //            Div_PageSize.Visible = true;
    //        }
    //    }

    //    else if (TotalPages < PageNo && TotalPages > 0)
    //        Search(TotalPages);

    //    else
    //    {
    //        Div_SearchResult.Visible = false;
    //        //lbtnExportExcel.Visible = false;

    //        ViewState["TotalPages"] = 0;
    //        ViewState["CurrentPage"] = 1;

    //        rpData.DataSource = null;
    //        rpData.DataBind();

    //        lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
    //        lblRecordInfoTop.Text = CommonMessage.NoRecordFound();

    //        CommonFunctions.BindPageList(0, 0, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

    //        ucMessage.ShowError(CommonMessage.NoRecordFound());
    //    }
    //}

    private void Search(int PageNo)
    {
        #region Parameters

        SqlDateTime Fromdate = SqlDateTime.Null;
        SqlDateTime Todate = SqlDateTime.Null;
        SqlString Type = SqlString.Null;
        decimal TotalBalance = 0;
        Int32 Offset = (PageNo - 1) * PageRecordSize;
        Int32 TotalRecords = 0;
        Int32 TotalPages = 1;

        #endregion Parameters

        #region Gather Data

        if (!string.IsNullOrWhiteSpace(dtpFromdate.Text.Trim()))
        {
            DateTime parsedDate;
            if (DateTime.TryParseExact(dtpFromdate.Text.Trim(), "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out parsedDate))
            {
                Fromdate = new SqlDateTime(parsedDate);
            }
            else
            {
                // Handle invalid date format
                Response.Write("<script>alert('Invalid From Date. Please enter date in dd-MM-yyyy format.');</script>");
                return;
            }
        }

        if (!string.IsNullOrWhiteSpace(dtpTodate.Text.Trim()))
        {
            DateTime parsedDate;
            if (DateTime.TryParseExact(dtpTodate.Text.Trim(), "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out parsedDate))
            {
                Todate = new SqlDateTime(parsedDate);
            }
            else
            {
                // Handle invalid date format
                Response.Write("<script>alert('Invalid To Date. Please enter date in dd-MM-yyyy format.');</script>");
                return;
            }
        }

        if (!string.IsNullOrWhiteSpace(ddlType.Text.Trim()))
        {
            Type = ddlType.Text.Trim();
            if (Type == "-99")
            {
                Type = SqlString.Null;
            }
        }

        #endregion Gather Data

        ACC_ExpenseLedgerBAL aCC_ExpenseLedgerBAL = new ACC_ExpenseLedgerBAL();

        DataTable dt = aCC_ExpenseLedgerBAL.SelectPage(Offset, PageRecordSize, out TotalRecords, Fromdate, Todate, Type);

        foreach (DataRow row in dt.Rows)
        {
            if (row.Field<String>("LedgerType") == "Income")
                TotalBalance += row.Field<decimal>("LedgerAmount");
            else
                TotalBalance -= row.Field<decimal>("LedgerAmount");
        }

        if (PageRecordSize == 0 && dt.Rows.Count > 0)
        {
            PageRecordSize = dt.Rows.Count;
            TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));
        }
        else
        {
            TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));
        }

        if (dt != null && dt.Rows.Count > 0)
        {
            Div_SearchResult.Visible = true;
          //  Div_ExportOption.Visible = true;
            rpData.DataSource = dt;
            rpData.DataBind();
            upList.Update();
            lblTotalAmount.Text = TotalBalance.ToString();

            if (PageNo > TotalPages)
                PageNo = TotalPages;

            ViewState["TotalPages"] = TotalPages;
            ViewState["CurrentPage"] = PageNo;

            CommonFunctions.BindPageList(TotalPages, TotalRecords, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

            lblRecordInfoBottom.Text = CommonMessage.PageDisplayMessage(Offset, dt.Rows.Count, TotalRecords, PageNo, TotalPages);
            lblRecordInfoTop.Text = CommonMessage.PageDisplayMessage(Offset, dt.Rows.Count, TotalRecords, PageNo, TotalPages);

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
        {
            Search(TotalPages);
        }
        else
        {
            Div_SearchResult.Visible = false;
            //lbtnExportExcel.Visible = false;

            ViewState["TotalPages"] = 0;
            ViewState["CurrentPage"] = 1;

            rpData.DataSource = null;
            rpData.DataBind();
            upList.Update();

            lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
            lblRecordInfoTop.Text = CommonMessage.NoRecordFound();

            CommonFunctions.BindPageList(0, 0, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

            ucMessage.ShowError(CommonMessage.NoRecordFound());
        }
    }

    private void Search1(int PageNo)
    {
        #region Parameters

        SqlDateTime Fromdate = SqlDateTime.Null;
        SqlDateTime Todate = SqlDateTime.Null;
        SqlString Type = SqlString.Null;
        decimal TotalBalance = 0;
        Int32 Offset = (PageNo - 1) * PageRecordSize;
        Int32 TotalRecords = 0;
        Int32 TotalPages = 1;

        #endregion Parameters

        #region Gather Data
        if (!string.IsNullOrWhiteSpace(dtpFromdate.Text.Trim()))
        {
            DateTime parsedDate;
            if (DateTime.TryParseExact(dtpFromdate.Text.Trim(), "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out parsedDate))
            {
                Fromdate = new SqlDateTime(parsedDate);
            }
            else
            {
                // Handle invalid date format
                Response.Write("<script>alert('Invalid From Date. Please enter date in dd-MM-yyyy format.');</script>");
                return;
            }
        }

        if (!string.IsNullOrWhiteSpace(dtpTodate.Text.Trim()))
        {
            DateTime parsedDate;
            if (DateTime.TryParseExact(dtpTodate.Text.Trim(), "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out parsedDate))
            {
                Todate = new SqlDateTime(parsedDate);
            }
            else
            {
                // Handle invalid date format
                Response.Write("<script>alert('Invalid To Date. Please enter date in dd-MM-yyyy format.');</script>");
                return;
            }
        }

        if (!string.IsNullOrWhiteSpace(ddlType.Text.Trim()))
        {
            Type = ddlType.Text.Trim();
        }

        #endregion Gather Data

        ACC_ExpenseLedgerBAL aCC_ExpenseLedgerBAL = new ACC_ExpenseLedgerBAL();

        DataTable dt = aCC_ExpenseLedgerBAL.SelectPage(Offset, PageRecordSize, out TotalRecords, Fromdate, Todate, Type);

        foreach (DataRow row in dt.Rows)
        {
            if (row.Field<String>("LedgerType") == "Income")
                TotalBalance += row.Field<decimal>("LedgerAmount");
            else
                TotalBalance -= row.Field<decimal>("LedgerAmount");
        }

        if (PageRecordSize == 0 && dt.Rows.Count > 0)
        {
            PageRecordSize = dt.Rows.Count;
            TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));
        }
        else
        {
            TotalPages = (int)Math.Ceiling((double)((decimal)TotalRecords / Convert.ToDecimal(PageRecordSize)));
        }

        if (dt != null && dt.Rows.Count > 0)
        {
            Div_SearchResult.Visible = true;
            //Div_ExportOption.Visible = true;
            rpData.DataSource = dt;
            rpData.DataBind();
            lblTotalAmount.Text=TotalBalance.ToString();
            

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
        {
            Search(TotalPages);
        }
        else
        {
            Div_SearchResult.Visible = false;
            //lbtnExportExcel.Visible = false;

            ViewState["TotalPages"] = 0;
            ViewState["CurrentPage"] = 1;

            rpData.DataSource = null;
            rpData.DataBind();

            lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
            lblRecordInfoTop.Text = CommonMessage.NoRecordFound();

            CommonFunctions.BindPageList(0, 0, PageNo, PageDisplaySize, DisplayIndex, rpPagination, liPrevious, lbtnPrevious, liFirstPage, lbtnFirstPage, liNext, lbtnNext, liLastPage, lbtnLastPage);

            ucMessage.ShowError(CommonMessage.NoRecordFound());
        }
    }


    #endregion 14.0 Search

    #region 16.0 Repeater Events

    #region 16.1 Item Command Event

    protected void rpData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            try
            {
                ACC_ExpenseBAL balACC_Expense = new ACC_ExpenseBAL();
                if (e.CommandArgument.ToString().Trim() != "")
                {
                    if (balACC_Expense.Delete(Convert.ToInt32(e.CommandArgument)))
                    {
                        ucMessage.ShowSuccess(CommonMessage.DeletedRecord());

                        if (ViewState["CurrentPage"] != null)
                        {
                            int Count = rpData.Items.Count;

                            if (Count == 1 && Convert.ToInt32(ViewState["CurrentPage"]) != 1)
                                ViewState["CurrentPage"] = (Convert.ToInt32(ViewState["CurrentPage"]) - 1);
                            Search(Convert.ToInt32(ViewState["CurrentPage"]));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ucMessage.ShowError(ex.Message.ToString());
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

    #region 20.0 Cancel Button Event

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControls();
    }

    #endregion 20.0 Cancel Button Event

    #region 22.0 ClearControls

    private void ClearControls()
    {
        //dtpFromdate.Text = String.Empty;S
        //dtpTodate.Text = String.Empty;
        ddlType.SelectedIndex = 0;
        if(ddlType.SelectedIndex==0)
        {
            ddlType.Text = null; 
        }
        CommonFunctions.BindEmptyRepeater(rpData);
        Div_SearchResult.Visible = false;
        //Div_ExportOption.Visible = false;
        lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
        lblRecordInfoTop.Text = CommonMessage.NoRecordFound();
    }

    #endregion 22.0 ClearControls


}