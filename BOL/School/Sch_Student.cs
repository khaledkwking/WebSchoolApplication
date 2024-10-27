using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.SchoolTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_Student
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private StudentTableAdapter _StudentTableAdapter = null;
        protected StudentTableAdapter StudentTableAdapter
        {
            get
            {
                if (_StudentTableAdapter == null)
                {
                    _StudentTableAdapter = new StudentTableAdapter();
                }
                return _StudentTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.StudentDataTable  Read(string ActionCode, long OrgId, long StudentId,long PeriodId,long BranchId, string SearchText)
        {
            return StudentTableAdapter.Read(ActionCode, OrgId,StudentId,PeriodId, BranchId,SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long StudentId, string StudentCode,int  Sex ,  string StudentName,
    int NatId, string SchoolName,int SchoolType,long PeriodId,string StudentCivilId,
    string FatherTel,string MotherTel,string OtherTel,string StudentTel,string FatherName,string BrithDate,string Kinship,string Email,    int Area,
    string BlockNo, string Street,string Gada,string HouseNo,string FloorNo,int KnowToIns,string Note,
    string InstituteName,  string LeaveReason,string HomeTel, bool PervStudyFlag,string SalesMan,int UserId, 
    int SchoolGovId,  long EmpId, long BranchId,long OrgId,int CreatedBy,int UpdateBy,int DeletedBy)

        {
            long Result = 0;
            if (!String.IsNullOrEmpty(BrithDate))
            {
                DateTime CurDate = Convert.ToDateTime(BrithDate);
                BrithDate = CurDate.ToString("MM/dd/yyyy");
            }
            Result = Convert.ToInt64((StudentTableAdapter.DML(ActionCode,  StudentId,  StudentCode, Sex,  StudentName,
     NatId,  SchoolName,  SchoolType,  PeriodId,  StudentCivilId,FatherTel,  MotherTel,  OtherTel,  StudentTel, FatherName,  BrithDate,  Kinship,  Email,  Area, BlockNo,  Street,  Gada,  HouseNo,  FloorNo,  KnowToIns,  Note,
     InstituteName,  LeaveReason,  HomeTel,  PervStudyFlag,  SalesMan,  UserId,     SchoolGovId,  EmpId,  BranchId,  OrgId,  CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
