using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;


public abstract class Stu_StudentDetailENTBase
{
    #region Properties

    protected SqlInt32 _StudentID;
    public SqlInt32 StudentID
    {
        get
        {
            return _StudentID;
        }
        set
        {
            _StudentID = value;
        }
    }

    protected SqlString _StudentName;
    public SqlString StudentName
    {
        get
        {
            return _StudentName;
        }
        set
        {
            _StudentName = value;
        }
    }

    protected SqlString _EnrollmentNo;
    public SqlString EnrollmentNo
    {
        get
        {
            return _EnrollmentNo;
        }
        set
        {
            _EnrollmentNo = value;
        }
    }

    protected SqlInt32 _RollNo;
    public SqlInt32 RollNo
    {
        get
        {
            return _RollNo;
        }
        set
        {
            _RollNo = value;
        }
    }

    protected SqlInt32 _CurrentSem;
    public SqlInt32 CurrentSem
    {
        get
        {
            return _CurrentSem;
        }
        set
        {
            _CurrentSem = value;
        }
    }

    protected SqlString _EmailInstitute;
    public SqlString EmailInstitute
    {
        get
        {
            return _EmailInstitute;
        }
        set
        {
            _EmailInstitute = value;
        }
    }

    protected SqlString _EmailPersonal;
    public SqlString EmailPersonal
    {
        get
        {
            return _EmailPersonal;
        }
        set
        {
            _EmailPersonal = value;
        }
    }

    protected SqlDateTime _BirthDate;
    public SqlDateTime BirthDate
    {
        get
        {
            return _BirthDate;
        }
        set
        {
            _BirthDate = value;
        }
    }

    protected SqlString _ContactNo;
    public SqlString ContactNo
    {
        get
        {
            return _ContactNo;
        }
        set
        {
            _ContactNo = value;
        }
    }

    protected SqlString _Gender;
    public SqlString Gender
    {
        get
        {
            return _Gender;
        }
        set
        {
            _Gender = value;
        }
    }

    protected SqlInt32 _UserID;
    public SqlInt32 UserID
    {
        get
        {
            return _UserID;
        }
        set
        {
            _UserID = value;
        }
    }

    protected SqlDateTime _Created;
    public SqlDateTime Created
    {
        get
        {
            return _Created;
        }
        set
        {
            _Created = value;
        }
    }

    protected SqlDateTime _Modified;
    public SqlDateTime Modified
    {
        get
        {
            return _Modified;
        }
        set
        {
            _Modified = value;
        }
    }

    #endregion Properties

    #region Constructor

    public Stu_StudentDetailENTBase()
    {

    }

    #endregion Constructor

    #region ToString

    public override String ToString()
    {
        String StudentDetails_String = String.Empty;

        if (!StudentID.IsNull)
            StudentDetails_String += " StudentID = " + StudentID.Value.ToString();

        if (!StudentName.IsNull)
            StudentDetails_String += "| StudentName = " + StudentName.Value;

        if (!EnrollmentNo.IsNull)
            StudentDetails_String += "| EnrollmentNo = " + EnrollmentNo.Value;

        if (!RollNo.IsNull)
            StudentDetails_String += "| RollNo = " + RollNo.Value.ToString();

        if (!CurrentSem.IsNull)
            StudentDetails_String += "| CurrentSem = " + CurrentSem.Value.ToString();

        if (!EmailInstitute.IsNull)
            StudentDetails_String += "| EmailInstitute = " + EmailInstitute.Value;

        if (!EmailPersonal.IsNull)
            StudentDetails_String += "| EmailPersonal = " + EmailPersonal.Value;

        if (!BirthDate.IsNull)
            StudentDetails_String += "| BirthDate = " + BirthDate.Value.ToString("dd-MM-yyyy");

        if (!ContactNo.IsNull)
            StudentDetails_String += "| ContactNo = " + ContactNo.Value;

        if (!Gender.IsNull)
            StudentDetails_String += "| Gender = " + Gender.Value;

        if (!UserID.IsNull)
            StudentDetails_String += "| UserID = " + UserID.Value.ToString();

        if (!Created.IsNull)
            StudentDetails_String += "| Created = " + Created.Value.ToString("dd-MM-yyyy");

        if (!Modified.IsNull)
            StudentDetails_String += "| Modified = " + Modified.Value.ToString("dd-MM-yyyy");

        StudentDetails_String = StudentDetails_String.Trim();

        return StudentDetails_String;
    }

    #endregion ToString


}