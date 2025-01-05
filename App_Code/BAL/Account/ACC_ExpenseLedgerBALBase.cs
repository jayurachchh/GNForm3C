using GNForm3C.DAL;
using GNForm3C.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;


public class ACC_ExpenseLedgerBALBase
{
    #region Private Fields

    private string _Message;

    #endregion Private Fields

    #region Public Properties

    public string Message
    {
        get
        {
            return _Message;
        }
        set
        {
            _Message = value;
        }
    }

    #endregion Public Properties

    #region Constructor

    public ACC_ExpenseLedgerBALBase()
    {

    }

    #endregion Constructor

    #region SelectOperation

    public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlDateTime FromDate, SqlDateTime ToDate, SqlString Type)
    {
        ACC_ExpenseLedgerDAL dalACC_Expense = new ACC_ExpenseLedgerDAL();
        return dalACC_Expense.SelectPage(PageOffset, PageSize, out TotalRecords, FromDate, ToDate, Type);
    }

    public DataTable Report_HospitalWiseFinyearWiseIncomeExpense()
    {
        ACC_ExpenseLedgerDAL dalACC_Expense = new ACC_ExpenseLedgerDAL();
        return dalACC_Expense.Report_HospitalWiseFinyearWiseIncomeExpense();
    }

    public DataTable Report_HospitalWiseIncomeExpenseLedger(SqlInt32 FinYearID, SqlInt32 HospitalID)
    {
        ACC_ExpenseLedgerDAL dalACC_Expense = new ACC_ExpenseLedgerDAL();
        return dalACC_Expense.Report_HospitalWiseIncomeExpenseLedger(FinYearID,HospitalID);
    }
    #endregion SelectOperation
}