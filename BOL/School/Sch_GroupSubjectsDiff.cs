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
    public partial class Sch_GroupSubjectsDiff
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_GroupSubjectsDiffTableAdapter _Sch_GroupSubjectsDiffTableAdapter = null;
        protected Sch_GroupSubjectsDiffTableAdapter Sch_GroupSubjectsDiffTableAdapter
        {
            get
            {
                if (_Sch_GroupSubjectsDiffTableAdapter == null)
                {
                    _Sch_GroupSubjectsDiffTableAdapter = new Sch_GroupSubjectsDiffTableAdapter();
                }
                return _Sch_GroupSubjectsDiffTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.SchoolGroups.Sch_GroupSubjectsDiffDataTable  Read(string ActionCode, string StartDate, string EndDate , long Id, long GroupId, long SubjectId, long PeriodId,int UserId, long OrgId,long BranchId, string SearchText)
        {
            return Sch_GroupSubjectsDiffTableAdapter.Read(ActionCode, StartDate,  EndDate,Id,GroupId,SubjectId, PeriodId, OrgId, BranchId,UserId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


      
        #endregion
    }
}
