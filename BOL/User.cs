using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL.NEWERPDataSetTableAdapters;

namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class User
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private USERTableAdapter _USERTableAdapter = null;
        protected USERTableAdapter UsersAdapter
        {
            get
            {
                if (_USERTableAdapter == null)
                {
                    _USERTableAdapter = new USERTableAdapter();
                }
                return _USERTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.NEWERPDataSet.USERDataTable Read(string ActionCode, int UserId, long OrgId , string UserName, string Password, string SearchText)
        {
            return UsersAdapter.Read(ActionCode, UserId, OrgId, UserName, Password, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"
       
 
        public long DML(string ActionCode, int UserId, string UserName, string Password, int Status, int UserType,
                        string MEMBER_ID, long Branch , string Name, string BackGround, long OrgId)
        {
            long Result = 0;
            Result = Convert.ToInt64((UsersAdapter.DML(ActionCode, UserId, UserName, Password, Status, UserType,
                         MEMBER_ID,  Branch ,  Name,  BackGround,  OrgId)));
            return Result;
        }
        #endregion
    }
}