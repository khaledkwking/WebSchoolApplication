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
    public partial class Sch_Subjects
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_SubjectsTableAdapter _Sch_SubjectsTableAdapter = null;
        protected Sch_SubjectsTableAdapter Sch_SubjectsTableAdapter
        {
            get
            {
                if (_Sch_SubjectsTableAdapter == null)
                {
                    _Sch_SubjectsTableAdapter = new Sch_SubjectsTableAdapter();
                }
                return _Sch_SubjectsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_SubjectsDataTable  Read(string ActionCode, long SubId,long PeriodId,long OrgId, long BranchId, string SearchText)
        {
            return Sch_SubjectsTableAdapter.Read(ActionCode,SubId ,PeriodId ,OrgId , BranchId,  SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,
          
	long SubId , string SubCode , string SubName ,
	long PeriodId ,decimal GroupHours ,decimal PersonHours ,
	decimal MonthPrice  ,decimal HourPrice, int SubjectCommonId, string Notes , long OrgId, long BranchId ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
        {

            long Result = 0;
          
            Result = Convert.ToInt64((Sch_SubjectsTableAdapter.DML(ActionCode, SubId, SubCode,SubName,
                PeriodId,GroupHours,PersonHours,MonthPrice,HourPrice, SubjectCommonId,Notes, BranchId, OrgId,  CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
