using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Web;


public class Stu_BranchIntakeENTBase
{
    #region Constructor

    public Stu_BranchIntakeENTBase()
    {

    }

    #endregion Constructor

    #region Properties

    protected SqlString _Branch;
    public SqlString Branch
    {
        get
        {
            return _Branch;
        }
        set
        {
            _Branch = value;
        }
    }

    protected SqlInt32 _AdmissionYear;
    public SqlInt32 AdmissionYear
    {
        get
        {
            return _AdmissionYear;
        }
        set
        {
            _AdmissionYear = value;
        }
    }

    protected SqlInt32 _Intake;
    public SqlInt32 Intake
    {
        get
        {
            return _Intake;
        }
        set
        {
            _Intake = value;
        }
    }

    #endregion Properties

    #region ToString
    public override string ToString()
    {
        String branchIntakeString = String.Empty;

        if (!Branch.IsNull)
            branchIntakeString += "| Branch = " + Branch.Value;

        if (!AdmissionYear.IsNull)
            branchIntakeString += "| AdmissionYear = " + AdmissionYear.Value.ToString();

        if (!Intake.IsNull)
            branchIntakeString += "| Intake = " + Intake.Value.ToString();

        return branchIntakeString.ToString();
    }

    #endregion

}