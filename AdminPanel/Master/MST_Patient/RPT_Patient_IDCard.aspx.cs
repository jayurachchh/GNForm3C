using GNForm3C;
using GNForm3C.BAL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_Patient_RPT_Patient_IDCard : System.Web.UI.Page
{
    #region private variable 
    DataTable dtMST_PatientICard = new DataTable("");
    private MST_Patient_IDCard objMst_PatientICard = new MST_Patient_IDCard();

    #endregion private variable 

    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ShowReport();
        }
    }

    #endregion Page Load Event

    #region ShowReport
    /*protected void ShowReport()
    {
        MST_PatientBAL balMST_PatientICard = new MST_PatientBAL();
        DataTable dt = balMST_PatientICard.RPT_PatientIDCard();
        dtMST_PatientICard = dt.Copy();
        FillDataSet();
    }*/
    protected void ShowReport()
    {
        try
        {
            SqlInt32 PatientID = SqlInt32.Null;
            if (Request.QueryString["PatientID"] != null && Request.QueryString["ReportType"] != null)
            {
                PatientID = CommonFunctions.DecryptBase64Int32(Request.QueryString["PatientID"]);
              //  string ReportType = CommonFunctions.DecryptBase64(Request.QueryString["ReportType"]);
                MST_PatientBAL balMST_Patient = new MST_PatientBAL();
                DataTable dt = balMST_Patient.RPT_PatientIDCard(PatientID);
                /*                if (dtMST_Patient != null && dtMST_Patient.Rows.Count > 0)
                                {
                                    FillDataSet(dtMST_Patient);
                                    FileName = dtMST_Patient.Rows[0]["PatientName"].ToString();
                                    FileName = Regex.Replace(FileName, @"\s+", "_");
                                }
                                ExportReport(ReportType.ToString());*/
                FillDataSet();
            }
            else
            {
                MST_PatientBAL balMST_Patient = new MST_PatientBAL();
                DataTable dt = balMST_Patient.RPT_PatientIDCard(PatientID);
                dtMST_PatientICard = dt.Copy();
                FillDataSet();
            }

        }
        catch (Exception ex)
        {

        }

    }

    #endregion ShowReport

    #region FillDataSet
    protected void FillDataSet()
    {
        foreach (DataRow dr in dtMST_PatientICard.Rows)
        {
            MST_Patient_IDCard.dt_MST_Patient_IDCardRow drMST_Patient = objMst_PatientICard.dt_MST_Patient_IDCard.Newdt_MST_Patient_IDCardRow();

            if (!dr["PatientID"].Equals(System.DBNull.Value))
            {
                drMST_Patient.PatientID = Convert.ToInt32(dr["PatientID"]);
            }
            if (!dr["PatientID"].Equals(System.DBNull.Value))
            {
                drMST_Patient.BarCode = CommonFunctions.GenerateBarcode(drMST_Patient.PatientID.ToString());
            }
            if (!dr["PatientName"].Equals(System.DBNull.Value))
            {
                drMST_Patient.PatientName = Convert.ToString(dr["PatientName"]);
            }
            if (!dr["DOB"].Equals(System.DBNull.Value))
            {
                drMST_Patient.DOB = Convert.ToDateTime(dr["DOB"]);
            }
            if (!dr["Age"].Equals(System.DBNull.Value))
            {
                drMST_Patient.Age = Convert.ToInt32(dr["Age"]);
            }
            if (!dr["MobileNo"].Equals(System.DBNull.Value))
            {
                drMST_Patient.MobileNo = Convert.ToString(dr["MobileNo"]);
            }
            if (!dr["PrimaryDesc"].Equals(System.DBNull.Value))
            {
                drMST_Patient.PrimaryDesc = Convert.ToString(dr["PrimaryDesc"]);
            }
            if (!dr["HospitalID"].Equals(System.DBNull.Value))
            {
                drMST_Patient.HospitalID = Convert.ToInt32(dr["HospitalID"]);
            }
            if (!dr["FinYearID"].Equals(System.DBNull.Value))
            {
                drMST_Patient.FinYearID = Convert.ToInt32(dr["FinYearID"]);
            }
            if (!dr["Hospital"].Equals(System.DBNull.Value))
            {
                drMST_Patient.Hospital = Convert.ToString(dr["Hospital"]);
            }
            if (!dr["FinYearName"].Equals(System.DBNull.Value))
            {
                drMST_Patient.FinYearName = Convert.ToString(dr["FinYearName"]);
            }
            if (!dr["PatientPhotoPath"].Equals(System.DBNull.Value))
                drMST_Patient.PatientImageB = CommonFunctions.ConvertImagePathToPngBytes(Convert.ToString(dr["PatientPhotoPath"]));
            else
                drMST_Patient.PatientImageB = CommonFunctions.ConvertImagePathToPngBytes(CV.DefaultNoImagePath);

            objMst_PatientICard.dt_MST_Patient_IDCard.Rows.Add(drMST_Patient);
        }
        SetReportParameters();
        this.rvPatientICard.LocalReport.DataSources.Clear();
        this.rvPatientICard.LocalReport.DataSources.Add(new ReportDataSource("dt_MST_Patient_IDCard", (DataTable)objMst_PatientICard.dt_MST_Patient_IDCard));
        this.rvPatientICard.LocalReport.Refresh();
    }
    #endregion FillDataSet
    #region SetReportParameters
    private void SetReportParameters()
    {
        String ReportTitle = "Patient IDCard";

        ReportParameter rptReportTitle = new ReportParameter("ReportTitle", ReportTitle);
        this.rvPatientICard.LocalReport.SetParameters(new ReportParameter[] { rptReportTitle });
    }
    #endregion SetReportParameters
}