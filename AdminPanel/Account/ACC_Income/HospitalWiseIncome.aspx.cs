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

public partial class AdminPanel_Account_ACC_Income_HospitalWiseIncome : System.Web.UI.Page
{
    #region Privete variable
    private DataTable dataTableobj = new DataTable();
    private ACC_Income_Dataset dataSetobj = new ACC_Income_Dataset();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowReport();
        }
    }

    protected void ShowReport()
    {
        ACC_IncomeBAL aCC_IncomeBAL = new ACC_IncomeBAL();
        dataTableobj = aCC_IncomeBAL.Report_ACC_Income_ByFinYear();
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
        

        this.rvhsIncome.LocalReport.DataSources.Clear();
        this.rvhsIncome.LocalReport.DataSources.Add(new ReportDataSource("dt_ACC_income", (DataTable)dataSetobj.dt_ACC_income));
        this.rvhsIncome.LocalReport.Refresh();
        #endregion FillDataSet
    }


    #region SetReportParamater 

    protected void SetReportParamater()
    {
        String ReportTitle = "HospitalIncome";
        ReportParameter rptReportTitle = new ReportParameter("ReportTitle", ReportTitle);
        this.rvhsIncome.LocalReport.SetParameters(new ReportParameter[] { rptReportTitle });
    }
    #endregion SetReportParamater
}