using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.SystemPagesTableAdapters;


namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class SystemPages
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private SystemPagesTableAdapter _SystemPagesTableAdapter = null;
        protected SystemPagesTableAdapter SystemPagesAdapter
        {
            get
            {
                if (_SystemPagesTableAdapter == null)
                {
                    _SystemPagesTableAdapter = new SystemPagesTableAdapter();
                }
                return _SystemPagesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </summary>
        #region "Read Section"
        public DAL.SystemPages.SystemPagesDataTable Read(string ActionCode, int PageID)
        {
            return SystemPagesAdapter.Read(ActionCode,PageID);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"
        public long DML(string ActionCode, int PageID, string RoleName, string RoleNameAr, string PageLink, string PageDescription,int IsDeleted, int CreatedBy, int UpdateBy, int DeletedBy)
        {
            long Result = 0;
            Result = Convert.ToInt64((SystemPagesAdapter.DML(ActionCode,PageID,RoleName,RoleNameAr,PageLink,PageDescription,IsDeleted,CreatedBy,UpdateBy,DeletedBy)));
            return Result;
        }
        #endregion
    }
}
