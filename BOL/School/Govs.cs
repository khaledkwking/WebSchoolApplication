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
    public partial class Govs
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private GovsTableAdapter _GovsTableAdapter = null;
        protected GovsTableAdapter GovsTableAdapter
        {
            get
            {
                if (_GovsTableAdapter == null)
                {
                    _GovsTableAdapter = new GovsTableAdapter();
                }
                return _GovsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.GovsDataTable  Read(string ActionCode,long OrgId)
        {
            return GovsTableAdapter.Read(ActionCode,  OrgId );
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
 //       #region "DML Section"


 //       public long DML(string ActionCode,long StageId ,  string StageName  ,	decimal PaymentValue ,	long  OrgId ,    long BranchId ,
	//bool IsActive ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
 //       {
 //           long Result = 0;
          
 //           //Result = Convert.ToInt64((GovsTableAdapter.DML(ActionCode,StageId,  StageName,  PaymentValue,   OrgId,  BranchId, IsActive,CreatedBy,  UpdateBy,  DeletedBy)));
 //           return Result;
 //       }
 //       #endregion
    }
}
