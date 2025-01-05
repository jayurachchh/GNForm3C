using GNForm3C.DAL;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;



public class ACC_ExpenseLedgerDALBase: DataBaseConfig
{

    #region Properties

    private string _Message;
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

    #endregion Properties

    #region Constructor

    public ACC_ExpenseLedgerDALBase()
    {

    }

    #endregion Constructor

    #region Select Page

    public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlDateTime FromDate, SqlDateTime ToDate,SqlString Type)
    {
        TotalRecords = 0;
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PP_Ledger_Hospital_Income_Expense");
            sqlDB.AddInParameter(dbCMD, "@PageOffset", SqlDbType.Int, PageOffset);
            sqlDB.AddInParameter(dbCMD, "@PageSize", SqlDbType.Int, PageSize);
            sqlDB.AddOutParameter(dbCMD, "@TotalRecords", SqlDbType.Int,4);
            sqlDB.AddInParameter(dbCMD, "@FromDate", SqlDbType.DateTime, FromDate);
            sqlDB.AddInParameter(dbCMD, "@ToDate", SqlDbType.DateTime, ToDate);
            sqlDB.AddInParameter(dbCMD, "@Type", SqlDbType.VarChar, Type);

            DataTable dtACC_Expense = new DataTable("PP_Ledger_Hospital_Income_Expense");

            DataBaseHelper DBH = new DataBaseHelper();
            DBH.LoadDataTable(sqlDB, dbCMD, dtACC_Expense);

            TotalRecords = Convert.ToInt32(dbCMD.Parameters["@TotalRecords"].Value);

            return dtACC_Expense;
        }
        catch (SqlException sqlex)
        {
            Message = SQLDataExceptionMessage(sqlex);
            if (SQLDataExceptionHandler(sqlex))
                throw;
            return null;
        }
        catch (Exception ex)
        {
            Message = ExceptionMessage(ex);
            if (ExceptionHandler(ex))
                throw;
            return null;
        }
    }

    public DataTable Report_HospitalWiseFinyearWiseIncomeExpense()
    {
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PP_HospitalWise_FinYearWise_IncomeExpenseList");

            DataTable dtACC_Expense = new DataTable("PP_HospitalWise_FinYearWise_IncomeExpenseList");

            DataBaseHelper DBH = new DataBaseHelper();
            DBH.LoadDataTable(sqlDB, dbCMD, dtACC_Expense);

            return dtACC_Expense;
        }
        catch (SqlException sqlex)
        {
            Message = SQLDataExceptionMessage(sqlex);
            if (SQLDataExceptionHandler(sqlex))
                throw;
            return null;
        }
        catch (Exception ex)
        {
            Message = ExceptionMessage(ex);
            if (ExceptionHandler(ex))
                throw;
            return null;
        }
    }



    public DataTable Report_HospitalWiseIncomeExpenseLedger(SqlInt32 FinYearID, SqlInt32 HospitalID)
    {
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PP_ACC_Ledger_HospitalWise_IncomeExpense");

            sqlDB.AddInParameter(dbCMD, "@FinYearID", SqlDbType.Int, FinYearID);
            sqlDB.AddInParameter(dbCMD, "@HospitalID", SqlDbType.Int, HospitalID);
            

            DataTable dtACC_Expense = new DataTable("PP_ACC_Ledger_HospitalWise_IncomeExpense");

            DataBaseHelper DBH = new DataBaseHelper();
            DBH.LoadDataTable(sqlDB, dbCMD, dtACC_Expense);

            return dtACC_Expense;
        }
        catch (SqlException sqlex)
        {
            Message = SQLDataExceptionMessage(sqlex);
            if (SQLDataExceptionHandler(sqlex))
                throw;
            return null;
        }
        catch (Exception ex)
        {
            Message = ExceptionMessage(ex);
            if (ExceptionHandler(ex))
                throw;
            return null;
        }
    }

    #endregion
}