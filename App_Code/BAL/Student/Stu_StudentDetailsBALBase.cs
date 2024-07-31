using GNForm3C.DAL;
using GNForm3C.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;


public abstract class Stu_StudentDetailsBALBase
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

    public Stu_StudentDetailsBALBase()
    {

    }

    #endregion Constructor

    #region InsertOperation

    public Boolean Insert(Stu_StudentDetailENT stu_StudentDetailENT)
    {
        Stu_StudentDetailDAL stu_StudentDetailDAL = new Stu_StudentDetailDAL();
        if (stu_StudentDetailDAL.Insert(stu_StudentDetailENT))
        {
            return true;
        }
        else
        {
            this.Message = stu_StudentDetailDAL.Message;
            return false;
        }
    }

    #endregion InsertOperation

    #region UpdateOperation

    public Boolean Update(Stu_StudentDetailENT stu_StudentDetailENT)
    {
        Stu_StudentDetailDAL stu_StudentDetailDAL = new Stu_StudentDetailDAL();
        if (stu_StudentDetailDAL.Update(stu_StudentDetailENT))
        {
            return true;
        }
        else
        {
            this.Message = stu_StudentDetailDAL.Message;
            return false;
        }
    }

    #endregion UpdateOperation

    #region DeleteOperation

    public Boolean Delete(SqlInt32 StudentID)
    {
        Stu_StudentDetailDAL stu_StudentDetailDAL = new Stu_StudentDetailDAL();
        if (stu_StudentDetailDAL.Delete(StudentID))
        {
            return true;
        }
        else
        {
            this.Message = stu_StudentDetailDAL.Message;
            return false;
        }
    }

    #endregion DeleteOperation

    #region SelectOperation

    public Stu_StudentDetailENT SelectPK(SqlInt32 StudentID)
    {
        Stu_StudentDetailDAL stu_StudentDetailDAL =new Stu_StudentDetailDAL();
        return stu_StudentDetailDAL.SelectPK(StudentID);
    }
    public DataTable SelectView(SqlInt32 StudentID)
    {
        Stu_StudentDetailDAL stu_StudentDetailDAL = new Stu_StudentDetailDAL();
        return stu_StudentDetailDAL.SelectView(StudentID);
    }

    public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlString StudentName, SqlString EnrollmentNo, SqlInt32 CurrentSem, SqlString EmailInstitute, SqlString EmailPersonal, SqlString Gender, SqlInt32 RollNo, SqlString ContactNo)
    {
        Stu_StudentDetailDAL stu_StudentDetailDAL = new Stu_StudentDetailDAL();
        return stu_StudentDetailDAL.SelectPage(PageOffset, PageSize, out TotalRecords, StudentName, EnrollmentNo, CurrentSem, EmailInstitute, EmailPersonal, Gender, RollNo,ContactNo);
    }

    #endregion SelectOperation
}