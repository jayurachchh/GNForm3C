using GNForm3C.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;


public class MST_DEF_HospitalSumBALBase
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

    public MST_DEF_HospitalSumBALBase()
    {

    }

    #endregion Constructor

    #region SelectOperation
    public DataTable SelectHospitalWiseSum(SqlInt32 HospitalID)
    {
        MST_DEF_HospitalSumDALBase mST_DEF_HospitalSumDALBase = new MST_DEF_HospitalSumDALBase();
        return mST_DEF_HospitalSumDALBase.SelectHospitalWiseSum(HospitalID);
    }
    public DataTable SelectHospitalWiseTreatmentSummary(SqlInt32 HospitalID)
    {
        MST_DEF_HospitalSumDALBase mST_DEF_HospitalSumDALBase = new MST_DEF_HospitalSumDALBase();
        return mST_DEF_HospitalSumDALBase.SelectHospitalWiseTreatmentSummary(HospitalID);
    }
    public DataTable SelectDayWiseMonthWiseIncome(SqlInt32 HospitalID)
    {
        MST_DEF_HospitalSumDALBase mST_DEF_HospitalSumDALBase = new MST_DEF_HospitalSumDALBase();
        return mST_DEF_HospitalSumDALBase.SelectDayWiseMonthWiseIncome(HospitalID);
    }
    public DataTable SelectDayWiseMonthWiseExpense(SqlInt32 HospitalID)
    {
        MST_DEF_HospitalSumDALBase mST_DEF_HospitalSumDALBase = new MST_DEF_HospitalSumDALBase();
        return mST_DEF_HospitalSumDALBase.SelectDayWiseMonthWiseExpense(HospitalID);
    }
    #endregion

}