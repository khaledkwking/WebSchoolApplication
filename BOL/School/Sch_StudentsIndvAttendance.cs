using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL.StudentsIndvAttendanceTableAdapters;

namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_StudentsIndvAttendance
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_StudentsIndvAttendanceTableAdapter _Sch_StudentsIndvAttendanceTableAdapter = null;
        protected Sch_StudentsIndvAttendanceTableAdapter Sch_StudentsIndvAttendanceTableAdapter
        {
            get
            {
                if (_Sch_StudentsIndvAttendanceTableAdapter == null)
                {
                    _Sch_StudentsIndvAttendanceTableAdapter = new Sch_StudentsIndvAttendanceTableAdapter();
                }
                return _Sch_StudentsIndvAttendanceTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.StudentsIndvAttendance.Sch_StudentsIndvAttendanceDataTable  Read(string ActionCode,long Id,
        string StartDate, string EndDate, long InvId,long InvDetId,long SubjectId ,long periodId,long TeacherId ,int InvType,long OrgId ,long BRANCHId ,
	    int UserId ,long StudentId ,bool AttFlag, string SearchText )
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
            return Sch_StudentsIndvAttendanceTableAdapter.Read( ActionCode, Id,
         StartDate,  EndDate,  InvId,  InvDetId,  SubjectId,  periodId,  TeacherId,  InvType,  OrgId, BRANCHId,
         UserId,  StudentId,AttFlag,  SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,  long Id, long StudentId, long TeacherId, long InvDetId,
        long SubjectId, string DayDate, string DayTime,decimal Hours,decimal TeacherValue ,bool AttFlag ,
	    bool ExceptionFlag ,bool NotifyFlag,string Notes,string StudentAddress,long BranchId, long OrgId ,int CreatedBy,int UpdateBy,int DeletedBy
         , int RepeatFlag, int RepeatNumber, decimal RemainHours, long? InsertedId, long ? RepeatCount )
            
        {
            long Result = 0;
            long ret = 0;
            string CurDayDate;
            DateTime CurDate;
            DateTime CurDayTimeDate;

            if (!String.IsNullOrEmpty(DayDate))
            {
                
                CurDate = Convert.ToDateTime(DayDate);
                CurDayDate = CurDate.ToString("MM/dd/yyyy");
                
            }
            if (!String.IsNullOrEmpty(DayTime))
            {

                CurDate = Convert.ToDateTime(DayDate);
                CurDayTimeDate = Convert.ToDateTime(DayTime);
                //CurDayTimeDate = DateTime.Parse (CurDate.ToShortDateString() + " " + CurDayTimeDate.ToShortTimeString());
                //DateTime CurDayTime = Convert.ToDateTime(DayTime);

            }
            decimal TotalRemain = RemainHours;
            CurDate = Convert.ToDateTime(DayDate);

            long tempResult = 0;
            if (RepeatFlag == 1 && ActionCode == "1") // when repeat appointment
            {
                if (RemainHours > 0 )
                {
              
                    //TotalRemain = TotalRemain - Hours;
                    CurDayTimeDate = Convert.ToDateTime(DayTime);

                    while (TotalRemain >= 0 && RepeatNumber>0)
                    {
                                                
                        CurDayTimeDate = DateTime.Parse(CurDate.ToShortDateString() + " " + CurDayTimeDate.ToShortTimeString());

                        CurDayDate = CurDate.ToString("MM/dd/yyyy");

                        DayTime = CurDayTimeDate.ToString("MM/dd/yyyy HH:mm:ss");

                        Result = Convert.ToInt64((Sch_StudentsIndvAttendanceTableAdapter.DML(
                         ActionCode, Id, StudentId, TeacherId, InvDetId,
                       SubjectId, CurDayDate, DayTime, Hours, TeacherValue, AttFlag, ExceptionFlag, NotifyFlag, Notes, StudentAddress,
                      BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy, ref InsertedId, ref RepeatCount)));
                        
                        TotalRemain = TotalRemain - Hours;

                        Id = InsertedId.GetValueOrDefault();

                        CurDate = Convert.ToDateTime(CurDate).AddDays(7);
                        RepeatNumber = RepeatNumber - 1;
                        if (RepeatCount > 0) { 
                            tempResult = RepeatCount.GetValueOrDefault(); 
                        }
                        if (Result==1)
                        {
                            ret = 1;
                        }

                    }
                    Result = tempResult;
                    ret = Result;
                }
            }
            else if (ActionCode == "2" || ActionCode == "1")
            {
                
                CurDayTimeDate = Convert.ToDateTime(DayTime);
                CurDayTimeDate = DateTime.Parse(CurDate.ToShortDateString() + " " + CurDayTimeDate.ToShortTimeString());

                CurDayDate = CurDate.ToString("MM/dd/yyyy");

                DayTime = CurDayTimeDate.ToString("MM/dd/yyyy HH:mm:ss");

                Result = Convert.ToInt64((Sch_StudentsIndvAttendanceTableAdapter.DML(
                     ActionCode, Id, StudentId, TeacherId, InvDetId,
                   SubjectId, CurDayDate, DayTime, Hours, TeacherValue, AttFlag, ExceptionFlag, NotifyFlag, Notes, StudentAddress,
                  BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy, ref InsertedId, ref RepeatCount)));
                if (RepeatCount > 0) { Result = RepeatCount.GetValueOrDefault(); }
                if (Result == 1) { ret = 1; }
                ret = Result;
            }
           else
            {

                CurDayDate = CurDate.ToString("MM/dd/yyyy");
                Result = Convert.ToInt64((Sch_StudentsIndvAttendanceTableAdapter.DML(
                    ActionCode, Id, StudentId, TeacherId, InvDetId,
                  SubjectId, CurDayDate, DayTime, Hours, TeacherValue, AttFlag, ExceptionFlag, NotifyFlag, Notes, StudentAddress,
                 BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy, ref InsertedId, ref RepeatCount)));
                if (RepeatCount > 0) {
                    Result = RepeatCount.GetValueOrDefault();
             }
                if (Result == 1) { ret = 1; }
                ret = Result;
            }
            return ret;
        }
        #endregion
    }
}
