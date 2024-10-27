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
    public partial class Sch_LastInvoices
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_LastInvoicesTableAdapter _Sch_LastInvoicesTableAdapter = null;
        protected Sch_LastInvoicesTableAdapter Sch_LastInvoicesTableAdapter
        {
            get
            {
                if (_Sch_LastInvoicesTableAdapter == null)
                {
                    _Sch_LastInvoicesTableAdapter = new Sch_LastInvoicesTableAdapter();
                }
                return _Sch_LastInvoicesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_LastInvoicesDataTable  Read(string ActionCode, string StartDate, string EndDate, long InvId, int InvType, int PayementTypeId, long OrgId, long BRANCHId, int UserId, long StudenId ,long PeriodId ,int SexId
            , string StudyStartDate, string StudyEndDate,
            string SearchText, int FinishFlag)
        {
            if (!String.IsNullOrEmpty(StartDate))
            {

                DateTime CurStartDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurEndDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurEndDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(StudyStartDate))
            {

                DateTime CurStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StudyStartDate = CurStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(StudyEndDate))
            {
                DateTime CurEndDate = DateTime.ParseExact(StudyEndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StudyEndDate = CurEndDate.ToString("MM/dd/yyyy");
            }
            return Sch_LastInvoicesTableAdapter.Read(ActionCode,  StartDate ,EndDate,  InvId , InvType , PayementTypeId , OrgId ,   BRANCHId , UserId,StudenId, PeriodId, SexId, StudyStartDate, StudyEndDate, SearchText, FinishFlag);
        }
       
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        
  
       
        #endregion
    }
}
