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
    public partial class Sch_Groups
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>

        private Sch_GroupsTableAdapter _Sch_GroupsTableAdapter = null;
        protected Sch_GroupsTableAdapter Sch_GroupsTableAdapter
        {
            get
            {
                if (_Sch_GroupsTableAdapter == null)
                {
                    _Sch_GroupsTableAdapter = new Sch_GroupsTableAdapter();
                }
                return _Sch_GroupsTableAdapter;
            }
        }


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.SchoolGroups.Sch_GroupsDataTable Read(string ActionCode, string StartDate, string EndDate, long GroupId, long PeriodId, int UserId,long OrgId, long BranchId, string SearchText)
        {
            return Sch_GroupsTableAdapter.Read(ActionCode,  StartDate,  EndDate, GroupId,  PeriodId, OrgId , BranchId, UserId,SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long GoupId,string GroupCode ,
	string GroupName,short  GroupType ,int StudentNum ,int StudentMaxNum ,	long PeriodId ,   string EnterDate ,
	long InvId ,long StudentId ,decimal GroupPrice ,string StartDate ,string EndDate ,decimal MonthGroupPrice,	short GroupCatId ,
    string ModifiedDate ,	int UserId , long BranchId, long OrgId, int CreatedBy, int UpdateBy, int DeletedBy)

        {
            long Result = 0;
            if (!String.IsNullOrEmpty(EnterDate))
            {

                DateTime CurStudyEndDate = Convert.ToDateTime(EnterDate);
                EnterDate = CurStudyEndDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(StartDate))
            {
                DateTime CurStudyStartDate = Convert.ToDateTime(StartDate);
                //DateTime CurStudyStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurStudyStartDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurStudyStartDate = Convert.ToDateTime(EndDate);
                //DateTime CurStudyStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurStudyStartDate.ToString("MM/dd/yyyy");
            }

            Result = Convert.ToInt64((Sch_GroupsTableAdapter.DML(ActionCode, GoupId,  GroupCode,
     GroupName,  GroupType,  StudentNum,  StudentMaxNum,  PeriodId,  EnterDate, InvId,  StudentId,  GroupPrice,  StartDate,  EndDate,  MonthGroupPrice,  GroupCatId,
     ModifiedDate,  UserId, BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy)));
            return Result;
        }
        #endregion
    }
}
