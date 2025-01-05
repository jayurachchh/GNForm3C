using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

public class MST_DSB_FinYearBALBase
{
    #region Constructor
    public MST_DSB_FinYearBALBase()
    {

    }
    #endregion

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

    #region Select
    public DataTable SelectCount(SqlInt32 FinYearID)
    {
        MST_DSB_FInYearDAL mST_FInYearDAL = new MST_DSB_FInYearDAL();
        return mST_FInYearDAL.SelectCount(FinYearID);
    }

    public DataTable CategoryWiseIncomeTotalList(SqlInt32 FinYearID)
    {
        MST_DSB_FInYearDAL mST_FInYearDAL = new MST_DSB_FInYearDAL();
        return mST_FInYearDAL.CategoryWiseIncomeTotalList(FinYearID);
    }

    public DataTable CategoryWiseExpenseTotalList(SqlInt32 FinYearID)
    {
        MST_DSB_FInYearDAL mST_FInYearDAL = new MST_DSB_FInYearDAL();
        return mST_FInYearDAL.CategoryWiseExpenseTotalList(FinYearID);
    }

    public DataTable HospitalWisePatientCountList(SqlInt32 FinYearID)
    {
        MST_DSB_FInYearDAL mST_FInYearDAL = new MST_DSB_FInYearDAL();
        return mST_FInYearDAL.HospitalWisePatientCountList(FinYearID);
    }

    public DataTable AccountTranscationList(SqlInt32 FinYearID)
    {
        MST_DSB_FInYearDAL mST_FInYearDAL = new MST_DSB_FInYearDAL();
        return mST_FInYearDAL.AccountTranscationList(FinYearID);
    }
    public DataTable IncomeExpenseSumHospitalWise(SqlInt32 FinYearID)
    {
        MST_DSB_FInYearDAL dalMST_DSB2DAL = new MST_DSB_FInYearDAL();
        return dalMST_DSB2DAL.IncomeExpenseSumHospitalWise(FinYearID);
    }


    #endregion Select
}