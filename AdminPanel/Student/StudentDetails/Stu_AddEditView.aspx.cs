﻿using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using GNForm3C.BAL;
using GNForm3C.ENT;
using GNForm3C;

public partial class AdminPanel_Student_StudentDetails_Stu_AddEditView : System.Web.UI.Page
{
    //    #region 10.0 Local Variables 

    //    String FormName = "MST_StudentAddEdit";

    //    #endregion 10.0 Variables 

    //    #region 11.0 Page Load Event 

    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        #region 11.1 Check User Login 

    //        if (Session["UserID"] == null)
    //            Response.Redirect(CV.LoginPageURL);

    //        #endregion 11.1 Check User Login 

    //        if (!Page.IsPostBack)
    //        {
    //            #region 11.2 Fill Labels 

    //            //FillLabels(FormName);

    //            #endregion 11.2 Fill Labels 

    //            #region 11.3 DropDown List Fill Section 

    //            FillDropDownList();

    //            #endregion 11.3 DropDown List Fill Section 

    //            #region 11.4 Set Control Default Value 

    //          //lblFormHeader.Text = CV.PageHeaderAdd + "Student ";
    //            //upr.DisplayAfter = CV.UpdateProgressDisplayAfter;

    //            txtStudentName.Focus();

    //            #endregion 11.4 Set Control Default Value 

    //            #region 11.5 Fill Controls 

    //            FillControls();

    //            #endregion 11.5 Fill Controls 

    //            #region 11.6 Set Help Text 

    //           //ucHelp.ShowHelp("Help Text will be shown here");

    //            #endregion 11.6 Set Help Text 

    //        }
    //    }

    //    #endregion 11.0 Page Load Event

    //    #region 12.0 FillLabels 

    //    private void FillLabels(String FormName)
    //    {
    //        // Implementation for filling labels specific to the form
    //    }

    //    #endregion 12.0 FillLabels 

    //    #region 13.0 Fill DropDownList 

    //    private void FillDropDownList()
    //    {
    //        // Fill the dropdown lists with relevant data
    //        CommonFillMethods.FillDropDownListCurrentSem(ddlCurrentSem);
    //        CommonFillMethods.FillDropDownListGender(ddlGender);
    //    }

    //    #endregion 13.0 Fill DropDownList

    //    #region 14.0 FillControls By PK  

    //    private void FillControls()
    //    {
    //        if (Request.QueryString["StudentID"] != null)
    //        {
    //            //lblFormHeader.Text = CV.PageHeaderEdit + " Student";

    //            //MST_StudentBAL balMST_Student = new MST_StudentBAL();
    //           // MST_StudentENT entMST_Student = new MST_StudentENT();

    //            Stu_StudentDetailsBAL balMST_Student =new Stu_StudentDetailsBAL();
    //            Stu_StudentDetailENT entMST_Student =new Stu_StudentDetailENT();
    //            entMST_Student = balMST_Student.SelectPK(CommonFunctions.DecryptBase64Int32(Request.QueryString["StudentID"]));

    //            if (!entMST_Student.StudentName.IsNull)
    //                txtStudentName.Text = entMST_Student.StudentName.Value.ToString();

    //            if (!entMST_Student.EnrollmentNo.IsNull)
    //                txtEnrollmentNo.Text = entMST_Student.EnrollmentNo.Value.ToString();

    //            if (!entMST_Student.CurrentSem.IsNull)
    //                ddlCurrentSem.SelectedValue = entMST_Student.CurrentSem.Value.ToString();

    //            if (!entMST_Student.EmailInstitute.IsNull)
    //                txtEmailInstitute.Text = entMST_Student.EmailInstitute.Value.ToString();

    //            if (!entMST_Student.EmailPersonal.IsNull)
    //                txtEmailPersonal.Text = entMST_Student.EmailPersonal.Value.ToString();

