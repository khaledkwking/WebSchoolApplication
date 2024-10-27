using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.StudentsTestsTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Student_Tests
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Student_TestsTableAdapter _Student_TestsTableAdapter = null;
        protected Student_TestsTableAdapter Student_TestsTableAdapter
        {
            get
            {
                if (_Student_TestsTableAdapter == null)
                {
                    _Student_TestsTableAdapter = new Student_TestsTableAdapter();
                }
                return _Student_TestsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.StudentsTests.Student_TestsDataTable  Read(string ActionCode, string StartDate, string EndDate, long Id, long InvId, int InvType, long SubId, long OrgId, long BRANCHId, int UserId, long StudenId ,long PeriodId ,int SexId
            ,  string SearchText)
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
            //if (!String.IsNullOrEmpty(StudyStartDate))
            //{

            //    DateTime CurStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //    StudyStartDate = CurStartDate.ToString("MM/dd/yyyy");
            //}
            //if (!String.IsNullOrEmpty(StudyEndDate))
            //{
            //    DateTime CurEndDate = DateTime.ParseExact(StudyEndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //    StudyEndDate = CurEndDate.ToString("MM/dd/yyyy");
            //}
            return Student_TestsTableAdapter.Read(ActionCode,  StartDate ,EndDate, Id, InvId ,SubId, InvType , OrgId ,   BRANCHId , UserId,StudenId, PeriodId, SexId,  SearchText);
        }
      
    
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long Id ,long StudentId, long SubId,
        string TestDate,string Notes,decimal Grade, decimal MaxGrade, int WeekId  ,
        long InvId,   long OrgId ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            
            long Result = 0;
            if (!String.IsNullOrEmpty(TestDate))
            {
                
                    DateTime CurDate = Convert.ToDateTime(TestDate);
                TestDate = CurDate.ToString("MM/dd/yyyy");
                
            }
                      
            Result = Convert.ToInt64((Student_TestsTableAdapter.DML(ActionCode,
            Id,  StudentId,  SubId,TestDate,Notes,Grade, MaxGrade,WeekId, InvId,OrgId,CreatedBy,UpdateBy,  DeletedBy)));
            return Result;
        }
       
       
        #endregion
    }
}
