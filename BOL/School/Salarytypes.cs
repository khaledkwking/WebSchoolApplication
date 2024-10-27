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
    public partial class Salarytypes
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private SalarytypesTableAdapter _SalarytypesTableAdapter = null;
        protected SalarytypesTableAdapter StagesTableAdapter
        {
            get
            {
                if (_SalarytypesTableAdapter == null)
                {
                    _SalarytypesTableAdapter = new SalarytypesTableAdapter();
                }
                return _SalarytypesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Teachers.SalarytypesDataTable  Read(string ActionCode,long SalarytypeId, long OrgId , long BranchId )
        {
            return StagesTableAdapter.Read(ActionCode, SalarytypeId, OrgId, BranchId);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long SalarytypeId,  string Salarytype ,	long  OrgId ,    long BranchId ,
	bool IsActive ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
          
            Result = Convert.ToInt64((StagesTableAdapter.DML(ActionCode, SalarytypeId, Salarytype, OrgId,  BranchId)));
            return Result;
        }
        #endregion
    }
}
