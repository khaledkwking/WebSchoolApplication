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
    public partial class Sch_SubjectCommon
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_SubjectCommonTableAdapter _Sch_SubjectCommonTableAdapter = null;
        protected Sch_SubjectCommonTableAdapter StagesTableAdapter
        {
            get
            {
                if (_Sch_SubjectCommonTableAdapter == null)
                {
                    _Sch_SubjectCommonTableAdapter = new Sch_SubjectCommonTableAdapter();
                }
                return _Sch_SubjectCommonTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_SubjectCommonDataTable  Read(string ActionCode,long SubjectCommonId, long OrgId , long BranchId )
        {
            return StagesTableAdapter.Read(ActionCode, SubjectCommonId, OrgId, BranchId);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


 //       public long DML(string ActionCode,long StageId ,  string StageName  ,	decimal PaymentValue ,	long  OrgId ,    long BranchId ,
	//bool IsActive ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
 //       {
 //           long Result = 0;
          
 //           Result = Convert.ToInt64((StagesTableAdapter.DML(ActionCode,StageId,  StageName,  PaymentValue,   OrgId,  BranchId, IsActive,CreatedBy,  UpdateBy,  DeletedBy)));
 //           return Result;
 //       }
        #endregion
    }
}
