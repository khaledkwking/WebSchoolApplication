using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.SchoolGroupsTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_GroupSubjects
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_GroupSubjectsTableAdapter _Sch_GroupSubjectsTableAdapter = null;
        protected Sch_GroupSubjectsTableAdapter Sch_GroupSubjectsTableAdapter
        {
            get
            {
                if (_Sch_GroupSubjectsTableAdapter == null)
                {
                    _Sch_GroupSubjectsTableAdapter = new Sch_GroupSubjectsTableAdapter();
                }
                return _Sch_GroupSubjectsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.SchoolGroups.Sch_GroupSubjectsDataTable  Read(string ActionCode, string StartDate, string EndDate , long Id, long GroupId, long SubjectId, long PeriodId,int UserId, long OrgId,long BranchId, string SearchText)
        {
            return Sch_GroupSubjectsTableAdapter.Read(ActionCode, StartDate,  EndDate,Id,GroupId,SubjectId, PeriodId, OrgId, BranchId,UserId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long Id,long GroupId , long SubjectId ,long TeacherId ,decimal Price ,
	string StartTime , string EndTime ,long ClassId ,int LecNo ,
	int DayNum ,	int LecIndex ,	string ModifiedDate, string DayDate , long BranchId,long OrgId,int CreatedBy,int UpdateBy,int DeletedBy)

        {
            long Result = 0;
            if (!String.IsNullOrEmpty(StartTime))
            {

                DateTime CurStudyEndDate = Convert.ToDateTime(StartTime);
                StartTime = CurStudyEndDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(EndTime))
            {
                DateTime CurStudyStartDate = Convert.ToDateTime(EndTime);
                //DateTime CurStudyStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndTime = CurStudyStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(ModifiedDate))
            {
                DateTime CurStudyStartDate = Convert.ToDateTime(ModifiedDate);
                //DateTime CurStudyStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                ModifiedDate = CurStudyStartDate.ToString("MM/dd/yyyy");
            }
            Result = Convert.ToInt64((Sch_GroupSubjectsTableAdapter.DML(ActionCode, Id,  GroupId,  SubjectId,  TeacherId,  Price,
            StartTime,  EndTime,  ClassId,  LecNo,  DayNum,  LecIndex,  ModifiedDate, DayDate,  BranchId,  OrgId,  CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
