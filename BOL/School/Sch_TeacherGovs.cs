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
    public partial class Sch_TeacherGovs
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_TeacherGovsTableAdapter _Sch_TeacherGovsTableAdapter = null;
        protected Sch_TeacherGovsTableAdapter Sch_TeacherGovsTableAdapter
        {
            get
            {
                if (_Sch_TeacherGovsTableAdapter == null)
                {
                    _Sch_TeacherGovsTableAdapter = new Sch_TeacherGovsTableAdapter();
                }
                return _Sch_TeacherGovsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Teachers.Sch_TeacherGovsDataTable  Read(string ActionCode, long TeacherId,long Id,int GovId ,
     long OrgId, long BRANCHId ,string SearchText)
        {

          
            return Sch_TeacherGovsTableAdapter.Read(ActionCode,TeacherId, Id, GovId, OrgId,  BRANCHId,  SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"

        public long DML(string ActionCode,long Id,
               long TeacherId, int GovId,  string Notes, long OrgId, long BranchId ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
                      
           
            Result = Convert.ToInt64((Sch_TeacherGovsTableAdapter.DML(ActionCode, Id,
                TeacherId, GovId, Notes, BranchId,OrgId , CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
