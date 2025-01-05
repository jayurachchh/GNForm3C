﻿
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using GNForm3C.BAL;
using GNForm3C.ENT;
using GNForm3C;
using System.Data.SqlTypes;
using System.Collections.Generic;
using System.Globalization;

public partial class AdminPanel_Account_ACC_Income_ACC_IncomeAddEditMany : System.Web.UI.Page
{
    #region 10.0 Local Variables

    String FormName = "ACC_IncomeAddEdit";

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

            #region 11.2 Fill Labels

            FillLabels(FormName);

            #endregion 11.2 Fill Labels

            #region 11.3 DropDown List Fill Section

            CommonFillMethods.FillDropDownListHospitalID(ddlHospitalID);

            #endregion 11.3 DropDown List Fill Section

            #region 11.4 Set Control Default Value

            lblFormHeader.Text = CV.PageHeaderMany + " Income";
            upr.DisplayAfter = CV.UpdateProgressDisplayAfter;


            #endregion 11.4 Set Control Default Value
        }
    }

    #endregion Pageload

    #region 12.0 FillLabels
    private void FillLabels(String FormName)
    {
    }

    #endregion 12.0 FillLabels

    #region 13.0 Fill DropDownList
    private void FillDropDownList()
    {
        CommonFillMethods.FillDropDownListHospitalID(ddlHospitalID);
    }

    #endregion 13.0 Fill DropDownList

    #region 14.0 Show Button Event
    protected void btnShow_Click(object sender, EventArgs e)
    {
        SqlInt32 HospitalID = SqlInt32.Null;

        #region NavigateLogic
        if (Request.QueryString["HospitalID"] != null)
        {
            if (!Page.IsPostBack)
            {
                HospitalID = CommonFunctions.DecryptBase64Int32(Request.QueryString["HospitalID"]);
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
        }
        #endregion NavigateLogic

        ACC_IncomeBAL balACC_Income = new ACC_IncomeBAL();

        DataTable dt = balACC_Income.SelectShowByHospital(HospitalID);

        if (Request.QueryString["HospitalID"] != null)
            ddlHospitalID.SelectedValue = CommonFunctions.DecryptBase64(Request.QueryString["HospitalID"]);

        foreach (DataColumn dtc in dt.Columns)
        {
            dtc.AutoIncrement = false;
            dtc.AllowDBNull = true;
        }
        dt.AcceptChanges();

        int count = 10 - dt.Rows.Count;
        for (int i = 1; i <= count; i++)
        {
            dt.Rows.Add();
        }

        rpData.DataSource = dt;
        rpData.DataBind();
        Div_ShowResult.Visible = true;

    }

    #endregion 14.0 Show Button Event

    #region 15.0 Save Button Event
   
   
    /*    protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                SqlInt32 HospitalID = SqlInt32.Null;
                if (ddlHospitalID.SelectedIndex > 0)
                    HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);

                ACC_IncomeBAL balACC_Income = new ACC_IncomeBAL();
                ACC_IncomeENT entACC_Income = new ACC_IncomeENT();

                foreach (RepeaterItem items in rpData.Items)
                {
                    try
                    {
                        #region FindControl

                        DropDownList ddlFinYearID = (DropDownList)items.FindControl("ddlFinYearID");
                        DropDownList ddlIncomeTypeID = (DropDownList)items.FindControl("ddlIncomeTypeID");

                        var dtpIncomeDate = (TextBox)items.FindControl("txtIncomeDate");

                        TextBox txtAmount = (TextBox)items.FindControl("txtAmount");
                        HiddenField Hdfiled = (HiddenField)items.FindControl("hdIncomeID");
                        TextBox txtNote = (TextBox)items.FindControl("txtNote");
                        CheckBox chkIsSelected = (CheckBox)items.FindControl("chkIsSelected");


                        #endregion FindControl

                        #region 15.1.1 Gather Data

                        entACC_Income.HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);
                        entACC_Income.FinYearID = Convert.ToInt32(ddlFinYearID.SelectedValue);
                        entACC_Income.IncomeTypeID = Convert.ToInt32(ddlIncomeTypeID.SelectedValue);
                        entACC_Income.IncomeDate = Convert.ToDateTime(dtpIncomeDate.Text);
                        entACC_Income.Amount = Convert.ToDecimal(txtAmount.Text);
                        entACC_Income.Note = Convert.ToString(txtNote.Text);
                        entACC_Income.UserID = Convert.ToInt32(Session["UserID"]);
                        entACC_Income.Created = DateTime.Now;
                        entACC_Income.Modified = DateTime.Now;

                        #endregion 15.1.1 Gather Data

                        if (Hdfiled.Value != string.Empty)
                        {
                            if (chkIsSelected.Checked)
                            {
                                #region 15.1.2 Update Data
                                if (ddlIncomeTypeID.Text.Trim() == string.Empty)
                                {
                                    ddlIncomeTypeID.Focus();
                                    ucMessage.ShowError("Enter Income Type");
                                    break;
                                }
                                else
                                {
                                    entACC_Income.IncomeID = Convert.ToInt32(Hdfiled.Value);
                                    if (balACC_Income.Update(entACC_Income))
                                    {
                                        ucMessage.ShowSuccess(CommonMessage.RecordUpdated());
                                    }
                                }

                                #endregion 15.1.2 Update Data
                            }
                            else
                            {
                                #region 15.1.3 Delete Data
                                if (ddlIncomeTypeID.Text.Trim() == string.Empty)
                                {
                                    ddlIncomeTypeID.Focus();
                                    ucMessage.ShowError("Enter Income Type");
                                    break;
                                }
                                else
                                {
                                    entACC_Income.IncomeID = Convert.ToInt32(Hdfiled.Value);
                                    if (balACC_Income.Delete(entACC_Income.IncomeID))
                                    {
                                        ucMessage.ShowSuccess(CommonMessage.DeletedRecord());
                                    }
                                }

                                #endregion 15.1.3 Delete Data
                            }
                        }
                        else
                        {
                            if (chkIsSelected.Checked)
                            {
                                #region 15.1.4 Insert Data
                                if (ddlIncomeTypeID.Text.Trim() == string.Empty && txtAmount.Text.Trim() != string.Empty)
                                {
                                    ddlIncomeTypeID.Focus();
                                    ucMessage.ShowError("Enter Income Type");
                                }
                                else
                                {
                                    if (ddlIncomeTypeID.Text.Trim() != string.Empty)
                                    {
                                        if (balACC_Income.Insert(entACC_Income))
                                        {
                                            Div_ShowResult.Visible = false;
                                            ucMessage.ShowSuccess(CommonMessage.RecordSaved());
                                        }
                                    }
                                }
                                #endregion  15.1.4 Insert Data
                            }
                        }
                        Div_ShowResult.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        ucMessage.ShowError(ex.Message);
                    }
                }
                ClearControls();
            }
        }*/
  

 
    /*    protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                SqlInt32 HospitalID = SqlInt32.Null;
              //  bool IsValidData = true;
                if (ddlHospitalID.SelectedIndex > 0)
                    HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);

                ACC_IncomeBAL balACC_Income = new ACC_IncomeBAL();
                ACC_IncomeENT entACC_Income = new ACC_IncomeENT();

                DataTable dtIncomeTable = new DataTable();
                dtIncomeTable.Columns.Add("IncomeID", typeof(SqlInt32));
                dtIncomeTable.Columns.Add("IncomeTypeID", typeof(SqlInt32));
                dtIncomeTable.Columns.Add("Amount", typeof(SqlDecimal));
                dtIncomeTable.Columns.Add("IncomeDate", typeof(SqlDateTime));
                dtIncomeTable.Columns.Add("Note", typeof(SqlString));
                //dtIncomeTable.Columns.Add("Remarks", typeof(SqlString));
                dtIncomeTable.Columns.Add("HospitalID", typeof(SqlInt32));
                dtIncomeTable.Columns.Add("FinYearID", typeof(SqlInt32));
                dtIncomeTable.Columns.Add("UserID", typeof(SqlInt32));
                dtIncomeTable.Columns.Add("Created", typeof(SqlDateTime));
                dtIncomeTable.Columns.Add("Modified", typeof(SqlDateTime));
                dtIncomeTable.Columns.Add("Operation", typeof(string)); // 'I', 'U', or 'D'

                try
                {
                    foreach (RepeaterItem items in rpData.Items)
                    {

                        #region FindControl

                        var ddlFinYearID = (DropDownList)items.FindControl("ddlFinYearID");
                        var ddlIncomeTypeID = (DropDownList)items.FindControl("ddlIncomeTypeID");
                        var dtpIncomeDate = (TextBox)items.FindControl("dtpIncomeDate");

                        TextBox txtAmount = (TextBox)items.FindControl("txtAmount");
                        HiddenField Hdfiled = (HiddenField)items.FindControl("hdIncomeID");
                        TextBox txtNote = (TextBox)items.FindControl("txtNote");
                        CheckBox chkIsSelected = (CheckBox)items.FindControl("chkIsSelected");

                        #endregion FindControl

                        #region 15.1.1 Gather Data
                        if (chkIsSelected.Checked)
                        {

                            String ErrorMsg = String.Empty;
                            if (ddlFinYearID.SelectedIndex == 0)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("FInYear");

                            if (ddlIncomeTypeID.SelectedIndex == 0)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("IncomeType");

                            if (dtpIncomeDate.Text.ToString().Trim() == String.Empty)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredField("IncomeDate");

                            if (txtAmount.Text.Trim() == String.Empty)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Amount");

                            if (ErrorMsg != String.Empty)
                            {
                                ErrorMsg = CommonMessage.ErrorPleaseCorrectFollowing() + ErrorMsg;
                                ucMessage.ShowError(ErrorMsg);
                                ddlFinYearID.Focus();
                                Div_ShowResult.Visible = true;
                                return;
                            }


                            entACC_Income.HospitalID = HospitalID;
                            entACC_Income.FinYearID = Convert.ToInt32(ddlFinYearID.SelectedValue);
                            entACC_Income.IncomeTypeID = Convert.ToInt32(ddlIncomeTypeID.SelectedValue);
                            entACC_Income.IncomeDate = Convert.ToDateTime(dtpIncomeDate.Text);
                            entACC_Income.Amount = Convert.ToDecimal(txtAmount.Text);
                            entACC_Income.Note = txtNote.Text != string.Empty ? Convert.ToString(txtNote.Text) : SqlString.Null;
                            entACC_Income.UserID = Convert.ToInt32(Session["UserID"]);
                            entACC_Income.Created = DateTime.Now;
                            entACC_Income.Modified = DateTime.Now;
                           // entACC_Income.Remarks = SqlString.Null;
                        }
                        #endregion 15.1.1 Gather Data

                        if (Hdfiled.Value != string.Empty)
                        {
                            if (chkIsSelected.Checked)
                            {
                                #region 15.1.2 Update Data

                                if (entACC_Income.IncomeDate.ToString() == string.Empty)
                                {
                                    ddlIncomeTypeID.Focus();
                                    ucMessage.ShowError("Enter IncomeDate");
                                    return;
                                }
                                else
                                {
                                    entACC_Income.IncomeID = Convert.ToInt32(Hdfiled.Value);
                                    dtIncomeTable.Rows.Add(
                                        entACC_Income.IncomeID,
                                        entACC_Income.IncomeTypeID,
                                        entACC_Income.Amount,
                                        entACC_Income.IncomeDate,
                                        entACC_Income.Note,
                                     //   entACC_Income.Remarks,
                                        entACC_Income.HospitalID,
                                        entACC_Income.FinYearID,
                                        entACC_Income.UserID,
                                        entACC_Income.Created,
                                        entACC_Income.Modified,
                                        "U"
                                    );
                                    //if (balACC_Income.Update(entACC_Income))
                                    //{
                                    //    ucMessage.ShowSuccess(CommonMessage.RecordUpdated());
                                    //}
                                }

                                #endregion 15.1.2 Update Data
                            }
                            else
                            {
                                #region 15.1.3 Delete Data
                                if (ddlIncomeTypeID.Text.Trim() == string.Empty)
                                {
                                    ddlIncomeTypeID.Focus();
                                    ucMessage.ShowError("Enter Income Type");
                                   // IsValidData = false;
                                    return;
                                }
                                else
                                {
                                    entACC_Income.IncomeID = Convert.ToInt32(Hdfiled.Value);
                                    dtIncomeTable.Rows.Add(
                                        entACC_Income.IncomeID,
                                        entACC_Income.IncomeTypeID,
                                        entACC_Income.Amount,
                                        entACC_Income.IncomeDate,
                                        entACC_Income.Note,
                                       // entACC_Income.Remarks,
                                        entACC_Income.HospitalID,
                                        entACC_Income.FinYearID,
                                        entACC_Income.UserID,
                                        entACC_Income.Created,
                                        entACC_Income.Modified,
                                        "D"
                                    );
                                    //if (balACC_Income.Delete(entACC_Income.IncomeID))
                                    //{
                                    //    ucMessage.ShowSuccess(CommonMessage.DeletedRecord());
                                    //}
                                }

                                #endregion 15.1.3 Delete Data
                            }
                        }
                        else
                        {

                            if (chkIsSelected.Checked)
                            {
                                #region 15.1.4 Insert Data
                                if (ddlIncomeTypeID.Text.Trim() == string.Empty && txtAmount.Text.Trim() != string.Empty)
                                {
                                    ddlIncomeTypeID.Focus();
                                    ucMessage.ShowError("Enter Income Type");
                                }
                                else
                                {
                                    if (ddlIncomeTypeID.Text.Trim() != string.Empty)
                                    {


                                        dtIncomeTable.Rows.Add(
                                            entACC_Income.IncomeID,
                                            entACC_Income.IncomeTypeID,
                                            entACC_Income.Amount,
                                            entACC_Income.IncomeDate,
                                            entACC_Income.Note,
                                           // entACC_Income.Remarks,
                                            entACC_Income.HospitalID,
                                            entACC_Income.FinYearID,
                                            entACC_Income.UserID,
                                            entACC_Income.Created,
                                            entACC_Income.Modified,
                                            "I"
                                        );
                                        //if (balACC_Income.Insert(entACC_Income))
                                        //{
                                        //    Div_ShowResult.Visible = false;
                                        //    ucMessage.ShowSuccess(CommonMessage.RecordSaved());
                                        //}
                                    }
                                }
                                #endregion  15.1.4 Insert Data
                            }
                        }
                        Div_ShowResult.Visible = false;
                    }

                    if (balACC_Income.Upsert(dtIncomeTable))
                    {
                        Div_ShowResult.Visible = false;
                        ucMessage.ShowSuccess(CommonMessage.RecordSaved());
                        ClearControls();
                    }
                }
                catch (Exception ex)
                {
                    ucMessage.ShowError(ex.Message);
                }
            }
        }*/


 
    /*    protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                SqlInt32 HospitalID = SqlInt32.Null;
                if (ddlHospitalID.SelectedIndex > 0)
                    HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);

                ACC_IncomeBAL balACC_Income = new ACC_IncomeBAL();
                ACC_IncomeENT entACC_Income = new ACC_IncomeENT();

                System.Text.StringBuilder xmlBuilder = new System.Text.StringBuilder();
                xmlBuilder.Append("<IncomeList>");

                try
                {
                    foreach (RepeaterItem items in rpData.Items)
                    {
                        #region FindControl
                        var ddlFinYearID = (DropDownList)items.FindControl("ddlFinYearID");
                        var ddlIncomeTypeID = (DropDownList)items.FindControl("ddlIncomeTypeID");
                        var dtpIncomeDate = (TextBox)items.FindControl("dtpIncomeDate");
                        TextBox txtAmount = (TextBox)items.FindControl("txtAmount");
                        HiddenField Hdfiled = (HiddenField)items.FindControl("hdIncomeID");
                        TextBox txtNote = (TextBox)items.FindControl("txtNote");
                        CheckBox chkIsSelected = (CheckBox)items.FindControl("chkIsSelected");
                        #endregion FindControl

                        #region 15.1.1 Gather Data
                        if (chkIsSelected.Checked)
                        {
                            String ErrorMsg = String.Empty;
                            if (ddlFinYearID.SelectedIndex == 0)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("FinYear");

                            if (ddlIncomeTypeID.SelectedIndex == 0)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("IncomeType");

                            if (dtpIncomeDate.Text.Trim() == String.Empty)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredField("IncomeDate");

                            if (txtAmount.Text.Trim() == String.Empty)
                                ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Amount");

                            if (ErrorMsg != String.Empty)
                            {
                                ErrorMsg = CommonMessage.ErrorPleaseCorrectFollowing() + ErrorMsg;
                                ucMessage.ShowError(ErrorMsg);
                                ddlFinYearID.Focus();
                                Div_ShowResult.Visible = true;
                                return;
                            }

                            entACC_Income.HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);
                            entACC_Income.FinYearID = Convert.ToInt32(ddlFinYearID.SelectedValue);
                            entACC_Income.IncomeTypeID = Convert.ToInt32(ddlIncomeTypeID.SelectedValue);
                            entACC_Income.IncomeDate = Convert.ToDateTime(dtpIncomeDate.Text);
                            entACC_Income.Amount = Convert.ToDecimal(txtAmount.Text);
                            entACC_Income.Note = Convert.ToString(txtNote.Text);
                            entACC_Income.UserID = Convert.ToInt32(Session["UserID"]);
                            entACC_Income.Created = DateTime.Now;
                            entACC_Income.Modified = DateTime.Now;

                            xmlBuilder.Append("<Income>");
                            xmlBuilder.Append("<IncomeID>").Append(Hdfiled.Value).Append("</IncomeID>");
                            xmlBuilder.Append("<IncomeTypeID>").Append(entACC_Income.IncomeTypeID).Append("</IncomeTypeID>");
                            xmlBuilder.Append("<Amount>").Append(entACC_Income.Amount).Append("</Amount>");
                            xmlBuilder.Append("<IncomeDate>").Append(entACC_Income.IncomeDate).Append("</IncomeDate>");
                            xmlBuilder.Append("<Note>").Append(entACC_Income.Note).Append("</Note>");
                            xmlBuilder.Append("<HospitalID>").Append(entACC_Income.HospitalID).Append("</HospitalID>");
                            xmlBuilder.Append("<FinYearID>").Append(entACC_Income.FinYearID).Append("</FinYearID>");
                            xmlBuilder.Append("<UserID>").Append(entACC_Income.UserID).Append("</UserID>");
                            xmlBuilder.Append("<Created>").Append(entACC_Income.Created).Append("</Created>");
                            xmlBuilder.Append("<Modified>").Append(entACC_Income.Modified).Append("</Modified>");
                            xmlBuilder.Append("<Operation>");

                            if (!string.IsNullOrEmpty(Hdfiled.Value))
                            {
                                xmlBuilder.Append(chkIsSelected.Checked ? "U" : "D");
                            }
                            else
                            {
                                xmlBuilder.Append("I");
                            }

                            xmlBuilder.Append("</Operation>");
                            xmlBuilder.Append("</Income>");
                        }

                        #endregion 15.1.1 Gather Data
                    }

                    xmlBuilder.Append("</IncomeList>");

                    string xmlData = xmlBuilder.ToString();
                    if (balACC_Income.Upsertxml(xmlData))
                    {
                        ucMessage.ShowSuccess(CommonMessage.RecordSaved());
                        //ClearControls();
                    }
                    else
                    {
                        ucMessage.ShowError(balACC_Income.Message);
                    }
                }
                catch (Exception ex)
                {
                    ucMessage.ShowError(ex.Message);
                }
            }
        }*/
  


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            SqlInt32 HospitalID = SqlInt32.Null;
            if (ddlHospitalID.SelectedIndex > 0)
                HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);

            ACC_IncomeBAL balACC_Income = new ACC_IncomeBAL();
            ACC_IncomeENT entACC_Income = new ACC_IncomeENT();

            System.Text.StringBuilder xmlBuilder = new System.Text.StringBuilder();
            xmlBuilder.Append("<IncomeList>");

            try
            {
                foreach (RepeaterItem items in rpData.Items)
                {
                    #region FindControl
                    var ddlFinYearID = (DropDownList)items.FindControl("ddlFinYearID");
                    var ddlIncomeTypeID = (DropDownList)items.FindControl("ddlIncomeTypeID");
                    var dtpIncomeDate = (TextBox)items.FindControl("dtpIncomeDate");
                    TextBox txtAmount = (TextBox)items.FindControl("txtAmount");
                    HiddenField Hdfiled = (HiddenField)items.FindControl("hdIncomeID");
                    TextBox txtNote = (TextBox)items.FindControl("txtNote");
                    CheckBox chkIsSelected = (CheckBox)items.FindControl("chkIsSelected");
                    #endregion FindControl

                    #region 15.1.1 Gather Data
                    String ErrorMsg = String.Empty;
                    if (chkIsSelected.Checked)
                    {
                        if (ddlFinYearID.SelectedIndex == 0)
                            ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("FinYear");

                        if (ddlIncomeTypeID.SelectedIndex == 0)
                            ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("IncomeType");

                        if (dtpIncomeDate.Text.Trim() == String.Empty)
                            ErrorMsg += " - " + CommonMessage.ErrorRequiredField("IncomeDate");

                        if (txtAmount.Text.Trim() == String.Empty)
                            ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Amount");

                        if (ErrorMsg != String.Empty)
                        {
                            ErrorMsg = CommonMessage.ErrorPleaseCorrectFollowing() + ErrorMsg;
                            ucMessage.ShowError(ErrorMsg);
                            ddlFinYearID.Focus();
                            Div_ShowResult.Visible = true;
                            return;
                        }

                        entACC_Income.HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);
                        entACC_Income.FinYearID = Convert.ToInt32(ddlFinYearID.SelectedValue);
                        entACC_Income.IncomeTypeID = Convert.ToInt32(ddlIncomeTypeID.SelectedValue);
                        entACC_Income.IncomeDate = Convert.ToDateTime(dtpIncomeDate.Text);
                        entACC_Income.Amount = Convert.ToDecimal(txtAmount.Text);
                        entACC_Income.Note = Convert.ToString(txtNote.Text);
                        entACC_Income.UserID = Convert.ToInt32(Session["UserID"]);
                        entACC_Income.Created = DateTime.Now;
                        entACC_Income.Modified = DateTime.Now;

                        xmlBuilder.Append("<Income>");
                        xmlBuilder.Append("<IncomeID>").Append(Hdfiled.Value).Append("</IncomeID>");
                        xmlBuilder.Append("<IncomeTypeID>").Append(entACC_Income.IncomeTypeID).Append("</IncomeTypeID>");
                        xmlBuilder.Append("<Amount>").Append(entACC_Income.Amount).Append("</Amount>");
                        xmlBuilder.Append("<IncomeDate>").Append(entACC_Income.IncomeDate).Append("</IncomeDate>");
                        xmlBuilder.Append("<Note>").Append(entACC_Income.Note).Append("</Note>");
                        xmlBuilder.Append("<HospitalID>").Append(entACC_Income.HospitalID).Append("</HospitalID>");
                        xmlBuilder.Append("<FinYearID>").Append(entACC_Income.FinYearID).Append("</FinYearID>");
                        xmlBuilder.Append("<UserID>").Append(entACC_Income.UserID).Append("</UserID>");
                        xmlBuilder.Append("<Created>").Append(entACC_Income.Created).Append("</Created>");
                        xmlBuilder.Append("<Modified>").Append(entACC_Income.Modified).Append("</Modified>");
                        xmlBuilder.Append("<Operation>");

                        // Operation Type
                        if (!string.IsNullOrEmpty(Hdfiled.Value))
                        {
                            xmlBuilder.Append("U");
                        }
                        else
                        {
                            xmlBuilder.Append("I");
                        }

                        xmlBuilder.Append("</Operation>");
                        xmlBuilder.Append("</Income>");
                    }
                    else if (!string.IsNullOrEmpty(Hdfiled.Value)) // Delete unselected items
                    {
                        xmlBuilder.Append("<Income>");
                        xmlBuilder.Append("<IncomeID>").Append(Hdfiled.Value).Append("</IncomeID>");
                        xmlBuilder.Append("<Operation>D</Operation>");
                        xmlBuilder.Append("</Income>");
                    }
                    #endregion 15.1.1 Gather Data
                }

                xmlBuilder.Append("</IncomeList>");

                string xmlData = xmlBuilder.ToString();
                if (balACC_Income.Upsertxml(xmlData))
                {
                    ucMessage.ShowSuccess(CommonMessage.RecordSaved());
                    ClearControls();
                }
                else
                {
                    ucMessage.ShowError(balACC_Income.Message);
                }
                Div_ShowResult.Visible = false;
            }
            catch (Exception ex)
            {
                ucMessage.ShowError(ex.Message);
            }
        }
    }
   
  





    #endregion 15.0 Save Button Event

    #region 16.0 Clear Controls
    private void ClearControls()
    {
        ddlHospitalID.SelectedIndex = 0;
    }

    #endregion 16.0 Clear Controls

    #region 17.0 Add Row Button
    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("Amount");
    //    dt.Columns.Add("Note");
    //    dt.Columns.Add("IncomeDate");
    //    dt.Columns.Add("FinYearID");
    //    dt.Columns.Add("IncomeTypeID");
    //    dt.Columns.Add("IncomeID");

    //    foreach (RepeaterItem rp in rpData.Items)
    //    {
    //        DropDownList finyearid = (DropDownList)rp.FindControl("ddlFinYearID");
    //        DropDownList incometypeid = (DropDownList)rp.FindControl("ddlIncomeTypeID");
    //        TextBox txtAmount = (TextBox)rp.FindControl("txtAmount");
    //        TextBox txtNote = (TextBox)rp.FindControl("txtNote");

    //        TextBox txtIncomeDate = (TextBox)rp.FindControl("dtpIncomeDate");
    //        HiddenField hdIncomeID = (HiddenField)rp.FindControl("hdIncomeID");

    //        DataRow dr = dt.NewRow();
    //        dr["Amount"] = txtAmount.Text.Trim();
    //        dr["Note"] = txtNote.Text.Trim();
    //        dr["IncomeDate"] = txtIncomeDate.Text.Trim();
    //        dr["FinYearID"]=finyearid.SelectedValue;
    //        dr["IncomeTypeID"]=incometypeid.SelectedValue;
    //        dr["IncomeId"] = hdIncomeID.Value.ToString();

    //        dt.Rows.Add(dr);
    //    }
    //    int count = 0;
    //    foreach (DataRow dr in dt.Rows)
    //    {
    //        if (dr["Amount"].ToString() != String.Empty)
    //            count++;
    //    }
    //    if (count == dt.Rows.Count)
    //        dt.Rows.Add();

    //    rpData.DataSource = dt;
    //    rpData.DataBind();
    //}


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("IncomeDate");
        dt.Columns.Add("Amount");
        dt.Columns.Add("Remarks");
        dt.Columns.Add("Note");
        dt.Columns.Add("IncomeID");
        dt.Columns.Add("IncomeTypeID");
        dt.Columns.Add("FinYearID");

        foreach (RepeaterItem rp in rpData.Items)
        {
            DropDownList FinYearID = (DropDownList)rp.FindControl("ddlFinYearID");
            DropDownList IncomeTypeID = (DropDownList)rp.FindControl("ddlIncomeTypeID");
            TextBox dtpIncomeDate = (TextBox)rp.FindControl("dtpIncomeDate");
            TextBox txtNote = (TextBox)rp.FindControl("txtNote");
            TextBox txtAmount = (TextBox)rp.FindControl("txtAmount");
            HiddenField hdIncomeID = (HiddenField)rp.FindControl("hdIncomeID");

            DataRow dr = dt.NewRow();
            dr["IncomeDate"] = dtpIncomeDate.Text.ToString().Trim() != String.Empty ? Convert.ToDateTime(dtpIncomeDate.Text.ToString().Trim()).ToString(CV.DefaultDateFormat) : null;
            dr["Amount"] = txtAmount.Text.ToString().Trim();
            dr["Note"] = txtNote.Text.Trim();
            dr["IncomeID"] = hdIncomeID.Value.ToString();
            dr["FinYearID"] = FinYearID.SelectedValue;
            dr["IncomeTypeID"] = IncomeTypeID.SelectedValue;
            dt.Rows.Add(dr);
        }
        int count = 0;
        foreach (DataRow dr in dt.Rows)
        {
            if (dr["Amount"].ToString().Trim() != string.Empty && dr["FinYearID"].ToString().Trim() != string.Empty && dr["IncomeTypeID"].ToString().Trim() != string.Empty)
                count++;
        }
        if (count == dt.Rows.Count)
        {
            dt.Rows.Add();
        }
        else
        {
            ucMessage.ShowError("Fill All Rows Data");
        }

        rpData.DataSource = dt;
        rpData.DataBind();
    }
    #endregion 17.0 Add Row Button

    protected void rpData_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        SqlInt32 HospitalID = SqlInt32.Null;
        if (ddlHospitalID.SelectedIndex > 0)
            HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue); 
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var ddlFinYearID = (DropDownList)e.Item.FindControl("ddlFinYearID");
            var ddlIncomeTypeID = (DropDownList)e.Item.FindControl("ddlIncomeTypeID");
            var txtAmount = (TextBox)e.Item.FindControl("txtAmount");
            var hdIncomeID = (HiddenField)e.Item.FindControl("hdIncomeID");
            var txtNote = (TextBox)e.Item.FindControl("txtNote");
            var chkIsSelected = (CheckBox)e.Item.FindControl("chkIsSelected");
            var dtpIncomeDate = (TextBox)e.Item.FindControl("dtpIncomeDate");

            if (ddlFinYearID != null)
            {
                CommonFillMethods.FillSingleDropDownListFinYearID(ddlFinYearID);
               string finYearID = DataBinder.Eval(e.Item.DataItem, "FinYearID").ToString().Trim();
                //int finYearID = DataBinder.Eval(e.Item.DataItem, "FinYearID");

                // Logging for debugging
                System.Diagnostics.Debug.WriteLine("FinYearID from DataBinder: " + finYearID);
                foreach (ListItem item in ddlFinYearID.Items)
                {
                    System.Diagnostics.Debug.WriteLine("DropDownList item value: " + item.Value);
                }

                if (ddlFinYearID.Items.FindByValue(finYearID) != null)
                {
                    ddlFinYearID.SelectedValue = finYearID;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("FinYearID not found in DropDownList: " + finYearID);
                }
            }

            if (ddlIncomeTypeID != null)
            {
                CommonFillMethods.FillDropDownListIncomeTypeIDByHospitalID(ddlIncomeTypeID,HospitalID);
                string incomeTypeID = DataBinder.Eval(e.Item.DataItem, "IncomeTypeID").ToString().Trim();

                // Logging for debugging
                System.Diagnostics.Debug.WriteLine("IncomeTypeID from DataBinder: " + incomeTypeID);
                foreach (ListItem item in ddlIncomeTypeID.Items)
                {
                    System.Diagnostics.Debug.WriteLine("DropDownList item value: " + item.Value);
                }

                if (ddlIncomeTypeID.Items.FindByValue(incomeTypeID) != null)
                {
                    ddlIncomeTypeID.SelectedValue = incomeTypeID;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("IncomeTypeID not found in DropDownList: " + incomeTypeID);
                }
            }

            if (txtAmount != null)
            {
                txtAmount.Text = DataBinder.Eval(e.Item.DataItem, "Amount").ToString();
            }

            if (hdIncomeID != null)
            {
                hdIncomeID.Value = DataBinder.Eval(e.Item.DataItem, "IncomeID").ToString();
            }

            if (txtNote != null)
            {
                txtNote.Text = DataBinder.Eval(e.Item.DataItem, "Note").ToString();
            }


            if (dtpIncomeDate != null)
            {
                DateTime incomeDate;
                if (DateTime.TryParse(DataBinder.Eval(e.Item.DataItem, "IncomeDate").ToString(), out incomeDate))
                {
                    dtpIncomeDate.Text = incomeDate.ToString(CV.DefaultDateFormat);
                }
            }
        }
    }

}
