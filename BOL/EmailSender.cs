using System;
using System.Collections.Generic;
using System.Web;
//using System.Net.Mail;

using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using System.Net;
using System.Collections.Specialized;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for EmailSender
/// </summary>
/// 
namespace BOL
{
    public class ResponseClass
    {
        public string staus { get; set; }
        public int Code { get; set; }
        public string Message { get; set; }
    }
    public partial class EmailSender
    {

        public static string Ultramsgtoken = "";
        public static string UltraInstance = "";
        public static string MobileNo = "";
        public static string fromMobile = "";
        public static void SendWahts(string ToNumber, string message, string Image, byte[] ImageBytes, long QrgId)
        {
            BOL.Setup DA = new BOL.Setup();
            DAL.Setup.SetupDataTable dt = new DAL.Setup.SetupDataTable();

            dt = DA.Read("1", QrgId, "","","");
            if (dt.Count > 0)
            {
                UltraInstance = dt[0].UltraInstance;
                Ultramsgtoken = dt[0].Ultramsgtoken;
            }
                
                string URL = "";
            //Image = "http://gym.itrightsoft.com/img/exhibition-icon.png";

            using (var wb = new WebClient())
            {

                var data = new NameValueCollection();
                data["token"] = Ultramsgtoken; // "y8hq6sx9d7a9qhb8";
                if (ImageBytes != null)
                {
                    byte[] AsBytes = ImageBytes;
                    String AsBase64String = Convert.ToBase64String(AsBytes);
                    data["image"] = AsBase64String;
                    data["caption"] = message;

                    URL = "https://api.ultramsg.com/" + UltraInstance + "/messages/image";
                }
                else if (message != "")
                {
                    data["body"] = message;
                    URL = "https://api.ultramsg.com/" + UltraInstance + "/messages/chat";
                }
                if (Image != "")
                {
                    byte[] AsBytes = File.ReadAllBytes(Image);
                    String AsBase64String = Convert.ToBase64String(AsBytes);
                    data["image"] = AsBase64String;
                    data["caption"] = "";

                    URL = "https://api.ultramsg.com/" + UltraInstance + "/messages/image";

                }

                data["to"] = ToNumber; // 97176326";

                var response =
                    wb
                        .UploadValues(URL,
                        "POST",
                        data);
                string responseInString = Encoding.UTF8.GetString(response);
                Console.WriteLine(responseInString);
            }

            ///////////
        }

        public void SendEmailWithAttachmentsOld(string SenderEmail, string SenderName, string ReceiverEmail,
                              string ReceiverName, string EmailMsg, string EmailSubject,
                              string UserName, string UserPassword, string HOSTServer, Attachment MyAttachment, string StmpPort)
        {


            System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();
            smtpClient.Port = int.Parse(StmpPort);
            MailMessage message = new MailMessage();


            MailAddress fromAddress = new MailAddress(UserName, SenderName);

            smtpClient.Host = HOSTServer;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential(UserName, UserPassword);

            //smtpClient.Port = 25;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = false;
            //From address will be given as a MailAddress Object
            message.From = fromAddress;

            // To address collection of MailAddress
            message.To.Add(ReceiverEmail);
            message.Subject = EmailSubject;
            message.Attachments.Add(MyAttachment);

            // CC and BCC optional
            // MailAddressCollection class is used to send the email to various users
            // You can specify Address as new MailAddress("admin1@yoursite.com")
            //message.CC.Add("brine_fury@yahoo.com")

            // You can specify Address directly as string
            //'message.Bcc.Add(New MailAddress("admin3@yoursite.com"))
            //message.Bcc.Add(new MailAddress("m.youssef2@gpf.gov.kw"));
            message.Bcc.Add(new MailAddress("bader.m@gpf.gov.kw"));
            message.Bcc.Add(new MailAddress("meshari.d@gpf.gov.kw"));
            //message.Bcc.Add(new MailAddress("m.youssef@gpf.gov.kw"));

            //message.Bcc.Add(new MailAddress("Feedback@bumpertobumper.com"));

            //Body can be Html or text format
            //Specify true if it  is html message
            message.IsBodyHtml = true;

            // Message body content
            message.Body = EmailMsg;

            // Send SMTP mail
            smtpClient.Send(message);
        }

        //public void SendOrder(string OrderID)
        //{
        //    if (EmailSubject == " عمل اللازم للمتقدم ")
        //    {
        //        Attachment data = new Attachment(Path.Combine(Server.MapPath("~/uploads/Applicant.doc")), MediaTypeNames.Application.Octet);
        //        // your path may look like Server.MapPath("~/file.ABC")


        //    }

        //}
    }
}