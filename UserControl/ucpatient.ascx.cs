using GNForm3C;
using GNForm3C.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucpatient : System.Web.UI.UserControl
{
    #region Page Load Event 

    protected void Page_Load(object sender, EventArgs e)
    {
        #region 10.1 Check User Login 

        if (Session["UserID"] == null)
            Response.Redirect(CV.LoginPageURL);

        #endregion 10.1 Check User Login 

/*        if (!Page.IsPostBack)
        {
            if (Request.QueryString["PatientID"] != null)
            {
                
            }
        }*/
    }

    #endregion

    #region FillControls
    public void ShowPatient(SqlInt32 PatientID)
    {
        MST_PatientBAL balMST_Patient = new MST_PatientBAL();
        System.Data.DataTable dtPatient = balMST_Patient.SelectView(PatientID);

        if (dtPatient != null)
        {
            foreach (DataRow dr in dtPatient.Rows)
            {

                if (!dr["PatientName"].Equals(DBNull.Value))
                {
                    lblucPatientName.Text = Convert.ToString(dr["PatientName"]);
                    lblucTitle.Text = Convert.ToString(dr["PatientName"]);

                }

                if (!dr["Age"].Equals(DBNull.Value))
                    lblucPatietAge.Text = Convert.ToString(dr["Age"]);

                if (!dr["DOB"].Equals(DBNull.Value))
                    lblucDOB.Text = Convert.ToDateTime(dr["DOB"]).ToString(CV.DefaultDateTimeFormat);

                if (!dr["MobileNo"].Equals(DBNull.Value))
                    lblucMobileNo.Text = Convert.ToString(dr["MobileNo"]);

                if (!dr["PrimaryDesc"].Equals(DBNull.Value))
                    lblucPrimaryDesc.Text = Convert.ToString(dr["PrimaryDesc"]);

                if (!dr["PatientPhotoPath"].Equals(DBNull.Value))
                {
                    imhPatient.ImageUrl = dr["PatientPhotoPath"].ToString();
                }
                else
                {
                    imhPatient.ImageUrl = "~/Default/Images/profile_user.jpg";

                }
            }
        }

        mvwPatient.SetActiveView(vwPatient);
        mvwPatient.Visible = true;
    }
    #endregion FillControls
}
