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
namespace GNForm3C.DAL
{
    public abstract class Stu_StudentDetailDALBase : DataBaseConfig
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

        public Stu_StudentDetailDALBase()
        {

        }

        #endregion Constructor

        #region SelectOperation

        public Stu_StudentDetailENT SelectPK(SqlInt32 StudentID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Student_Detail_SelectPK");

                sqlDB.AddInParameter(dbCMD, "@StudentID", SqlDbType.Int, StudentID);

                Stu_StudentDetailENT entStudentDetails = new Stu_StudentDetailENT();
                DataBaseHelper DBH = new DataBaseHelper();
                using (IDataReader dr = DBH.ExecuteReader(sqlDB, dbCMD))
                {
                    while (dr.Read())
                    {
                        if (!dr["StudentID"].Equals(System.DBNull.Value))
                            entStudentDetails.StudentID = Convert.ToInt32(dr["StudentID"]);

                        if (!dr["StudentName"].Equals(System.DBNull.Value))
                            entStudentDetails.StudentName = Convert.ToString(dr["StudentName"]);

                        if (!dr["EnrollmentNo"].Equals(System.DBNull.Value))
                            entStudentDetails.EnrollmentNo = Convert.ToString(dr["EnrollmentNo"]);

                        if (!dr["RollNo"].Equals(System.DBNull.Value))
                            entStudentDetails.RollNo = Convert.ToInt32(dr["RollNo"]);

                        if (!dr["CurrentSem"].Equals(System.DBNull.Value))
                            entStudentDetails.CurrentSem = Convert.ToInt32(dr["CurrentSem"]);

                        if (!dr["EmailInstitute"].Equals(System.DBNull.Value))
                            entStudentDetails.EmailInstitute = Convert.ToString(dr["EmailInstitute"]);

                        if (!dr["EmailPersonal"].Equals(System.DBNull.Value))
                            entStudentDetails.EmailPersonal = Convert.ToString(dr["EmailPersonal"]);

                        if (!dr["BirthDate"].Equals(System.DBNull.Value))
                            entStudentDetails.BirthDate = Convert.ToDateTime(dr["BirthDate"]);

                        if (!dr["ContactNo"].Equals(System.DBNull.Value))
                            entStudentDetails.ContactNo = Convert.ToString(dr["ContactNo"]);

                        if (!dr["Gender"].Equals(System.DBNull.Value))
                            entStudentDetails.Gender = Convert.ToString(dr["Gender"]);

                        //if (!dr["UserID"].Equals(System.DBNull.Value))
                        //    entStudentDetails.UserID = Convert.ToInt32(dr["UserID"]);

                        //if (!dr["Created"].Equals(System.DBNull.Value))
                        //    entStudentDetails.Created = Convert.ToDateTime(dr["Created"]);

                        //if (!dr["Modified"].Equals(System.DBNull.Value))
                        //    entStudentDetails.Modified = Convert.ToDateTime(dr["Modified"]);
                    }
                }
                return entStudentDetails;
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

        public DataTable SelectView(SqlInt32 StudentID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Student_Detail_SelectView");

                sqlDB.AddInParameter(dbCMD, "@StudentID", SqlDbType.Int, StudentID);

                DataTable dtMST_Hospital = new DataTable("PR_Student_Detail_SelectView");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtMST_Hospital);

                return dtMST_Hospital;
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

        public DataTable SelectPage(SqlInt32 PageOffset, SqlInt32 PageSize, out Int32 TotalRecords, SqlString StudentName, SqlString EnrollmentNo, SqlInt32 CurrentSem, SqlString EmailInstitute, SqlString EmailPersonal, SqlString Gender, SqlInt32 RollNo, SqlString ContactNo)
        {
            TotalRecords = 0;
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Student_Detail_SelectPage");
                sqlDB.AddInParameter(dbCMD, "@PageOffset", SqlDbType.Int, PageOffset);
                sqlDB.AddInParameter(dbCMD, "@PageSize", SqlDbType.Int, PageSize);
                sqlDB.AddOutParameter(dbCMD, "@TotalRecords", SqlDbType.Int, 4);
                sqlDB.AddInParameter(dbCMD, "@StudentName", SqlDbType.VarChar, StudentName);
                sqlDB.AddInParameter(dbCMD, "@EnrollmentNo", SqlDbType.VarChar, EnrollmentNo);
                sqlDB.AddInParameter(dbCMD, "@CurrentSem", SqlDbType.Int, CurrentSem);
                sqlDB.AddInParameter(dbCMD, "@EmailInstitute", SqlDbType.VarChar, EmailInstitute);
                sqlDB.AddInParameter(dbCMD, "@EmailPersonal", SqlDbType.VarChar, EmailPersonal);
                sqlDB.AddInParameter(dbCMD, "@Gender", SqlDbType.VarChar, Gender);
                sqlDB.AddInParameter(dbCMD, "@RollNo", SqlDbType.Int, RollNo);
                sqlDB.AddInParameter(dbCMD, "@ContactNo", SqlDbType.VarChar, ContactNo);

                DataTable dtStudentDetails = new DataTable("PR_Student_Detail_SelectPage");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtStudentDetails);

                TotalRecords = Convert.ToInt32(dbCMD.Parameters["@TotalRecords"].Value);

                return dtStudentDetails;
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

        #region InsertOperation
        public Boolean Insert(Stu_StudentDetailENT entStudentDetails)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_StudentDetails_Insert");

                sqlDB.AddOutParameter(dbCMD, "@StudentID", SqlDbType.Int, 4);
                sqlDB.AddInParameter(dbCMD, "@StudentName", SqlDbType.NVarChar, entStudentDetails.StudentName);
                sqlDB.AddInParameter(dbCMD, "@EnrollmentNo", SqlDbType.NVarChar, entStudentDetails.EnrollmentNo);
                sqlDB.AddInParameter(dbCMD, "@RollNo", SqlDbType.Int, entStudentDetails.RollNo);
                sqlDB.AddInParameter(dbCMD, "@CurrentSem", SqlDbType.Int, entStudentDetails.CurrentSem);
                sqlDB.AddInParameter(dbCMD, "@EmailInstitute", SqlDbType.NVarChar, entStudentDetails.EmailInstitute);
                sqlDB.AddInParameter(dbCMD, "@EmailPersonal", SqlDbType.NVarChar, entStudentDetails.EmailPersonal);
                sqlDB.AddInParameter(dbCMD, "@BirthDate", SqlDbType.DateTime, entStudentDetails.BirthDate);
                sqlDB.AddInParameter(dbCMD, "@ContactNo", SqlDbType.NVarChar, entStudentDetails.ContactNo);
                sqlDB.AddInParameter(dbCMD, "@Gender", SqlDbType.NVarChar, entStudentDetails.Gender);
                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, entStudentDetails.UserID);
                sqlDB.AddInParameter(dbCMD, "@Created", SqlDbType.DateTime, entStudentDetails.Created);
                sqlDB.AddInParameter(dbCMD, "@Modified", SqlDbType.DateTime, entStudentDetails.Modified);

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.ExecuteNonQuery(sqlDB, dbCMD);

