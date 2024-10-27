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
    public partial class Sch_TeacherSubjects
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_TeacherSubjectsTableAdapter _Sch_TeacherSubjectsTableAdapter = null;
        protected Sch_TeacherSubjectsTableAdapter Sch_TeacherSubjectsTableAdapter
        {
            get
            {
                if (_Sch_TeacherSubjectsTableAdapter == null)
                {
                    _Sch_TeacherSubjectsTableAdapter = new Sch_TeacherSubjectsTableAdapter();
                }
                return _Sch_TeacherSubjectsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Teachers.Sch_TeacherSubjectsDataTable  Read(string ActionCode, long TeacherId,long Id,long SubjectId ,
    long PeriodId , long StageId, long OrgId, long BRANCHId ,string SearchText)
        {

          
            return Sch_TeacherSubjectsTableAdapter.Read(ActionCode,TeacherId, Id, SubjectId,  PeriodId,StageId,  OrgId,  BRANCHId,  SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"

        public long DML(string ActionCode,long Id,
               long TeacherId, long SubjectId, long PeriodId, long StageId, int Salarytype,decimal HourValue, decimal SalaryValue, decimal PercentageValue, string Notes,bool AllStageFlag, long OrgId, long BranchId ,  int CreatedBy,int UpdateBy,int DeletedBy, ref long? InsertedId)
            
        {
            long Result = 0;
                      
           
            Result = Convert.ToInt64((Sch_TeacherSubjectsTableAdapter.DML(ActionCode,  Id,
                TeacherId, SubjectId,  PeriodId, StageId, Salarytype, HourValue, SalaryValue, PercentageValue, Notes, AllStageFlag, BranchId,OrgId , CreatedBy,  UpdateBy,  DeletedBy, ref InsertedId)));
            return Result;
        }
        #endregion
    }
}
