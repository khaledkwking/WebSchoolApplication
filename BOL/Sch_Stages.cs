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
    public partial class Sch_Stages
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_StagesTableAdapter _Sch_StagesTableAdapter = null;
        protected Sch_StagesTableAdapter StagesTableAdapter
        {
            get
            {
                if (_Sch_StagesTableAdapter == null)
                {
                    _Sch_StagesTableAdapter = new Sch_StagesTableAdapter();
                }
                return _Sch_StagesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_StagesDataTable  Read(string ActionCode,long StageId)
        {
            return StagesTableAdapter.Read(ActionCode, StageId);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long StageId ,  string StageName  ,	decimal PaymentValue ,	long  OrgId ,    long BranchId ,
	bool IsActive ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
          
            Result = Convert.ToInt64((StagesTableAdapter.DML(ActionCode,StageId,  StageName,  PaymentValue,   OrgId,  BranchId, IsActive,CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
