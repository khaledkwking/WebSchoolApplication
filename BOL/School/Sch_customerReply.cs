using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.CustomersTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_customerReply
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_customerReplyTableAdapter _Sch_customerReplyTableAdapter = null;
        protected Sch_customerReplyTableAdapter Sch_customerReplyTableAdapter
        {
            get
            {
                if (_Sch_customerReplyTableAdapter == null)
                {
                    _Sch_customerReplyTableAdapter = new Sch_customerReplyTableAdapter();
                }
                return _Sch_customerReplyTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Customers.Sch_customerReplyDataTable  Read(string ActionCode,long Id, long OrgId,long BranchId, string SearchText)
        {
            
            return Sch_customerReplyTableAdapter.Read(ActionCode,Id,  OrgId, BranchId,SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"

 
   //     public long DML(string ActionCode,long CallId, long CustId,int ReplyId,string DayDate,string DayTime,string ReplyNotes,long userId,string Tel,string Notes
   //,long BranchId,long OrgId,int CreatedBy,int UpdateBy,int DeletedBy)

   //     {
   //         long Result = 0;
   //         if (!String.IsNullOrEmpty(DayDate))
   //         {

   //             DateTime CurDate = Convert.ToDateTime(DayDate);
   //             DayDate = CurDate.ToString("MM/dd/yyyy");

   //         }
   //         if (!String.IsNullOrEmpty(DayTime))
   //         {

   //             DateTime CurStudyEndDate = Convert.ToDateTime(DayTime);
   //             DayTime = CurStudyEndDate.ToString("MM/dd/yyyy");
   //         }
   //         Result = Convert.ToInt64((Sch_customerReplyTableAdapter.DML(ActionCode, CallId,  CustId,  ReplyId,  DayDate,  DayTime,  ReplyNotes,  userId,  Tel,  Notes , 
   //          BranchId,  OrgId,  CreatedBy,  UpdateBy,  DeletedBy)));
   //         return Result;
   //     }
        #endregion
    }
}
