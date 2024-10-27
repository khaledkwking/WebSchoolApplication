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
    public partial class Sch_TeacherSubjectsGovs
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_TeacherSubjectsGovsTableAdapter _Sch_TeacherSubjectsGovsTableAdapter = null;
        protected Sch_TeacherSubjectsGovsTableAdapter Sch_TeacherSubjectsGovsTableAdapter
        {
            get
            {
                if (_Sch_TeacherSubjectsGovsTableAdapter == null)
                {
                    _Sch_TeacherSubjectsGovsTableAdapter = new Sch_TeacherSubjectsGovsTableAdapter();
                }
                return _Sch_TeacherSubjectsGovsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"


        public DAL.Teachers.Sch_TeacherSubjectsGovsDataTable  Read(string ActionCode, long TeacherId,long SubjectId ,
    long PeriodId , long StageId,int GovId, long OrgId,int SubjectCommonId,  long BRANCHId ,string SearchText)
        {

          
            return Sch_TeacherSubjectsGovsTableAdapter.Read(ActionCode,TeacherId, SubjectId,  PeriodId,StageId, GovId, OrgId, SubjectCommonId,  BRANCHId,  SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"

        //public long DML(string ActionCode,long Id,
        //       long TeacherId, long SubjectId, long PeriodId, long StageId, int Salarytype,decimal HourValue, decimal SalaryValue, decimal PercentageValue, string Notes,bool AllStageFlag, long OrgId, long BranchId ,  int CreatedBy,int UpdateBy,int DeletedBy, ref long? InsertedId)
            
        //{
        //    long Result = 0;
                      
           
        //    Result = Convert.ToInt64((Sch_TeacherSubjectsGovsTableAdapter.DML(ActionCode,  Id,
        //        TeacherId, SubjectId,  PeriodId, StageId, Salarytype, HourValue, SalaryValue, PercentageValue, Notes, AllStageFlag, BranchId,OrgId , CreatedBy,  UpdateBy,  DeletedBy, ref InsertedId)));
        //    return Result;
        //}
        #endregion
    }
}
