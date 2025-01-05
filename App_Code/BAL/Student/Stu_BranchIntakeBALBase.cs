using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class Stu_BranchIntakeBALBase
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

    public Stu_BranchIntakeBALBase()
    {
    }

    #endregion Constructor

    #region InsertOperation

 /*   public Boolean Insert(Stu_BranchIntakeENT stu_BranchIntakeENT)
    {
        Stu_BranchIntakeDAL stu_BranchIntakeDAL = new Stu_BranchIntakeDAL();
        if (stu_BranchIntakeDAL.Insert(stu_BranchIntakeENT))
        {
            return true;
        }
        else
        {
            this.Message = stu_BranchIntakeDAL.Message;
            return false;
        }
    }*/

    #endregion InsertOperation

    #region UpdateOperation

/*    public Boolean Update(Stu_BranchIntakeENT stu_BranchIntakeENT)
    {
        Stu_BranchIntakeDAL stu_BranchIntakeDAL = new Stu_BranchIntakeDAL();
        if (stu_BranchIntakeDAL.Update(stu_BranchIntakeENT))
        {
            return true;
        }
        else
        {
            this.Message = stu_BranchIntakeDAL.Message;
            return false;
        }
    }*/

    #endregion UpdateOperation

    #region SelectOperation
    public DataTable GetBranchIntakeDataWithYears()
    {
        Stu_BranchIntakeDAL stu_BranchIntakeDAL = new Stu_BranchIntakeDAL();

        return stu_BranchIntakeDAL.GetBranchIntakeDataWithYears();
    }
    #endregion


    /*    public void SaveBranchIntakeData(string branch, Dictionary<int, int> yearIntakeData)
        {
            Stu_BranchIntakeDAL stu_BranchIntakeDAL = new Stu_BranchIntakeDAL();

            foreach (var yearIntake in yearIntakeData)
            {
                stu_BranchIntakeDAL.SaveBranchIntakeData(branch, yearIntake.Key, yearIntake.Value);
            }
           // return true;
        }*/

    public bool SaveBranchIntakeData(DataTable branchIntakeTable )
    {
        try
        {
/*            DataTable branchIntakeTable = new DataTable();
            branchIntakeTable.Columns.Add("Branch", typeof(string));
            branchIntakeTable.Columns.Add("AdmissionYear", typeof(string));
            branchIntakeTable.Columns.Add("Intake", typeof(int));

            foreach (var entry in yearIntakeData)
            {
                branchIntakeTable.Rows.Add(branch, entry.Key.ToString(), entry.Value);
            }*/

          //  MST_BranchIntakeDAL dalMST_BranchIntake = new MST_BranchIntakeDAL();
            Stu_BranchIntakeDAL stu_BranchIntakeDAL = new Stu_BranchIntakeDAL();
            stu_BranchIntakeDAL.SaveBranchIntakeData(branchIntakeTable);
            return true;
        }
        catch (Exception ex)
        {
            //// Handle general exceptions
            //Message = ExceptionMessage(ex);
            //if (ExceptionHandler(ex))
            throw;
        }
        return false;   
    }

}