    //            if (!entMST_Student.Gender.IsNull)
    //                ddlGender.SelectedValue = entMST_Student.Gender.Value.ToString();

    //            if (!entMST_Student.RollNo.IsNull)
    //                txtRollNo.Text = entMST_Student.RollNo.Value.ToString();

    //            if (!entMST_Student.ContactNo.IsNull)
    //                txtContactNo.Text = entMST_Student.ContactNo.Value.ToString();

    //            if (!entMST_Student.BirthDate.IsNull)
    //                txtBirthdate.Text = entMST_Student.BirthDate.Value.ToString("yyyy-MM-dd"); // Format as needed
    //        }
    //    }

    //    #endregion 14.0 FillControls By PK 

    //    #region 15.0 Save Button Event 

    //    protected void btnSave_Click(object sender, EventArgs e)
    //    {
    //        Page.Validate();    
    //        if (Page.IsValid)
    //        {
    //            try
    //            {
    //                Stu_StudentDetailsBAL balMST_Student = new Stu_StudentDetailsBAL();
    //                Stu_StudentDetailENT entMST_Student = new Stu_StudentDetailENT();

    //                #region 15.1 Validate Fields 

    //                String ErrorMsg = String.Empty;
    //                if (txtStudentName.Text.Trim() == String.Empty)
    //                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Student Name");
    //                if (txtEnrollmentNo.Text.Trim() == String.Empty)
    //                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Enrollment No");
    //                if (ddlCurrentSem.SelectedIndex == 0)
    //                    ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("Current Semester");
    //                if (txtEmailInstitute.Text.Trim() == String.Empty)
    //                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Institute Email");
    //                if (ddlGender.SelectedIndex == 0)
    //                    ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("Gender");
    //                if (txtBirthdate.Text.Trim() == String.Empty)
    //                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Birthdate");

    //                // Age validation
    //                if (!string.IsNullOrEmpty(txtBirthdate.Text.Trim()))
    //                {
    //                    DateTime birthDate;
    //                    if (DateTime.TryParse(txtBirthdate.Text.Trim(), out birthDate))
    //                    {
    //                        int age = DateTime.Now.Year - birthDate.Year;
    //                        if (DateTime.Now < birthDate.AddYears(age))
    //                        {
    //                            age--;
    //                        }

    //                        if (age < 18)
    //                        {
    //                            ErrorMsg += " - " + "You must be at least 18 years old.";
    //                        }
    //                    }
    //                    else
    //                    {
    //                        ErrorMsg += " - " + "Invalid Birthdate format.";
    //                    }
    //                }

    //                // Contact number validation
    //                if (!string.IsNullOrEmpty(txtContactNo.Text.Trim()))
    //                {
    //                    string contactNo = txtContactNo.Text.Trim();
    //                    if (!System.Text.RegularExpressions.Regex.IsMatch(contactNo, @"^\d{10}$"))
    //                    {
    //                        ErrorMsg += " - " + "Contact No must be exactly 10 digits.";
    //                    }
    //                }

    //                if (ErrorMsg != String.Empty)
    //                {
    //                    ErrorMsg = CommonMessage.ErrorPleaseCorrectFollowing() + ErrorMsg;
    //                    //ucMessage.ShowError(ErrorMsg);
    //                    return;
    //                }

    //                #endregion 15.1 Validate Fields

    //                #region 15.2 Gather Data 

    //                if (txtStudentName.Text.Trim() != String.Empty)
    //                    entMST_Student.StudentName = txtStudentName.Text.Trim();

    //                if (txtEnrollmentNo.Text.Trim() != String.Empty)
    //                    entMST_Student.EnrollmentNo = txtEnrollmentNo.Text.Trim();

    //                if (ddlCurrentSem.SelectedIndex > 0)
    //                    entMST_Student.CurrentSem = Convert.ToInt32(ddlCurrentSem.SelectedValue);

    //                if (txtEmailInstitute.Text.Trim() != String.Empty)
    //                    entMST_Student.EmailInstitute = txtEmailInstitute.Text.Trim();

