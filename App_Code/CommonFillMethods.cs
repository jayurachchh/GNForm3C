using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using GNForm3C.BAL;
using System.Data.SqlTypes;
using GNForm3C.ENT;

namespace GNForm3C
{
    public class CommonFillMethods
    {
        public CommonFillMethods()
        {
        }
        public static void FillDropDownListTransactionID(DropDownList ddl)
        {
            ACC_TransactionBAL balACC_Transaction = new ACC_TransactionBAL();
            ddl.DataSource = balACC_Transaction.SelectComboBox();
            ddl.DataValueField = "TransactionID";
            ddl.DataTextField = "Patient";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Transaction", "-99"));
        }
        public static void FillDropDownListExpenseTypeID(DropDownList ddl)
        {
            MST_ExpenseTypeBAL balMST_ExpenseType = new MST_ExpenseTypeBAL();
            ddl.DataSource = balMST_ExpenseType.SelectComboBox();
            ddl.DataValueField = "ExpenseTypeID";
            ddl.DataTextField = "ExpenseType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Expense Type", "-99"));
        }
        public static void FillDropDownListExpenseTypeIDWithHospital(DropDownList ddl)
        {
            MST_ExpenseTypeBAL balMST_ExpenseType = new MST_ExpenseTypeBAL();
            ddl.DataSource = balMST_ExpenseType.SelectComboBoxExpenseTypeHospita();
            ddl.DataValueField = "ExpenseTypeID";
            ddl.DataTextField = "ExpenseType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Expense Type", "-99"));
        }
        public static void FillDropDownListIsDefault(DropDownList ddl)
        {
            // Clear existing items
            ddl.Items.Clear();

            // Add static items "Yes" and "No"
            //ddl.Items.Add(new ListItem("Select"));
            ddl.Items.Insert(0, new ListItem("Select", "-99"));
            ddl.Items.Add(new ListItem("Yes","1"));
            ddl.Items.Add(new ListItem("No", "0"));

            // Set default selected item to "Yes"
            ddl.SelectedIndex = 0;  // This sets "Yes" as the default selected item
        }
        public static void FillDropDownListType(DropDownList ddl)
        {
            // Clear existing items
            ddl.Items.Clear();

            // Add static items "Yes" and "No"
            //ddl.Items.Add(new ListItem("Select"));
            ddl.Items.Insert(0, new ListItem("Select Type","-99"));
            ddl.Items.Add(new ListItem("Income", "Income"));
            ddl.Items.Add(new ListItem("Expense", "Expense"));

            // Set default selected item to "Yes"
            ddl.SelectedIndex = 0;  // This sets "Yes" as the default selected item
        }

        public static void FillDropDownListExpenseTypeIDByFinYearID(DropDownList ddl, SqlInt32 FinYearID, SqlInt32 HospitalID)
        {
            MST_ExpenseTypeBAL balMST_ExpenseType = new MST_ExpenseTypeBAL();
            ddl.DataSource = balMST_ExpenseType.SelectComboBoxByFinYearID(FinYearID, HospitalID);
            ddl.DataValueField = "ExpenseTypeID";
            ddl.DataTextField = "ExpenseType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Expense Type", "-99"));
        }
        
        public static void FillDropDownListFinYearIDByHospitalID(DropDownList ddl, SqlInt32 HospitalID)
        {
            MST_FinYearBAL balMST_FinYear = new MST_FinYearBAL();
            ddl.DataSource = balMST_FinYear.SelectComboBoxByHospitalID(HospitalID);
            ddl.DataValueField = "FinYearID";
            ddl.DataTextField = "FinYearName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Fin Year", "-99"));
        }
        public static void FillDropDownListFinYearID(DropDownList ddl)
        {
            MST_FinYearBAL balMST_FinYear = new MST_FinYearBAL();
            ddl.DataSource = balMST_FinYear.SelectComboBox();
            ddl.DataValueField = "FinYearID";
            ddl.DataTextField = "FinYearName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Fin Year", "-99"));
        }
        public static void FillDropDownListExpenseFinYearIDByHospitalID(DropDownList ddl, SqlInt32 HospitalID)
        {
            MST_FinYearBAL balMST_FinYear = new MST_FinYearBAL();
            ddl.DataSource = balMST_FinYear.SelectComboBoxByHospitalIDExpense(HospitalID);
            ddl.DataValueField = "FinYearID";
            ddl.DataTextField = "FinYearName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Fin Year", "-99"));
        }
        public static void FillSingleDropDownListFinYearID(DropDownList ddl)
        {
            MST_FinYearBAL balMST_FinYear = new MST_FinYearBAL();
            ddl.DataSource = balMST_FinYear.SelectComboBox();
            ddl.DataValueField = "FinYearID";
            ddl.DataTextField = "FinYearName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Fin Year", "-99"));
        }
        public static void FillDropDownListHospitalID(DropDownList ddl)
        {
            MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();
            ddl.DataSource = balMST_Hospital.SelecComboBox();
            ddl.DataValueField = "HospitalID";
            ddl.DataTextField = "Hospital";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Hospital", "-99"));
        }
        public static void FillDropDownListIncomeTypeIDByFinYearID(DropDownList ddl, SqlInt32 FinYearID, SqlInt32 HospitalID)
        {
            MST_IncomeTypeBAL balMST_IncomeType = new MST_IncomeTypeBAL();
            ddl.DataSource = balMST_IncomeType.SelectComboBoxByFinYearID(FinYearID, HospitalID);
            ddl.DataValueField = "IncomeTypeID";
            ddl.DataTextField = "IncomeType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Income Type", "-99"));
        }
        public static void FillSingleDropDownListIncomeTypeID(DropDownList ddl)
        {
            MST_IncomeTypeBAL balMST_IncomeType = new MST_IncomeTypeBAL();
            ddl.DataSource = balMST_IncomeType.SelectSingleComboBox();
            ddl.DataValueField = "IncomeTypeID";
            ddl.DataTextField = "IncomeType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Income Type", "-99"));
        }
        public static void FillDropDownListReceiptTypeID(DropDownList ddl)
        {
            MST_ReceiptTypeBAL balMST_ReceiptType = new MST_ReceiptTypeBAL();
            ddl.DataSource = balMST_ReceiptType.SelectComboBox();
            ddl.DataValueField = "ReceiptTypeID";
            ddl.DataTextField = "ReceiptTypeName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Receipt Type", "-99"));
        }
        public static void FillDropDownListSubTreatmentID(DropDownList ddl)
        {
            MST_SubTreatmentBAL balMST_SubTreatment = new MST_SubTreatmentBAL();
            ddl.DataSource = balMST_SubTreatment.SelectComboBox();
            ddl.DataValueField = "SubTreatmentID";
            ddl.DataTextField = "SubTreatmentName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Sub Treatment", "-99"));
        }
        public static void FillDropDownListTreatmentID(DropDownList ddl)
        {
            MST_TreatmentBAL balMST_Treatment = new MST_TreatmentBAL();
            ddl.DataSource = balMST_Treatment.SelectComboBox();
            ddl.DataValueField = "TreatmentID";
            ddl.DataTextField = "Treatment";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Treatment", "-99"));
        }
        public static void FillDropDownListUserID(DropDownList ddl)
        {
            SEC_UserBAL balSEC_User = new SEC_UserBAL();
            ddl.DataSource = balSEC_User.SelectComboBox();
            ddl.DataValueField = "UserID";
            ddl.DataTextField = "UserName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select User", "-99"));
        }
        public static void FillDropDownListCurrentSem(DropDownList ddl)
        {
            // Clear existing items
            ddl.Items.Clear();

            // Add static items "Yes" and "No"
            //ddl.Items.Add(new ListItem("Select"));
            ddl.Items.Insert(0, new ListItem("Select Current Sem", "-99"));
            ddl.Items.Add(new ListItem("1", "1"));
            ddl.Items.Add(new ListItem("2", "2"));
            ddl.Items.Add(new ListItem("3", "3"));
            ddl.Items.Add(new ListItem("4", "4"));
            ddl.Items.Add(new ListItem("5", "5"));
            ddl.Items.Add(new ListItem("6", "6"));
            ddl.Items.Add(new ListItem("7", "7"));
            ddl.Items.Add(new ListItem("8", "8"));
            ddl.Items.Add(new ListItem("9", "9"));
            ddl.Items.Add(new ListItem("10", "10"));
            

            // Set default selected item to "Yes"
            ddl.SelectedIndex = 0;  // This sets "Yes" as the default selected item
        }
        public static void FillDropDownListGender(DropDownList ddl)
        {
            // Clear existing items
            ddl.Items.Clear();

            // Add static items "Yes" and "No"
            //ddl.Items.Add(new ListItem("Select"));
            ddl.Items.Insert(0, new ListItem("Select Gender", "-99"));
            ddl.Items.Add(new ListItem("Male", "Male"));
            ddl.Items.Add(new ListItem("Female", "Female"));

            // Set default selected item to "Yes"
            ddl.SelectedIndex = 0;  // This sets "Yes" as the default selected item
        }

    }
}