                entStudentDetails.StudentID = (SqlInt32)Convert.ToInt32(dbCMD.Parameters["@StudentID"].Value);

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

        public Boolean Update(Stu_StudentDetailENT entStudentDetails)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_StudentDetails_Update");

                sqlDB.AddInParameter(dbCMD, "@StudentID", SqlDbType.Int, entStudentDetails.StudentID);
                sqlDB.AddInParameter(dbCMD, "@StudentName", SqlDbType.NVarChar, entStudentDetails.StudentName);
                sqlDB.AddInParameter(dbCMD, "@EnrollmentNo", SqlDbType.NVarChar, entStudentDetails.EnrollmentNo);
                sqlDB.AddInParameter(dbCMD, "@RollNo", SqlDbType.Int, entStudentDetails.RollNo);
                sqlDB.AddInParameter(dbCMD, "@CurrentSem", SqlDbType.Int, entStudentDetails.CurrentSem);
                sqlDB.AddInParameter(dbCMD, "@EmailInstitute", SqlDbType.NVarChar, entStudentDetails.EmailInstitute);
                sqlDB.AddInParameter(dbCMD, "@EmailPersonal", SqlDbType.NVarChar, entStudentDetails.EmailPersonal);
                sqlDB.AddInParameter(dbCMD, "@BirthDate", SqlDbType.DateTime, entStudentDetails.BirthDate);
                sqlDB.AddInParameter(dbCMD, "@ContactNo", SqlDbType.NVarChar, entStudentDetails.ContactNo);
                sqlDB.AddInParameter(dbCMD, "@Gender", SqlDbType.NVarChar, entStudentDetails.Gender);
                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, entStudentDetails.UserID);
                sqlDB.AddInParameter(dbCMD, "@Created", SqlDbType.DateTime, entStudentDetails.Created);
                sqlDB.AddInParameter(dbCMD, "@Modified", SqlDbType.DateTime, entStudentDetails.Modified);

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


        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 StudentID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_StudentDetails_Delete");

                sqlDB.AddInParameter(dbCMD, "@StudentID", SqlDbType.Int, StudentID);

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

        #endregion DeleteOperation

    }
}