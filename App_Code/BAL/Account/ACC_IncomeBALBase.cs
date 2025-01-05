using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlTypes;
using GNForm3C;
using GNForm3C.DAL;
using GNForm3C.ENT;

namespace GNForm3C.BAL
{
    public abstract class ACC_IncomeBALBase
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

        public ACC_IncomeBALBase()
        {

        }

        #endregion Constructor

        #region InsertOperation

        public Boolean Insert(ACC_IncomeENT entACC_Income)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            if (dalACC_Income.Insert(entACC_Income))
            {
                return true;
            }
            else
            {
                this.Message = dalACC_Income.Message;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(ACC_IncomeENT entACC_Income)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            if (dalACC_Income.Update(entACC_Income))
            {
                return true;
            }
            else
            {
                this.Message = dalACC_Income.Message;
                return false;
            }
        }

        #endregion UpdateOperation

        #region UpsertOperation

        public Boolean Upsert(DataTable dtIncomeTable)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            if (dalACC_Income.Upsert(dtIncomeTable))
            {
                return true;
            }
            else
            {
                this.Message = dalACC_Income.Message;
                return false;
            }
        }

        #region UpsertOpration XML
        public Boolean Upsertxml(string xmlData)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            if (dalACC_Income.Upsertxml(xmlData))
            {
                return true;
            }
            else
            {
                this.Message = dalACC_Income.Message;
                return false;
            }
        }


        #endregion UpsertOpration XML

        #endregion UpsertOperation


        #region DeleteOperation

        public Boolean Delete(SqlInt32 IncomeID)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            if (dalACC_Income.Delete(IncomeID))
            {
                return true;
            }
            else
            {
                this.Message = dalACC_Income.Message;
                return false;
            }
        }

        #endregion DeleteOperation

        public Boolean DeleteMultiple(string ledgerIdsList)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            if (dalACC_Income.DeleteMultiple(ledgerIdsList))
            {
                return true;
            }
            else
            {
                this.Message = dalACC_Income.Message;
                return false;
            }
        }

        #region SelectOperation

        public ACC_IncomeENT SelectPK(SqlInt32 IncomeID)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            return dalACC_Income.SelectPK(IncomeID);
        }
        public DataTable SelectView(SqlInt32 IncomeID)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            return dalACC_Income.SelectView(IncomeID);
        }
        public DataTable SelectAll()
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            return dalACC_Income.SelectAll();
        }
        public DataTable SelectShowByHospital(SqlInt32 HospitalID)
        {
            ACC_IncomeDAL aCC_IncomeDAL = new ACC_IncomeDAL();
            return aCC_IncomeDAL.SelectShowByHospital(HospitalID);
        }
        public DataTable SelectShow(SqlInt32 FinYearID, SqlInt32 HospitalID, SqlInt32 IncomeTypeID)
        {
            ACC_IncomeDAL dalACC_IncomeDAL = new ACC_IncomeDAL();
            return dalACC_IncomeDAL.SelectShow(FinYearID, HospitalID, IncomeTypeID);
        }
        public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlInt32 IncomeTypeID, SqlDecimal Amount, SqlDateTime IncomeDate, SqlInt32 HospitalID, SqlInt32 FinYearID)
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            return dalACC_Income.SelectPage(PageOffset, PageSize, out TotalRecords, IncomeTypeID, Amount, IncomeDate, HospitalID, FinYearID);
        }

        #endregion SelectOperation

        #region ComboBox

        public DataTable SelectComboBox()
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            return dalACC_Income.SelectComboBox();
        }


        #endregion ComboBox



        #region RDLC (Reports)
        public DataTable Report_ACC_Income_ByFinYear()
        {
            ACC_IncomeDAL dalACC_Income = new ACC_IncomeDAL();
            return dalACC_Income.Report_ACC_Income_ByFinYear();
        }

        #endregion RDLC (Reports)

    }

}