using GNForm3C;
using GNForm3C.BAL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Account_ACC_Expense_RPT_ACC_Expense_HospitalWise : System.Web.UI.Page
{
    #region private variable 
    private DataTable dtACC_Expense = new DataTable();
    private ACC_Expense_Hospital_Wise objAcc_Expense = new ACC_Expense_Hospital_Wise();
    #endregion private variable 

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //ShowReport();

            SetDefaultDateTime();
            Search();

        }

    }

    #region ShowReport

    #region 23.0 SetDefaultDateTime
    private void SetDefaultDateTime()
    {
        //    // DateTime dateTime = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
        //    /*
        //            dtpFromDate.Text = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).ToString("dd-MM-yyyy");
        //            dtpToDate.Text = DateTime.Now.ToString("dd-MM-yyyy");*/

        dtpFromDate.Text = new DateTime(2020, 1, 1).ToString("dd-MM-yyyy");


        dtpToDate.Text = new DateTime(2024, 8, 12).ToString("dd-MM-yyyy");

    }


    #region 20.0 SetDefaultDate
    /*    private void SetDefaultDateTime()
        {
            var today = DateTime.Today;
            var firstDay = new DateTime(today.Year, today.Month, 1);
            var lastDay = firstDay.AddMonths(1).AddDays(-1);

            dtpFromDate.Text = firstDay.ToString("dd-MM-yyyy");
            dtpToDate.Text = today.ToString("dd-MM-yyyy");
        }*/
    #endregion 20.0 SetDefaultDate
    #endregion SetDefaultDateTime
    protected void ShowReport()
    {
        #region Parameters
        SqlDateTime FromDate = SqlDateTime.Null;
        SqlDateTime ToDate = SqlDateTime.Null;
        SqlInt32 HospitaID = SqlInt32.Null;

        #endregion Parameters

        #region Gather Data

        #region NavigateLogic

        if (dtpFromDate.Text.Trim() != String.Empty)
            FromDate = Convert.ToDateTime(dtpFromDate.Text.Trim());

        if (dtpToDate.Text.Trim() != String.Empty)
            ToDate = SqlDateTime.Parse(dtpToDate.Text.Trim());
        #endregion NavigateLogic


        #endregion Gather Data

        ACC_ExpenseBAL balACC_Expense = new ACC_ExpenseBAL();
        DataTable dt = balACC_Expense.SelectHospitalWiseExpenseList(FromDate, ToDate, HospitaID);
        dtACC_Expense = dt.Copy();
        FillDataSet();
    }
    #endregion ShowReport

    #region FillDataSet
    protected void FillDataSet()
    {
        foreach (DataRow dr in dtACC_Expense.Rows)
        {
            ACC_Expense_Hospital_Wise.dt_ACC_Expense_HospitalRow dracc_expense = objAcc_Expense.dt_ACC_Expense_Hospital.Newdt_ACC_Expense_HospitalRow();

            if (!dr["ExpenseDate"].Equals(System.DBNull.Value))
            {
                dracc_expense.ExpenseDate = Convert.ToDateTime(dr["ExpenseDate"]);
            }
            if (!dr["ExpenseType"].Equals(System.DBNull.Value))
            {
                dracc_expense.ExpenseType = Convert.ToString(dr["ExpenseType"]);
            }
            if (!dr["Amount"].Equals(System.DBNull.Value))
            {
                dracc_expense.Amount = Convert.ToDecimal(dr["Amount"]);
            }
            if (!dr["TagName"].Equals(System.DBNull.Value))
            {
                dracc_expense.TagName = Convert.ToString(dr["TagName"]);
            }
            if (!dr["Remarks"].Equals(System.DBNull.Value))
            {
                dracc_expense.Remarks = Convert.ToString(dr["Remarks"]);
            }
            if (!dr["Hospital"].Equals(System.DBNull.Value))
            {
                dracc_expense.Hospital = Convert.ToString(dr["Hospital"]);
            }

            objAcc_Expense.dt_ACC_Expense_Hospital.Rows.Add(dracc_expense);
        }
        SetReportParamater();
        this.rvExpenseReport.LocalReport.DataSources.Clear();
        this.rvExpenseReport.LocalReport.DataSources.Add(new ReportDataSource("ACC_Expense_Hospital_Wise", (DataTable)objAcc_Expense.dt_ACC_Expense_Hospital));
        this.rvExpenseReport.LocalReport.Refresh();

    }
    #endregion FillDataSet

    #region SetReportParameters
    protected void SetReportParamater()
    {
        String ReportTitle = "Hospital Wise Expense List";
        ReportParameter rptReportTitle = new ReportParameter("ReportTitle", ReportTitle);
        this.rvExpenseReport.LocalReport.SetParameters(new ReportParameter[] { rptReportTitle });
    }
    #endregion SetReportParameters

    #region 15.1 Button Search Click Event

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Search();
    }

    #endregion 15.1 Button Search Click Event


    protected void Search()
    {
        #region Parameters
        SqlDateTime FromDate = SqlDateTime.Null;
        SqlDateTime ToDate = SqlDateTime.Null;
        SqlInt32 HospitaID = SqlInt32.Null;

        #endregion Parameters

        #region Gather Data

        #region NavigateLogic

        if (dtpFromDate.Text.Trim() != String.Empty)
            FromDate = Convert.ToDateTime(dtpFromDate.Text.Trim().ToString());

        if (dtpToDate.Text.Trim() != String.Empty)
            ToDate = Convert.ToDateTime(dtpToDate.Text.Trim().ToString());

        #endregion NavigateLogic


        #endregion Gather Data

        ACC_ExpenseBAL balACC_Expense = new ACC_ExpenseBAL();

        DataTable dt = balACC_Expense.SelectHospitalWiseExpenseList(FromDate, ToDate, HospitaID);

        /*        var groupedData = dt.AsEnumerable()
             .GroupBy(row => row.Field<DateTime>("ExpenseDate"))
             .Select(g => new
             {
                 ExpenseDate = g.Key,
                 Details = g.CopyToDataTable()
             }).ToList();*/
        if (dt != null && dt.Rows.Count > 0)
        {
            var groupedData = dt.AsEnumerable()
            .GroupBy(row => row.Field<DateTime>("ExpenseDate"))
            .Select(g => new
            {
                ExpenseDate = g.Key,
                Details = g.CopyToDataTable(),
                TotalAmount = g.Sum(row => row.Field<decimal>("Amount"))
            }).ToList();
            Div_SearchResult.Visible = true;
            //Div_ExportOption.Visible = true;
            rpData.DataSource = groupedData;
            rpData.DataBind();

            ShowReport();

            //  lblRecordInfoBottom.Text = String.Empty;
            lblRecordInfoTop.Text = String.Empty;

        }
        else
        {
            rpData.DataSource = null;
            rpData.DataBind();
            // lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
            lblRecordInfoTop.Text = CommonMessage.NoRecordFound();
            ShowReport();
            Div_SearchResult.Visible = false;
            ucMessage.ShowError(CommonMessage.NoRecordFound());
        }
    }

    //protected void rptGroupedExpenses_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        var dataItem = (dynamic)e.Item.DataItem;
    //        var expenseDate = dataItem.ExpenseDate;
    //        var dtDetails = dataItem.Details;

    //        var rptExpenses = (Repeater)e.Item.FindControl("rptExpenses");
    //        rptExpenses.DataSource = dtDetails;
    //        rptExpenses.DataBind();
    //    }
    //}

    protected void rptGroupedExpenses_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var dataItem = (dynamic)e.Item.DataItem;
            var expenseDate = dataItem.ExpenseDate;
            var dtDetails = dataItem.Details;

            var rptExpenses = (Repeater)e.Item.FindControl("rptExpenses");
            rptExpenses.DataSource = dtDetails;
            rptExpenses.DataBind();

            Label lblTotalAmount = (Label)e.Item.FindControl("lblTotalAmount");
            lblTotalAmount.Text = string.Format(CV.DefaultCurrencyFormatWithDecimalPoint, dataItem.TotalAmount);
        }
    }


    #region 19.0 Export Data

    #region 19.1 Excel Export Button Click Event

    protected void lbtnExport_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)(sender);
        String ExportType = lbtn.CommandArgument.ToString();
        #region Parameters

        SqlDateTime FromDate = SqlDateTime.Null;
        SqlDateTime ToDate = SqlDateTime.Null;
        SqlInt32 HospitalID = SqlInt32.Null;

        #endregion Parameters

        #region Gather Data

        if (dtpFromDate.Text.Trim() != String.Empty)
            FromDate = Convert.ToDateTime(dtpFromDate.Text);

        if (dtpFromDate.Text.Trim() != String.Empty)
            ToDate = Convert.ToDateTime(dtpToDate.Text);


        #endregion Gather Data

        ACC_ExpenseBAL balACC_Expense = new ACC_ExpenseBAL();

        dtACC_Expense = balACC_Expense.SelectHospitalWiseExpenseList(FromDate, ToDate, HospitalID);
        if (dtACC_Expense != null && dtACC_Expense.Rows.Count > 0)
        {
            ExportReport(ExportType);
        }
    }

    private void ExportReport(string format)
    {
        try
        {
            string mimeType, encoding, extension;
            Microsoft.Reporting.WebForms.Warning[] warnings;
            string[] streamIds;

            byte[] bytes = rvExpenseReport.LocalReport.Render(format,
                                                        null,
                                                        out mimeType,
                                                        out encoding,
                                                        out extension,
                                                        out streamIds,
                                                        out warnings);

            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("Content-Disposition", "attachment; filename=HospitalWiseExpenseList." + extension);
            Response.BinaryWrite(bytes);
            Response.End();

        }
        catch (Exception ex)
        {
            ucMessage.ShowError(format + " is Not Correct Format");
        }

    }

    #endregion 19.1 Excel Export Button Click Event

    #endregion 19.0 Export Data



    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControls();
    }

    #region 22.0 ClearControls
    private void ClearControls()
    {
        dtpFromDate.Text = String.Empty;
        dtpToDate.Text = String.Empty;
    }

    #endregion 22.0 ClearControls
}