using GNForm3C;
using GNForm3C.BAL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Account_ACC_Expense_ACC_HospitalWise_FinYearWise_IncomeExpense : System.Web.UI.Page
{
    #region Privete variable
    private DataTable dataTableobj = new DataTable();
    private ACC_IncomeExpense_HospitalWise_FinYearWise dataSetobj = new ACC_IncomeExpense_HospitalWise_FinYearWise();
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
        ACC_ExpenseLedgerBAL aCC_ExpenseLedgerBAL = new ACC_ExpenseLedgerBAL();
        //ACC_IncomeBAL aCC_IncomeBAL = new ACC_IncomeBAL();
        dataTableobj = aCC_ExpenseLedgerBAL.Report_HospitalWiseFinyearWiseIncomeExpense();
        #region FillDataSet

        foreach (DataRow dr in dataTableobj.Rows)
        { 
            ACC_IncomeExpense_HospitalWise_FinYearWise.dt_ACC_IncomeExpense_HospitalWise_FinyearWiseRow drACC_Income = dataSetobj.dt_ACC_IncomeExpense_HospitalWise_FinyearWise.Newdt_ACC_IncomeExpense_HospitalWise_FinyearWiseRow();

            if (!dr["FinYearName"].Equals(System.DBNull.Value))
                drACC_Income.FinYearName = Convert.ToString(dr["FinYearName"]);

            if (!dr["Hospital"].Equals(System.DBNull.Value))
                drACC_Income.Hospital = Convert.ToString(dr["Hospital"]);

            if (!dr["TotalIncome"].Equals(System.DBNull.Value))
                drACC_Income.TotalIncome = Convert.ToDecimal(dr["TotalIncome"]);

            if (!dr["TotalExpense"].Equals(System.DBNull.Value))
                drACC_Income.TotalExpense = Convert.ToDecimal(dr["TotalExpense"]);

            if (!dr["TotalPatients"].Equals(System.DBNull.Value))
                drACC_Income.TotalPatients = Convert.ToInt32(dr["TotalPatients"]);


            dataSetobj.dt_ACC_IncomeExpense_HospitalWise_FinyearWise.Rows.Add(drACC_Income);
        }
        SetReportParamater();

        this.rvIncomeExpense.LocalReport.DataSources.Clear();
        this.rvIncomeExpense.LocalReport.DataSources.Add(new ReportDataSource("dt_ACC_IncomeExpense_HospitalWise_FinYearWise", (DataTable)dataSetobj.dt_ACC_IncomeExpense_HospitalWise_FinyearWise));
        this.rvIncomeExpense.LocalReport.Refresh();
        #endregion FillDataSet
    }


    #region SetReportParamater
    protected void SetReportParamater()
    {
        String ReportTitle = "Financial Year Wise Hospital Wise Income Expense Report";
        String SubReportTitle = "HospitalWise FinYearWise";
        ReportParameter rptReportTitle = new ReportParameter("ReportTitle", ReportTitle);
        ReportParameter rptSubReportTitle = new ReportParameter("SubReportTitle", SubReportTitle);
        this.rvIncomeExpense.LocalReport.SetParameters(new ReportParameter[] { rptReportTitle,rptSubReportTitle });
    }
    #endregion SetReportParamater

}
