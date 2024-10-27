using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.UserRolesTableAdapters;


namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class UserRoles
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private UsersRolesTableAdapter _UserRolesTableAdapter = null;
        protected UsersRolesTableAdapter UserRolesAdapter
        {
            get
            {
                if (_UserRolesTableAdapter == null)
                {
                    _UserRolesTableAdapter = new UsersRolesTableAdapter();
                }
                return _UserRolesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </summary>
        #region "Read Section"
        public DAL.UserRoles.UsersRolesDataTable Read(string ActionCode, int RoleID)
        {
            return UserRolesAdapter.Read(ActionCode,RoleID);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"
        public long DML(string ActionCode, int RoleID, string RoleName, string RoleNameAr, string Roledescription)
        {
            long Result = 0;
            Result = Convert.ToInt64((UserRolesAdapter.DML(ActionCode,RoleID,RoleName,RoleNameAr, Roledescription)));
            return Result;
        }
        #endregion
    }
}