    //                if (txtEmailPersonal.Text.Trim() != String.Empty)
    //                    entMST_Student.EmailPersonal = txtEmailPersonal.Text.Trim();

    //                if (ddlGender.SelectedIndex > 0)
    //                    entMST_Student.Gender = ddlGender.SelectedValue;

    //                if (txtRollNo.Text.Trim() != String.Empty)
    //                    entMST_Student.RollNo = Convert.ToInt32(txtRollNo.Text.Trim());

    //                if (txtContactNo.Text.Trim() != String.Empty)
    //                    entMST_Student.ContactNo = txtContactNo.Text.Trim();

    //                if (txtBirthdate.Text.Trim() != String.Empty)
    //                    entMST_Student.BirthDate = Convert.ToDateTime(txtBirthdate.Text.Trim());

    //                entMST_Student.UserID = Convert.ToInt32(Session["UserID"]);
    //                entMST_Student.Created = DateTime.Now;
    //                entMST_Student.Modified = DateTime.Now;

    //                #endregion 15.2 Gather Data 

    //                #region 15.3 Insert, Update, Copy 

    //                if (Request.QueryString["StudentID"] != null && Request.QueryString["Copy"] == null)
    //                {
    //                    entMST_Student.StudentID = CommonFunctions.DecryptBase64Int32(Request.QueryString["StudentID"]);
    //                    if (balMST_Student.Update(entMST_Student))
    //                    {
    //                        Response.Redirect("Stu_StudentList.aspx");
    //                    }
    //                    else
    //                    {
    //                        //    ucMessage.ShowError(balMST_Student.Message);
    //                    }
    //                }
    //                else
    //                {
    //                    if (Request.QueryString["StudentID"] == null || Request.QueryString["Copy"] != null)
    //                    {
    //                        if (balMST_Student.Insert(entMST_Student))
    //                        {
    //                            //ucMessage.ShowSuccess(CommonMessage.RecordSaved());
    //                            ClearControls();
    //                        }
    //                        else
    //                        {
    //                            //ucMessage.ShowError(balMST_Student.Message);
    //                        }
    //                    }
    //                }

    //                #endregion 15.3 Insert, Update, Copy

    //            }
    //            catch (Exception ex)
    //            {
    //                //ucMessage.ShowError(ex.Message);
    //            }
    //        }



    //    }

    //    #endregion 15.0 Save Button Event 

    //    #region 16.0 Clear Controls 

    //    private void ClearControls()
    //    {
    //        txtStudentName.Text = String.Empty;
    //        txtEnrollmentNo.Text = String.Empty;
    //        ddlCurrentSem.SelectedIndex = 0;
    //        txtEmailInstitute.Text = String.Empty;
    //        txtEmailPersonal.Text = String.Empty;
    //        ddlGender.SelectedIndex = 0;
    //        txtRollNo.Text = String.Empty;
    //        txtContactNo.Text = String.Empty;
    //        txtBirthdate.Text = String.Empty;
    //        txtStudentName.Focus();
    //    }

    //    #endregion 16.0 Clear Controls 
    #region 10.0 Local Variables 

    String FormName = "MST_StudentAddEdit";

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
            #region 11.2 Fill Labels 

            FillLabels(FormName);

            #endregion 11.2 Fill Labels 

            #region 11.3 DropDown List Fill Section 

            FillDropDownList();

            #endregion 11.3 DropDown List Fill Section 

            #region 11.4 Set Control Default Value 

            lblFormHeader.Text = CV.PageHeaderAdd + " Student";
            txtStudentName.Focus();

            #endregion 11.4 Set Control Default Value 

            #region 11.5 Fill Controls 

            FillControls();

