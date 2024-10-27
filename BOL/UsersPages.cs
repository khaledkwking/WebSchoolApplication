using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Net;
using DAL.UsersPagesTableAdapters;

namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class UsersPages
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private UsersPagesTableAdapter _UsersPagesTableAdapter = null;
        protected UsersPagesTableAdapter UsersPagesAdapter
        {
            get
            {
                if (_UsersPagesTableAdapter == null)
                {
                    _UsersPagesTableAdapter = new UsersPagesTableAdapter();
                }
                return _UsersPagesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </summary>
        #region "Read Section"
        public DAL.UsersPages.UsersPagesDataTable Read(string ActionCode, int UserID, int PageID, string SearchText)
        {
            return UsersPagesAdapter.Read(ActionCode,UserID,PageID,SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"
        public long DML(string ActionCode,int PageID, int UserID, int Accessing, int Adding, int Updating, int Deleting, int Importing, int CreatedBy, int UpdateBy,int DeletedBy)
        {
            long Result = 0;
            Result = Convert.ToInt64((UsersPagesAdapter.DML(ActionCode,PageID,UserID,Accessing,Adding,Updating,Deleting,Importing,CreatedBy,UpdateBy,DeletedBy)));
            return Result;
        }
        #endregion

    }
}
