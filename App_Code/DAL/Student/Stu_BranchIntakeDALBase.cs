using GNForm3C.DAL;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;


public class Stu_BranchIntakeDALBase:DataBaseConfig
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

    public Stu_BranchIntakeDALBase()
    {

    }

    #endregion Constructor

/*    #region InsertOperation
    public Boolean Insert(Stu_BranchIntakeENT stu_BranchIntakeENT)
    {
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BranchIntake_Insert");

            sqlDB.AddInParameter(dbCMD, "@Branch", SqlDbType.NVarChar, stu_BranchIntakeENT.Branch);
            sqlDB.AddInParameter(dbCMD, "@AdmissionYear", SqlDbType.Int, stu_BranchIntakeENT.AdmissionYear);
            sqlDB.AddInParameter(dbCMD, "@Intake", SqlDbType.Int, stu_BranchIntakeENT.Intake);


            DataBaseHelper DBH = new DataBaseHelper();
            DBH.ExecuteNonQuery(sqlDB, dbCMD);

            return true;
        }
        catch (SqlException sqlex)
        {
            Message = SQLDataExceptionMessage(sqlex);
            if (SQLDataExceptionHandler(sqlex))
                throw;
            return false;
        }
        catch (Exception ex)
        {
            Message = ExceptionMessage(ex);
            if (ExceptionHandler(ex))
                throw;
            return false;
        }
    }

    #endregion InsertOperation

    #region UpdateOperation

    public Boolean Update(Stu_BranchIntakeENT stu_BranchIntakeENT)
    {
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BranchIntake_Update");

            sqlDB.AddInParameter(dbCMD, "@Branch", SqlDbType.NVarChar, stu_BranchIntakeENT.Branch);
            sqlDB.AddInParameter(dbCMD, "@AdmissionYear", SqlDbType.Int, stu_BranchIntakeENT.AdmissionYear);
            sqlDB.AddInParameter(dbCMD, "@Intake", SqlDbType.Int, stu_BranchIntakeENT.Intake);

            DataBaseHelper DBH = new DataBaseHelper();
            DBH.ExecuteNonQuery(sqlDB, dbCMD);

            return true;
        }
        catch (SqlException sqlex)
        {
            Message = SQLDataExceptionMessage(sqlex);
            if (SQLDataExceptionHandler(sqlex))
                throw;
            return false;
        }
        catch (Exception ex)
        {
            Message = ExceptionMessage(ex);
            if (ExceptionHandler(ex))
                throw;
            return false;
        }
    }


    #endregion UpdateOperation*/

    #region Selectoperation 

    public DataTable GetBranchIntakeDataWithYears()
    {
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BranchIntake_SelectAll");
            DataSet ds = sqlDB.ExecuteDataSet(dbCMD);
            DataTable dt = ds.Tables[0];
            return dt;
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


    #endregion Selectoperation

    #region SaveBranchIntake Data
    public Boolean SaveBranchIntakeData(string branch, int admissionYear, int intake)
    {
        try
        {
            // Initialize the SqlDatabase object with the connection string
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);

            // Create a command object with the stored procedure name
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BranchIntake_InsertUpdate");

            // Add the parameters to the command
            sqlDB.AddInParameter(dbCMD, "@Branch", SqlDbType.NVarChar, branch);
            sqlDB.AddInParameter(dbCMD, "@Year", SqlDbType.Int, admissionYear);
            sqlDB.AddInParameter(dbCMD, "@Intake", SqlDbType.Int, intake);

            // Execute the command
            DataBaseHelper DBH = new DataBaseHelper();
            DBH.ExecuteNonQuery(sqlDB, dbCMD);

            return true;
        }
        catch (SqlException sqlex)
        {
            // Handle SQL exceptions
            Message = SQLDataExceptionMessage(sqlex);
            if (SQLDataExceptionHandler(sqlex))
                throw;
            return false;
        }
        catch (Exception ex)
        {
            // Handle general exceptions
            Message = ExceptionMessage(ex);
            if (ExceptionHandler(ex))
                throw;
            return false;
        }
    }
    #endregion SaveBranchIntake Data

}