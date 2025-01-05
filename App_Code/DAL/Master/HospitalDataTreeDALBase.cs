using GNForm3C.DAL;
using GNForm3C.ENT;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;
using iTextSharp.text;

/// <summary>
/// Summary description for HospitalDataTreeDALBase
/// </summary>
public class HospitalDataTreeDALBase : DataBaseConfig
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
    public HospitalDataTreeDALBase()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region SelectOperation

    public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlInt32 HospitalID, SqlInt32 FinYearID)
    {
        TotalRecords = 0;
        try
        {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_ACC_HospitalDataTree_SelectPage");
            sqlDB.AddInParameter(dbCMD, "@PageOffset", SqlDbType.Int, PageOffset);
            sqlDB.AddInParameter(dbCMD, "@PageSize", SqlDbType.Int, PageSize);
            sqlDB.AddOutParameter(dbCMD, "@TotalRecords", SqlDbType.Int, 4);
            sqlDB.AddInParameter(dbCMD, "@HospitalID", SqlDbType.Int, HospitalID);
            sqlDB.AddInParameter(dbCMD, "@FinYearID", SqlDbType.Int, FinYearID);


            DataTable dtACC_IncomeTree = new DataTable("PR_ACC_HospitalDataTree_SelectPage");

            DataBaseHelper DBH = new DataBaseHelper();
            
            DBH.LoadDataTable(sqlDB, dbCMD, dtACC_IncomeTree);

            var totalRecordsParam = dbCMD.Parameters["@TotalRecords"].Value;
            if (totalRecordsParam != DBNull.Value)
            {
                TotalRecords = Convert.ToInt32(totalRecordsParam);
            }
            else
            {
                TotalRecords = 0; // or handle as per your business logic
            }
            return dtACC_IncomeTree;
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

    #endregion SelectOperation
}