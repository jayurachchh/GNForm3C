﻿using GNForm3C;
using GNForm3C.BAL;
using GNForm3C.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_MasterDashboard : System.Web.UI.Page
{
    #region  10.0 Local Variables
    decimal EtotalJan = 0;
    decimal EtotalFeb = 0;
    decimal EtotalMar = 0;
    decimal EtotalApr = 0;
    decimal EtotalMay = 0;
    decimal EtotalJun = 0;
    decimal EtotalJul = 0;
    decimal EtotalAug = 0;
    decimal EtotalSep = 0;
    decimal EtotalOct = 0;
    decimal EtotalNov = 0;
    decimal EtotalDec = 0;
    decimal ItotalJan = 0;
    decimal ItotalFeb = 0;
    decimal ItotalMar = 0;
    decimal ItotalApr = 0;
    decimal ItotalMay = 0;
    decimal ItotalJun = 0;
    decimal ItotalJul = 0;
    decimal ItotalAug = 0;
    decimal ItotalSep = 0;
    decimal ItotalOct = 0;
    decimal ItotalNov = 0;
    decimal ItotalDec = 0;

    static Int32 PageRecordSize = CV.PageRecordSize;//Size of record per page

    #endregion 10.0 Variables

    #region 11.0 Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 11.1 Check User Login

        if (Session["UserID"] == null)
            Response.Redirect(CV.LoginPageURL);

        #endregion 11.1 Check User Login 

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["HospitalID"] != null)
            {
                btnShow_Click(sender, e);
            }

            #region 11.2 DropDown List Fill Section
            FillDropDownList();

            #endregion 11.2 DropDown List Fill Section
           
            #region 11.3 Set Help Text

            ucHelp.ShowHelp("Help Text will be shown here");

            #endregion 11.3 Set Help Text 
        }

    }
    #endregion 11.0 Page Load

    #region 12.0 Fill DropDownList
    private void FillDropDownList()
    {
        CommonFillMethods.FillDropDownListHospitalID(ddlHospitalID);
    }
    #endregion 12.0 Fill DropDownList

    #region 13.0 Show Button Event
    protected void btnShow_Click(object sender, EventArgs e)
    {
        SqlInt32 HospitalID = SqlInt32.Null;
        //SqlInt32 TreatmentID = SqlInt32.Null;

        #region 13.1 NavigateLogic
        if (Request.QueryString["HospitalID"] != null )
        {
            if (!Page.IsPostBack)
            {
                HospitalID = CommonFunctions.DecryptBase64Int32(Request.QueryString["HospitalID"]);
               // TreatmentID = CommonFunctions.DecryptBase64Int32(Request.QueryString["TreatmentID"]);
            }
            else
            {
                if (ddlHospitalID.SelectedIndex > 0)
                    HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);
            }
        }
        else
        {
            if (ddlHospitalID.SelectedIndex > 0)
                HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);
            else
            {
                lblIncomeTotal.Text = "0";
                lblExpenseTotal.Text = "0";
                lblPatientTotal.Text = "0";
            }
        }
        #endregion 13.1 NavigateLogic

        #region 13.2 Total Income/Expense
        MST_DEF_HospitalSumBALBase mST_DEF_HospitalSumBALBase = new MST_DEF_HospitalSumBALBase();
        DataTable dtSum = mST_DEF_HospitalSumBALBase.SelectHospitalWiseSum(HospitalID);

        decimal totalIncome = Convert.ToDecimal(dtSum.Rows[0]["TotalIncome"]);
        decimal totalExpense = Convert.ToDecimal(dtSum.Rows[0]["TotalExpense"]);
        int totalPatients = Convert.ToInt32(dtSum.Rows[0]["TotalPatient"]);

        string formattedTotalIncome = string.Format(GNForm3C.CV.DefaultCurrencyFormatWithDecimalPoint, totalIncome);
        string formattedTotalExpense = string.Format(GNForm3C.CV.DefaultCurrencyFormatWithDecimalPoint, totalExpense);
        string formattedTotalPatients = string.Format(GNForm3C.CV.DefaultCountFormatWithIntPoint, totalPatients);

        lblIncomeTotal.Text=formattedTotalIncome;
        lblExpenseTotal.Text=formattedTotalExpense;
        lblPatientTotal.Text = formattedTotalPatients;
        

        // Show the UpdatePanel
        pnlsum.Visible = true;

        #endregion 13.2 Total Income/Expense

        #region 13.3 Day Wise Month Wise Income/Expense/Patients Count

        #region 13.3.1 Day Wise Month Wise Income summary
        if (totalIncome > 0)
        {
            DataTable dtDayWiseMonthWiseIncome = mST_DEF_HospitalSumBALBase.SelectDayWiseMonthWiseIncome(HospitalID);
            IncomeList.DataSource = dtDayWiseMonthWiseIncome;
            IncomeList.DataBind();
            lblNoIncomeRecords.Visible = false;
            IncomeList.Visible = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "collapsePanel2", "togglePanel('#Panel1', true);", true);
            lblNoIncomeRecords.Visible = true;
            IncomeList.Visible = false;
        }

        pnlmonincm.Visible = true;
        #endregion

        #region 13.3.2 Day Wise Month Wise Expense summary
        if (totalExpense > 0)
        {
            DataTable dtDayWiseMonthWiseExpense = mST_DEF_HospitalSumBALBase.SelectDayWiseMonthWiseExpense(HospitalID);
            ExpenseList.DataSource = dtDayWiseMonthWiseExpense;
            ExpenseList.DataBind();
            lblNoExpenseRecords.Visible = false;
            ExpenseList.Visible = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "collapsePanel2", "togglePanel('#Panel2', true);", true);
            lblNoExpenseRecords.Visible = true;
            ExpenseList.Visible = false;
        }

        pnlmonexp.Visible = true;
        #endregion

        #region 13.3.3 Day Wise Month Wise TreatmentWise Summary 

        /*        if (totalPatients > 0)
                {

                    DataTable dtTreatmentWiseSummary = mST_DEF_HospitalSumBALBase.SelectHospitalWiseTreatmentSummary(HospitalID);

                    TreatmentWiseSummary.DataSource = dtTreatmentWiseSummary;
                    TreatmentWiseSummary.DataBind();
                    lblNoPatientsRecords.Visible = false;
                    TreatmentWiseSummary.Visible = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "collapsePanel2", "togglePanel('#Panel3', true);", true);
                    lblNoPatientsRecords.Visible = true;
                    TreatmentWiseSummary.Visible = false;
                }
                pnltreatsumry.Visible = true;*/

        if (totalPatients > 0)
        {
            DataTable dtTreatmentWiseSummary = mST_DEF_HospitalSumBALBase.SelectHospitalWiseTreatmentSummary(HospitalID);
            TreatmentWiseSummaryRepeater.DataSource = dtTreatmentWiseSummary;
            TreatmentWiseSummaryRepeater.DataBind();

            foreach (RepeaterItem rpcount in TreatmentWiseSummaryRepeater.Items)
            {
                HyperLink hlPatientCount = (HyperLink)rpcount.FindControl("hlPatientCount");
                if (hlPatientCount.Text.Trim() == "0")
                {
                    hlPatientCount.NavigateUrl = null;
                }

            }

            lblNoPatientsRecords.Visible = false;
            TreatmentWiseSummaryRepeater.Visible = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "collapsePanel3", "togglePanel('#Panel3', true);", true);
            lblNoPatientsRecords.Visible = true;
            TreatmentWiseSummaryRepeater.Visible = false;
        }

        Panel3.Visible = true;

        #endregion

        #endregion 13.3 Day Wise Month Wise Income/Expense Patient Count


    }
    #endregion 13.0 Show Button Event

    #region 14.0 GridView Row Data Bound for Expense
    protected void IncomeList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ItotalJan += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Jan"));
            ItotalFeb += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Feb"));
            ItotalMar += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Mar"));
            ItotalApr += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Apr"));
            ItotalMay += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "May"));
            ItotalJun += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Jun"));
            ItotalJul += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Jul"));
            ItotalAug += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Aug"));
            ItotalSep += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Sep"));
            ItotalOct += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Oct"));
            ItotalNov += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Nov"));
            ItotalDec += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Dec"));
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "  Total  ";
            e.Row.Cells[1].Text = ItotalJan.ToString("C");
            e.Row.Cells[2].Text = ItotalFeb.ToString("C");
            e.Row.Cells[3].Text = ItotalMar.ToString("C");
            e.Row.Cells[4].Text = ItotalApr.ToString("C");
            e.Row.Cells[5].Text = ItotalMay.ToString("C");
            e.Row.Cells[6].Text = ItotalJun.ToString("C");
            e.Row.Cells[7].Text = ItotalJul.ToString("C");
            e.Row.Cells[8].Text = ItotalAug.ToString("C");
            e.Row.Cells[9].Text = ItotalSep.ToString("C");
            e.Row.Cells[10].Text = ItotalOct.ToString("C");
            e.Row.Cells[11].Text = ItotalNov.ToString("C");
            e.Row.Cells[12].Text = ItotalDec.ToString("C");
        }
    }
    #endregion 14.0 GridView Row Data Bound

    #region 15.0 GridView Row Data Bound for Expense
    protected void ExpenseList_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            EtotalJan += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Jan"));
            EtotalFeb += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Feb"));
            EtotalMar += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Mar"));
            EtotalApr += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Apr"));
            EtotalMay += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "May"));
            EtotalJun += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Jun"));
            EtotalJul += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Jul"));
            EtotalAug += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Aug"));
            EtotalSep += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Sep"));
            EtotalOct += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Oct"));
            EtotalNov += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Nov"));
            EtotalDec += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Dec"));
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "  Total  ";
            e.Row.Cells[1].Text = EtotalJan.ToString("C");
            e.Row.Cells[2].Text = EtotalFeb.ToString("C");
            e.Row.Cells[3].Text = EtotalMar.ToString("C");
            e.Row.Cells[4].Text = EtotalApr.ToString("C");
            e.Row.Cells[5].Text = EtotalMay.ToString("C");
            e.Row.Cells[6].Text = EtotalJun.ToString("C");
            e.Row.Cells[7].Text = EtotalJul.ToString("C");
            e.Row.Cells[8].Text = EtotalAug.ToString("C");
            e.Row.Cells[9].Text = EtotalSep.ToString("C");
            e.Row.Cells[10].Text = EtotalOct.ToString("C");
            e.Row.Cells[11].Text = EtotalNov.ToString("C");
            e.Row.Cells[12].Text = EtotalDec.ToString("C");
        }
    }
    #endregion 15.0 GridView Row Data Bound

}