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
	public abstract class MST_PatientBALBase
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

		public MST_PatientBALBase()
		{

		}

        #endregion Constructor

        #region Update Operation
        public Boolean Update(MST_PatientENT entMST_Patient)
        {
            MST_PatientDAL mST_PatientDAL = new MST_PatientDAL();
            if (mST_PatientDAL.Update(entMST_Patient))
            {
                return true;
            }
            else
            {
                this.Message = mST_PatientDAL.Message;
                return false;
            }
        }
        #endregion

        #region Insert Operation
        public Boolean Insert(MST_PatientENT entMST_Patient)
        {
            MST_PatientDAL mST_PatientDAL = new MST_PatientDAL();   
            if (mST_PatientDAL.Insert(entMST_Patient))
            {
                return true;
            }
            else
            {
                this.Message = mST_PatientDAL.Message;
                return false;
            }
        }

        public SqlInt32 InsertPatient(MST_PatientENT entMST_Patient)
        {
            MST_PatientDAL dalMST_Patient = new MST_PatientDAL();
            SqlInt32 PatientID = dalMST_Patient.InsertPatient(entMST_Patient);

            if (PatientID > 0)
            {
                return PatientID;
            }
            else
            {
                this.Message = dalMST_Patient.Message;
                return PatientID;
            }
        }
        #endregion

        #region Select Operation

        public DataTable SelectView(SqlInt32 PatientID)
        {
            MST_PatientDAL dalMST_Patient = new MST_PatientDAL();
            return dalMST_Patient.SelectView(PatientID);
        }

        public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlString PatientName, SqlInt32 Age, SqlString MobileNo, SqlDateTime DOB)
        {
            MST_PatientDAL dalMST_Patient = new MST_PatientDAL();
            return dalMST_Patient.SelectPage(PageOffset, PageSize, out TotalRecords, PatientName, Age, MobileNo,DOB);
        }

        public MST_PatientENT SelectPK(SqlInt32 PatientID)
        {
           // MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();

            MST_PatientDAL mST_PatientDAL = new MST_PatientDAL();
            return mST_PatientDAL.SelectPK(PatientID);
        }

        public Boolean Delete(SqlInt32 PatientID)
        {
            // MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();

            MST_PatientDAL mST_PatientDAL = new MST_PatientDAL();
            return mST_PatientDAL.Delete(PatientID);
        }
        public DataTable RPT_PatientIDCard(SqlInt32 PatientID)
        {
            MST_PatientDAL dalMST_Patient = new MST_PatientDAL();
            return dalMST_Patient.RPT_PatientIDCard(PatientID);
        }
        #endregion

        #region AutoComplete
        public DataTable AutoComplete(SqlString prefixText, SqlString contextText)
        {
            MST_PatientDAL dalMST_Patient = new MST_PatientDAL();
            return dalMST_Patient.AutoComplete(prefixText, contextText);
        }
        #endregion AutoComplete
    }


}