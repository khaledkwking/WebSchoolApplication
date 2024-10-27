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
    public partial class Cde_Area
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Cde_AreaTableAdapter _Cde_AreaTableAdapter = null;
        protected Cde_AreaTableAdapter StagesTableAdapter
        {
            get
            {
                if (_Cde_AreaTableAdapter == null)
                {
                    _Cde_AreaTableAdapter = new Cde_AreaTableAdapter();
                }
                return _Cde_AreaTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Cde_AreaDataTable  Read(string ActionCode,long OrgId)
        {
            return StagesTableAdapter.Read(ActionCode,  OrgId );
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
          
            //Result = Convert.ToInt64((StagesTableAdapter.DML(ActionCode,StageId,  StageName,  PaymentValue,   OrgId,  BranchId, IsActive,CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