            #endregion 11.5 Fill Controls 



        }
    }

    #endregion 11.0 Page Load Event

    #region 12.0 FillLabels 

    private void FillLabels(String FormName)
    {
    }

    #endregion 12.0 FillLabels 

    #region 13.0 Fill DropDownList 

    private void FillDropDownList()
    {
        CommonFillMethods.FillDropDownListCurrentSem(ddlCurrentSem);
        CommonFillMethods.FillDropDownListGender(ddlGender);
    }

    #endregion 13.0 Fill DropDownList

    #region 14.0 FillControls By PK  

    private void FillControls()
    {
        if (Request.QueryString["StudentID"] != null)
        {
            lblFormHeader.Text = CV.PageHeaderEdit + " Student";
            /*            MST_StudentBAL balMST_Student = new MST_StudentBAL();
                        MST_StudentENT entMST_Student = new MST_StudentENT();*/
                       Stu_StudentDetailsBAL balMST_Student =new Stu_StudentDetailsBAL();
                        Stu_StudentDetailENT entMST_Student =new Stu_StudentDetailENT();
            entMST_Student = balMST_Student.SelectPK(CommonFunctions.DecryptBase64Int32(Request.QueryString["StudentID"]));

            if (!entMST_Student.StudentName.IsNull)
                txtStudentName.Text = entMST_Student.StudentName.Value.ToString();

            if (!entMST_Student.EnrollmentNo.IsNull)
                txtEnrollmentNo.Text = entMST_Student.EnrollmentNo.Value.ToString();

            if (!entMST_Student.CurrentSem.IsNull)
                ddlCurrentSem.SelectedValue = entMST_Student.CurrentSem.Value.ToString();

            if (!entMST_Student.EmailInstitute.IsNull)
                txtEmailInstitute.Text = entMST_Student.EmailInstitute.Value.ToString();

            if (!entMST_Student.EmailPersonal.IsNull)
                txtEmailPersonal.Text = entMST_Student.EmailPersonal.Value.ToString();

            if (!entMST_Student.Gender.IsNull)
                ddlGender.SelectedValue = entMST_Student.Gender.Value.ToString();

            if (!entMST_Student.RollNo.IsNull)
                txtRollNo.Text = entMST_Student.RollNo.Value.ToString();

            if (!entMST_Student.BirthDate.IsNull)
                dtpBirthDate.Text = entMST_Student.BirthDate.Value.ToString(CV.DefaultDateFormat);

            if (!entMST_Student.ContactNo.IsNull)
                txtContactNo.Text = entMST_Student.ContactNo.Value.ToString();
        }
    }

    #endregion 14.0 FillControls By PK 

    #region 15.0 Save Button Event 

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Page.Validate();
        try
        {
            if (Page.IsValid)
            {

                /*     MST_StudentBAL balMST_Student = new MST_StudentBAL();
                     MST_StudentENT entMST_Student = new MST_StudentENT();*/

                Stu_StudentDetailsBAL balMST_Student = new Stu_StudentDetailsBAL();
                Stu_StudentDetailENT entMST_Student = new Stu_StudentDetailENT();
                #region 15.1 Validate Fields 

                String ErrorMsg = String.Empty;
                if (txtStudentName.Text.Trim() == String.Empty)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Student Name");
                if (txtEnrollmentNo.Text.Trim() == String.Empty)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Enrollment No");
                if (ddlCurrentSem.SelectedIndex == 0)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("Current Sem");
                if (txtEmailPersonal.Text.Trim() == String.Empty)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Email Personal");
                if (ddlGender.SelectedIndex == 0)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("Gender");
                if (txtContactNo.Text.Trim() == String.Empty)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Contact No");
                if (dtpBirthDate.Text.Trim() == String.Empty)
                    ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Birth Date");


                if (ErrorMsg != String.Empty)
                {
                    ErrorMsg = CommonMessage.ErrorPleaseCorrectFollowing() + ErrorMsg;
                    ucMessage.ShowError(ErrorMsg);

                    // Set the data-target attribute dynamically
                    btnSave.Attributes["data-target"] = "#view";
                    btnSave.Attributes["data-toggle"] = "modal";

                    // Use JavaScript to show the modal again
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "MasterPageView", "$('#view').modal('show');", true);

                    return;
                }

                #endregion 15.1 Validate Fields

                #region 15.2 Gather Data 


                if (txtStudentName.Text.Trim() != String.Empty)
                    entMST_Student.StudentName = txtStudentName.Text.Trim();

                if (txtEnrollmentNo.Text.Trim() != String.Empty)
                    entMST_Student.EnrollmentNo = txtEnrollmentNo.Text.Trim();

                if (ddlCurrentSem.SelectedIndex > 0)
                    entMST_Student.CurrentSem = Convert.ToInt32(ddlCurrentSem.SelectedValue);

                if (txtEmailInstitute.Text.Trim() != String.Empty)
                    entMST_Student.EmailInstitute = txtEmailInstitute.Text.Trim();

                if (txtEmailPersonal.Text.Trim() != String.Empty)
                    entMST_Student.EmailPersonal = txtEmailPersonal.Text.Trim();

                if (ddlGender.SelectedIndex > 0)
                    entMST_Student.Gender = ddlGender.SelectedValue.Trim();

                if (dtpBirthDate.Text.Trim() != String.Empty)
                    entMST_Student.BirthDate = Convert.ToDateTime(dtpBirthDate.Text.Trim());
                if (txtRollNo.Text.Trim() != String.Empty)
                    entMST_Student.RollNo = Convert.ToInt32(txtRollNo.Text.Trim());
                if (txtContactNo.Text.Trim() != String.Empty)
                    entMST_Student.ContactNo = txtContactNo.Text.Trim();



                entMST_Student.UserID = Convert.ToInt32(Session["UserID"]);

                entMST_Student.Created = DateTime.Now;

                entMST_Student.Modified = DateTime.Now;


                #endregion 15.2 Gather Data 


                #region 15.3 Insert,Update,Copy 

                if (Request.QueryString["StudentID"] != null && Request.QueryString["Copy"] == null)
                {
                    entMST_Student.StudentID = CommonFunctions.DecryptBase64Int32(Request.QueryString["StudentID"]);
                    if (balMST_Student.Update(entMST_Student))
                    {
                        // Use Response.Redirect with endResponse set to false
                        Response.Redirect("Stu_StudentList.aspx", false);

                        // Complete the request
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        ucMessage.ShowError(balMST_Student.Message);

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#view').modal('show');", true);
                    }
                }

                else
                {
                    if (Request.QueryString["StudentID"] == null || Request.QueryString["Copy"] != null)
                    {
                        if (balMST_Student.Insert(entMST_Student))
                        {
                            ucMessage.ShowSuccess(CommonMessage.RecordSaved());
                            ClearControls();
                            Response.Redirect("Stu_StudentList.aspx ");
                            Context.ApplicationInstance.CompleteRequest();

                        }
                        else
                        {
                            ucMessage.ShowError(balMST_Student.Message);

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#view').modal('show');", true);
                        }
                    }
                }

                #endregion 15.3 Insert,Update,Copy

            }
        }
        catch (Exception ex)
        {
            ucMessage.ShowError(ex.Message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#view').modal('show');", true);

        }
        

    }


    #endregion 15.0 Save Button Event 

    #region 16.0 Clear Controls 

    private void ClearControls()
    {
        txtStudentName.Text = String.Empty;
        txtEnrollmentNo.Text = String.Empty;
        ddlCurrentSem.SelectedIndex = 0;
        txtEmailInstitute.Text = String.Empty;
        txtEmailPersonal.Text = String.Empty;
        ddlGender.SelectedIndex = 0;
        txtRollNo.Text = String.Empty;
        txtContactNo.Text = String.Empty;
        dtpBirthDate.Text = String.Empty;
        txtStudentName.Focus();
    }

    #endregion 16.0 Clear Controls
}
