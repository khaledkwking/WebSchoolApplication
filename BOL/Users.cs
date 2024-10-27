using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using DAL.UsersTableAdapters;

namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Users
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private UsersTableAdapter _UsersTableAdapter = null;
        protected UsersTableAdapter UsersAdapter
        {
            get
            {
                if (_UsersTableAdapter == null)
                {
                    _UsersTableAdapter = new UsersTableAdapter();
                }
                return _UsersTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </summary>
        #region "Read Section"
        public DAL.Users.UsersDataTable Read(string ActionCode, int UserID, string UserName, string Password,long OrgId, string SearchText)
        {
            return UsersAdapter.Read(ActionCode, UserID, UserName, Password, OrgId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"
        public long DML(string ActionCode, int ID, string USER_NAME, string PASSWORD, int STATUS, int USER_TYPE, string MEMBER_ID, long Branch,
                string Name, string BackGround, long OrgId, bool ExpiredFlag, string SubEndDate, bool IsActive,
                bool IsDeleted, int CreatedBy, int UpdateBy, int DeletedBy)
        {
            long Result = 0;
            Result = Convert.ToInt64((UsersAdapter.DML(ActionCode, ID, USER_NAME, PASSWORD, STATUS, USER_TYPE, MEMBER_ID, Branch,
                 Name, BackGround, OrgId, ExpiredFlag, SubEndDate, IsActive,
                 IsDeleted, CreatedBy, UpdateBy, DeletedBy)));
            return Result;


        }
        #endregion

        //checking the user credentials on Active Directory

    }
}
