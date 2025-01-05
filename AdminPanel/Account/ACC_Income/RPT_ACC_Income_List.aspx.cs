using GNForm3C.BAL;
using GNForm3C;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using System.Data.SqlTypes;

public partial class AdminPanel_Account_ACC_Income_RPT_ACC_Income_List : System.Web.UI.Page
{

    #region Privete variable
    private DataTable dataTableobj = new DataTable();
    private ACC_Income_Dataset dataSetobj = new ACC_Income_Dataset();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ShowReport();
            Search();

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Search();
    }

    protected void Search()
    {

        ACC_IncomeBAL aCC_IncomeBAL = new ACC_IncomeBAL();
        DataTable dt = aCC_IncomeBAL.Report_ACC_Income_ByFinYear();

        if (dt != null && dt.Rows.Count > 0)
        {
            Div_SearchResult.Visible = true;
            //Div_ExportOption.Visible = true;
            rpData.DataSource = dt;
            rpData.DataBind();

            ShowReport();

            lblRecordInfoBottom.Text = String.Empty;
            lblRecordInfoTop.Text = String.Empty;

        }
        else
        {
            rpData.DataSource = null;
            rpData.DataBind();
            lblRecordInfoBottom.Text = CommonMessage.NoRecordFound();
            lblRecordInfoTop.Text = CommonMessage.NoRecordFound();
            ShowReport();
            ucMessage.ShowError(CommonMessage.NoRecordFound());
        }
    }
    protected void ShowReport()
    {
        ACC_IncomeBAL aCC_IncomeBAL = new ACC_IncomeBAL();
        DataTable dt = aCC_IncomeBAL.Report_ACC_Income_ByFinYear();
        dataTableobj = dt.Copy();
        FillDataSet();

        /*
                #region FillDataSet

                foreach (DataRow dr in dataTableobj.Rows)
                {

                    ACC_Income_Dataset.dt_ACC_incomeRow drACC_Income = dataSetobj.dt_ACC_income.Newdt_ACC_incomeRow();

                    if (!dr["Hospital"].Equals(System.DBNull.Value))
                        drACC_Income.Hospital = Convert.ToString(dr["Hospital"]);

                    if (!dr["FinYearName"].Equals(System.DBNull.Value))
                        drACC_Income.FinYear = Convert.ToString(dr["FinYearName"]);

                    if (!dr["IncomeType"].Equals(System.DBNull.Value))
                        drACC_Income.IncomeType = Convert.ToString(dr["IncomeType"]);

                    if (!dr["IncomeDate"].Equals(System.DBNull.Value))
                        drACC_Income.IncomeDate = Convert.ToDateTime(dr["IncomeDate"]).ToString(CV.DefaultDateFormat);

                    if (!dr["Amount"].Equals(System.DBNull.Value))
                        drACC_Income.Amount = Convert.ToDecimal(dr["Amount"]);


                    dataSetobj.dt_ACC_income.Rows.Add(drACC_Income);
                }
                SetReportParamater();


                this.rvIncome.LocalReport.DataSources.Clear();
                this.rvIncome.LocalReport.DataSources.Add(new ReportDataSource("dt_ACC_income", (DataTable)dataSetobj.dt_ACC_income));
                this.rvIncome.LocalReport.Refresh();
                #endregion FillDataSet*/
    }

    protected void FillDataSet()
    {

        foreach (DataRow dr in dataTableobj.Rows)
        {

            ACC_Income_Dataset.dt_ACC_incomeRow drACC_Income = dataSetobj.dt_ACC_income.Newdt_ACC_incomeRow();

            if (!dr["Hospital"].Equals(System.DBNull.Value))
                drACC_Income.Hospital = Convert.ToString(dr["Hospital"]);

            if (!dr["FinYearName"].Equals(System.DBNull.Value))
                drACC_Income.FinYear = Convert.ToString(dr["FinYearName"]);

            if (!dr["IncomeType"].Equals(System.DBNull.Value))
                drACC_Income.IncomeType = Convert.ToString(dr["IncomeType"]);

            if (!dr["IncomeDate"].Equals(System.DBNull.Value))
                drACC_Income.IncomeDate = Convert.ToDateTime(dr["IncomeDate"]).ToString(CV.DefaultDateFormat);

            if (!dr["Amount"].Equals(System.DBNull.Value))
                drACC_Income.Amount = Convert.ToDecimal(dr["Amount"]);


            dataSetobj.dt_ACC_income.Rows.Add(drACC_Income);
        }
        SetReportParamater();


        this.rvIncome.LocalReport.DataSources.Clear();
        this.rvIncome.LocalReport.DataSources.Add(new ReportDataSource("dt_ACC_income", (DataTable)dataSetobj.dt_ACC_income));
        this.rvIncome.LocalReport.Refresh();
    }


    #region SetReportParamater
    protected void SetReportParamater()
    {
        String ReportTitle = "Income Report";
        ReportParameter rptReportTitle = new ReportParameter("ReportTitle", ReportTitle);
        this.rvIncome.LocalReport.SetParameters(new ReportParameter[] { rptReportTitle });
    }
    #endregion SetReportParamater




    #region 19.0 Export Data

    #region 19.1 Excel Export Button Click Event

    protected void lbtnExport_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)(sender);
        String ExportType = lbtn.CommandArgument.ToString();
        #region Parameters


        ACC_IncomeBAL aCC_IncomeBAL = new ACC_IncomeBAL();
        DataTable dt = aCC_IncomeBAL.Report_ACC_Income_ByFinYear();
/*        ACC_ExpenseBAL balACC_Expense = new ACC_ExpenseBAL();

        dtACC_Expense = balACC_Expense.SelectHospitalWiseExpenseList(FromDate, ToDate, HospitalID);*/
        if (dt != null && dt.Rows.Count > 0)
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

            byte[] bytes = rvIncome.LocalReport.Render(format,
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
}

#endregion