using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.TeachersTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_Teachers
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_TeachersTableAdapter _Sch_TeachersTableAdapter = null;
        protected Sch_TeachersTableAdapter Sch_TeachersTableAdapter
        {
            get
            {
                if (_Sch_TeachersTableAdapter == null)
                {
                    _Sch_TeachersTableAdapter = new Sch_TeachersTableAdapter();
                }
                return _Sch_TeachersTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Teachers.Sch_TeachersDataTable  Read(string ActionCode, long TeacherId, long subjectId, long PeriodId,  long OrgId, long BRANCHId, int UserId, long StudenId , string UserName, string Password,int AreaId, string SearchText)
        {
            //if (!String.IsNullOrEmpty(StartDate))
            //{

            //    DateTime CurStartDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //    StartDate = CurStartDate.ToString("MM/dd/yyyy");
            //}
            //if (!String.IsNullOrEmpty(EndDate))
            //{
            //    DateTime CurEndDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //    EndDate = CurEndDate.ToString("MM/dd/yyyy");
            //}
            return Sch_TeachersTableAdapter.Read(ActionCode,TeacherId, subjectId,  PeriodId, OrgId ,   BRANCHId ,UserName,Password,AreaId, SearchText  );
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,
               long TeacherId,   string TeacherCode, string Name  ,  string HireDate,  int NatId,  string CivilId,
    string Username,string Password, string Tel,string HomeTel ,string Email , decimal SalaryValue,
   int GenderId, bool Licence,string EducationalTitle, int AreaId,int GovId, string Address,long OrgId, long BranchId ,string Notes, string ContractDesc,  int CreatedBy,int UpdateBy,int DeletedBy, ref long? InsertedId)
            
        {
            long Result = 0;
            if (!String.IsNullOrEmpty(HireDate))
            {
                
                    DateTime CurDate = Convert.ToDateTime(HireDate);
                HireDate = CurDate.ToString("MM/dd/yyyy");
                
            }
           
           
            Result = Convert.ToInt64((Sch_TeachersTableAdapter.DML(ActionCode, TeacherId,
             TeacherCode,  Name,  HireDate,  NatId,  CivilId, Username,  Password,  Tel,  HomeTel,  Email, SalaryValue, GenderId, Licence, EducationalTitle,AreaId,GovId,Address, BranchId,OrgId , Notes,  ContractDesc, CreatedBy,  UpdateBy,  DeletedBy, ref InsertedId)));
            return Result;
        }
        #endregion
    }
}
