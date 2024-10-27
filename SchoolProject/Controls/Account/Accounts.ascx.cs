using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

using System.Web.Services;

namespace WebSchool.Controls.Account
{
    public partial class Accounts : System.Web.UI.UserControl
    {
        string Accessing, Adding, Updating, Deleting, Importing;
        public static string jsonStrnig;
        //public static DataView v;
        public static Node nodes;
        public static DataTable dt;
        public static Boolean EditFlag=false;
        public static Boolean SaveFlag = false;
        private  StaticList slAccountTypes;
        protected void Page_Load(object sender, EventArgs e)
        {

            slAccountTypes = new StaticList(GLibrary.strarrAccountTypes);

            // to get all user Prvlages on page 
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            int USERID = int.Parse(cookieUserId.Value.ToString ());// int.Parse(Session["UserID"].ToString());
     
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }

            if (!this.IsPostBack)
            {
                accountTypeDropDownList.DataSource = slAccountTypes.ToDataTable();
                accountTypeDropDownList.DataBind();

                DataView v = (DataView)GEODS.Select();
                v.RowFilter = "accountid > 4";
                DataTable T = v.ToTable();
                //v.RowFilter = String.Empty;
                //dt.Rows.Clear();

             
                dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[] { new DataColumn("Id"), new DataColumn("Text"), new DataColumn("ParentId"), new DataColumn("Mainnode"), new DataColumn("Level") });
                for (int i = 0; i < T.Rows.Count; i++)
                {
                    string AccName = " " + T.Rows[i]["AccountCode"].ToString() + " " + (string)T.Rows[i]["AccountName"] + "-" + T.Rows[i]["AccountSName"].ToString();
                    string AccountId = T.Rows[i]["accountid"].ToString();
                    String ParentId = T.Rows[i]["AccountparentId"].ToString();
                    String MainNode = T.Rows[i]["MainNode"].ToString();
                    int Level = 0;
                    if (T.Rows[i]["AccLevel"] != DBNull.Value)
                    {
                         Level = int.Parse (T.Rows[i]["AccLevel"].ToString());
                    }

                    //TreeNode root = new TreeNode(AccName, T.Rows[i]["accountid"].ToString());

                    dt.Rows.Add(AccountId, AccName, ParentId, MainNode, Level);
                }
                txtAccountId.Value  = T.Rows[0]["accountid"].ToString();
                jsonStrnig = AddMainNode();
                v.RowFilter = "accountType=2";
                AccountClosedToDropDownList.DataSource = v;
                AccountClosedToDropDownList.DataBind();
                v.RowFilter = "";
                GetNodeInfo();

            }
            else
            {
               
                UpdateChildItems(dt, nodes, "1");
                jsonStrnig = (new JavaScriptSerializer()).Serialize(nodes).Replace(",\"nodes\":[]", "").Replace("checkedd", "checked");
            }

            lv.EditIndex = 0;



        }



        public void GetNodeInfo()
        {
            //txtAccountId.Value = AccountId;
            DataView v = (DataView)GEODSById.Select();
            for (int i = 0; i < v.Count; i++)
            {
                string name = v[i]["accountname"].ToString();          

                AccountCodeTextBox.Text  = v[i]["AccountCode"].ToString();
                AccountNameTextBox.Text = v[i]["accountname"].ToString();
                MainAccountTextBox.Text = v[i]["AccountparentName"].ToString();
                CreditTextBox.Text = v[i]["Totalfromvalue"].ToString();
                DebitTextBox.Text = v[i]["Totaltovalue"].ToString();
                txtParentID.Text = v[i]["AccountparentId"].ToString();
                txtLastSerialNo.Text = v[i]["LastSerialNo"].ToString();
                txtlevel.Text = v[i]["AccLevel"].ToString();
                AccountBalanceTextBox.Text = v[i]["balance"].ToString();
                NotesTextBox.Text = v[i]["notes"].ToString();
                txtProcessFlag.Text = v[i]["ProcessFlag"].ToString();
                txtRoot.Text = v[i]["root"].ToString();
                EditFlag = true; // set update 
                AddButton.Enabled = true;
                if (v[i]["startdate"] != DBNull.Value)
                {
                    EnterDateTextBox.Text = DateTime .Parse ( v[i]["startdate"].ToString ()).ToShortDateString ();
                }

                if (v[i]["MainNode"] != DBNull.Value )
                {
                    AccountMainNameCheckBox.Checked = Boolean.Parse(v[i]["MainNode"].ToString());
                 }
              else
                    {
                    AccountMainNameCheckBox.Checked = false;
                }
                if (v[i]["ClosedTo"] != DBNull.Value)
                {
                    AccountClosedToDropDownList.SelectedValue = v[i]["ClosedTo"].ToString();
                }
                if (v[i]["accountType"] != DBNull.Value)
                {
                    accountTypeDropDownList.SelectedValue  = v[i]["accountType"].ToString();
                }
               
                txtAccountId.Value  = v[i]["accountid"].ToString();
                txtMainNode.Text = v[i]["MainNode"].ToString();
                ErrorDiv.Visible = false;
            }
        }

        [WebMethod]
        public string AddMainNode()
        {
            nodes = new Node { text = Resources.DefaultResource.AccountTree.ToString() };
            DataView view = new DataView(dt);
            view.RowFilter = "ParentId=1";
            foreach (DataRowView kvp in view)
            {
                State state = new State();
                state.checkedd = false;
                state.disabled = false;
                state.expanded = true;
                if (kvp["Id"].ToString() == txtAccountId.Value )
                {
                    state.selected = true;
                }
                else
                {
                    state.selected = false;
                }

                string parentId = kvp["Id"].ToString();
                Node node = new Node { id = kvp["Id"].ToString(), text = kvp["text"].ToString(), selectable = true, MainNode = kvp["MainNode"].ToString(), state = state, Level = 0, icon = "fa fa-stop", color = Setcolor(int.Parse(kvp["Level"].ToString())) };
                nodes.nodes.Add(node);
                AddChildItems(dt, node, parentId, 0);
            }
            return (new JavaScriptSerializer()).Serialize(nodes).Replace(",\"nodes\":[]", "").Replace("checkedd", "checked");

        }

        private string Setcolor(int level)
        {
            string color= "#000000";
            switch (level)
            {
                case 0:
                    color = "#000000";
                    break;

                case 1:
                    color = "#000099";
                    break;
                case 2:
                    color = "#800000";
                    break;
                case 3:
                    color = "#602040";
                    break;
                case 4:
                    color = "#004d00";
                    break;
                case 5:
                    color = "#26004d";
                    break;
                case 6:
                    color = "#4d2e00";
                    break;
                case 7:
                    color = "#66004d";
                    break;
                case 8:
                    color = "#4d0026";
                    break;

            }
            return color;
        }


        private void AddChildItems(DataTable dt, Node parentNode, string ParentId, int level)
        {
            //State state = new State();
            //state.checkedd = false;
            //state.selected = false;
            //state.expanded = false;
            //state.disabled = false;
            level = level + 1;
            DataView viewItem = new DataView(dt);
            viewItem.RowFilter = "ParentId=" + ParentId;
            ;
            foreach (DataRowView childView in viewItem)
            {
                State state = new State();
                state.checkedd = false;
                state.selected = false;

                state.disabled = false;
                if (childView["id"].ToString() == txtAccountId.Value )
                {
                    state.selected = true;
                    if (txtExpand.Value != "")
                    {
                        if (txtExpand.Value == "1")
                        {
                            state.expanded = true;
                        }
                        else
                        {
                            state.expanded = false;
                        }
                    }
                    //if (childView["MainNode"].ToString() == "True")
                    //{
                    //    state.expanded = true;
                    //}
                    //else
                    //{
                    //    state.expanded = false;
                    //    parentNode.state.expanded = true;
                    //}

                }
                else
                {
                    state.selected = false;

                }
                string CurIcon = "fa fa-inbox fa-fw";
                switch (level)
                {
                    case 1:
                        CurIcon = "fa fa-address-book fa-fw";
                        break;
                    case 2:
                        CurIcon = "fa fa-globe fa-fw";
                        break;
                    case 3:
                        CurIcon = "fa fa-inbox fa-fw";
                        break;
                }
                Node node = new Node { id = childView["id"].ToString(), text = childView["text"].ToString(), MainNode = childView["MainNode"].ToString(), selectable = true, state = state, Level = level, icon = CurIcon, color = Setcolor(int.Parse(childView["Level"].ToString())) };
                parentNode.nodes.Add(node);
                string pId = childView["Id"].ToString();
                AddChildItems(dt, node, pId, level);

            }
        }

        private void UpdateChildItems(DataTable dt, Node parentNode, string ParentId)
        {
            //State state = new State();
            //state.checkedd = false;
            //state.selected = false;
            //state.expanded = false;
            //state.disabled = false;

            DataView viewItem = new DataView(dt);
            viewItem.RowFilter = "ParentId=" + ParentId;
            int i = 0;
            foreach (DataRowView childView in viewItem)
            {
                State state = new State();
                state.checkedd = false;
                state.selected = false;
                state.disabled = false;
                if (i >= parentNode.nodes.Count )
                {
                    string AccName = " " + AccountCodeTextBox.Text + " " + AccountNameTextBox.Text + "-"; // + T.Rows[i]["AccountSName"].ToString();

                    Node node = new Node { id = childView["id"].ToString(), text = AccName, MainNode = childView["MainNode"].ToString(), selectable = true, state = state, Level = i, icon =  "glyphicon glyphicon-stop",color =Setcolor (int.Parse (childView["Level"].ToString ())) };
                    parentNode.nodes.Add(node);
                    string Id = childView["Id"].ToString();
                    AddChildItems(dt, node, Id, i);
                }
                
                if (childView["id"].ToString() == txtAccountId.Value )
                {
                    state.selected = true;
                    parentNode.nodes[i].state.selected = true;
                    parentNode.nodes[i].state.expanded = true;
                    if (SaveFlag)
                    {
                        parentNode.nodes[i].text = " " + AccountCodeTextBox.Text + " " + AccountNameTextBox.Text + "-"; // + T.Rows[i]["AccountSName"].ToString();
                    }


                    if (txtExpand.Value!= "")
                    {
                        if (txtExpand.Value == "1")
                        {
                            parentNode.nodes[i].state.expanded = true;
                            state.expanded = true;
                        }
                        else
                        {
                            parentNode.nodes[i].state.expanded = false;
                            state.expanded = false;
                        }
                    }

                }
                else
                {
                    parentNode.nodes[i].state.selected = false;
                    state.selected = false;

                }
               
                Node Node = parentNode.nodes[i];
                string pId = childView["Id"].ToString();
                UpdateChildItems(dt, Node, pId);
                i = i + 1;
            }
        }
      

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GetNodeInfo();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            AddNewAccount(false);

        }
        private void AddNewAccount(Boolean  MainAccount)
        {
            if (txtMainNode.Text == "True")
            {
                int Serial = 0;
                int Level = 0;
                if (Globals.IsNumeric(txtLastSerialNo.Text))
                {
                    Serial = int.Parse(txtLastSerialNo.Text);
                    Serial = Serial + 1;
                }
                if (Globals.IsNumeric(txtlevel.Text))
                {
                    Level = int.Parse(txtlevel.Text);
                    Level = Level + 1;
                }


                MainAccountTextBox.Text = AccountNameTextBox.Text;
                txtParentID.Text = txtAccountId.Value;
                AccountNameTextBox.Text = "";

                CreditTextBox.Text = "";
                DebitTextBox.Text = "";
                txtLastSerialNo.Text = Serial.ToString();
                AccountBalanceTextBox.Text = "";
                NotesTextBox.Text = "";
                AccountCodeTextBox.Text = AccountCodeTextBox.Text + Serial.ToString();
                EnterDateTextBox.Text = DateTime.Today.ToShortDateString();
                AccountMainNameCheckBox.Checked = false;
                AccountClosedToDropDownList.SelectedValue = "0";
                accountTypeDropDownList.SelectedValue = "0";
                txtlevel.Text = Level.ToString();
                AccountMainNameCheckBox.Checked = MainAccount;

                txtAccountId.Value = "";
                EditFlag = false;
                AddButton.Enabled = false;
            }
            else
            {
                ErrorDiv.Visible = true;
                ErrorDiv.InnerHtml = "<div class=\"alert alert-info\" role=\"alert\">" + Resources.DefaultResource.AddAccountMessage.ToString() + "</div>";
            }
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SaveAccount();

        }
        private void SaveAccount()
        {
            if (AccountNameTextBox.Text != "" & AccountCodeTextBox.Text != "")
            {
                string Accountcode = AccountCodeTextBox.Text;
                string AccountName = AccountNameTextBox.Text;
                //string AccountParentId = AccountNameTextBox.Text;
                long ParentId = long.Parse(txtParentID.Text);
                //txtMainNode.Text
                bool MainFlag = false;
                if (AccountMainNameCheckBox.Checked) { MainFlag=true; }

                int OrgId = int.Parse(txtOrgId.Text);
                string SerialNo = txtLastSerialNo.Text;
                int Level = int.Parse(txtlevel.Text);
                bool root = bool.Parse (txtRoot.Text);
                int accountClosedId = int.Parse(AccountClosedToDropDownList.SelectedValue.ToString());
                int AccountTypeId = int.Parse(accountTypeDropDownList.SelectedValue.ToString());
                string Notes = NotesTextBox.Text;
                HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");
                int USERID = int.Parse(cookieUserId.Value.ToString());
                BOL.Accounts dtDet = new BOL.Accounts();
                long? InsertedId = 0;
                Boolean SaveFlag = true;
                if (!EditFlag)
                {
                    //GEODS.Insert();
                    DAL.ERPAssetDataSet.AccountsDataTable dt = dtDet.Read("1", 0, OrgId, 0, 0, 0, "", "", "", Accountcode, "");
                    if (dt.Count == 0)
                    {
                        dtDet.DML("1", 0, Accountcode, AccountName, AccountName, ParentId, root, 0, 0, Notes, 0, 0, AccountTypeId, accountClosedId, MainFlag, false, false, Level, ParentId, SerialNo, 0, OrgId, USERID, USERID, 0, ref InsertedId);
                        DataView v = (DataView)GEODSByCode.Select();
                        if (v.Count > 0)
                        {
                            DataTable T = v.ToTable();
                            txtAccountId.Value = T.Rows[0]["accountid"].ToString();
                        }
                    }
                    else
                    {
                        SaveFlag = false;
                        ErrorDiv.Visible = true;
                        ErrorDiv.InnerHtml = "<div class=\"alert alert-warning\" role=\"alert\">" + Resources.DefaultResource.DuplicateAccountCodeMsg.ToString() + "</div>";
                    }
                }
                else
                {
                    long AccountId=   long.Parse(txtAccountId.Value.ToString());
                    dtDet.DML("2", AccountId, Accountcode, AccountName, AccountName, ParentId, root, 0, 0, Notes, 0, 0, AccountTypeId, accountClosedId, MainFlag, false, false, Level, ParentId, SerialNo, 0, OrgId, USERID, USERID, 0, ref InsertedId);

                    GEODS.Update();
                }
                if (SaveFlag)
                {
                    SaveAndAddUpdate();
                    ErrorDiv.Visible = true;
                    //ErrorDiv.InnerHtml = "<div class=\"alert alert-success alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + Resources.DefaultResource.Savesuccess.ToString() + "</div>";
                    ErrorDiv.InnerHtml = "<div class=\"alert alert-success\" role=\"alert\">" + Resources.DefaultResource.Savesuccess.ToString() + "</div>";
                }
            }
        }
        protected void DelButton_Click(object sender, EventArgs e)
        {
            DeleteAccount();
        }
        private void DeleteAccount()
        {
            if (!EditFlag)
            {
                GEODS.Delete();
            }
        }
        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            // Hidding Action buttons in case not assigend  
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            //if (Updating != "True") { EditLinkButton.Visible = false; }
            //if (Deleting != "True") { DeleteLinkButton.Visible = false; }
        }

        protected void NewSubAccount_Click(object sender, EventArgs e)
        {
            AddNewAccount(false);
        }

        protected void MainSubAccountBtn_Click(object sender, EventArgs e)
        {
            AddNewAccount(true);
        }

        protected void LinkButtonAccountCard_Click(object sender, EventArgs e)
        {

        }

      

        protected void LinkButtonSave_Click(object sender, EventArgs e)
        {
            SaveAccount();
        }

        protected void lv_DataBound(object sender, EventArgs e)
        {

        }

        protected void LinkButtondelete_Click(object sender, EventArgs e)
        {
            DeleteAccount();
        }

       

        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            //SearchTextBox.Text = "";
            //lv.DataBind();

        }

        protected void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "NewRecord":
                        lv.InsertItemPosition = InsertItemPosition.FirstItem;
                        break;
                    case "Cancel":
                        //Hide code
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "UnSelect":
                        lv.SelectedIndex = -1;
                        break;
                    case "Select":
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "Update":

                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;

                    case "Insert":

                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";

            }
        }
        private void SaveAndAddUpdate()
        {
            DataView v = (DataView)GEODS.Select();
            v.RowFilter = "accountid > 4";
            DataTable T = v.ToTable();
            //v.RowFilter = String.Empty;

            dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] { new DataColumn("Id"), new DataColumn("Text"), new DataColumn("ParentId"), new DataColumn("Mainnode"), new DataColumn("Level") });
            for (int i = 0; i < T.Rows.Count; i++)
            {
                string AccName = " " + T.Rows[i]["AccountCode"].ToString() + " " + (string)T.Rows[i]["AccountName"] + "-" + T.Rows[i]["AccountSName"].ToString();
                string AccountId = T.Rows[i]["accountid"].ToString();
                String ParentId = T.Rows[i]["AccountparentId"].ToString();
                String MainNode = T.Rows[i]["MainNode"].ToString();

                //TreeNode root = new TreeNode(AccName, T.Rows[i]["accountid"].ToString());
                int Level = 0;
                if (T.Rows[i]["AccLevel"] != DBNull.Value)
                {
                    Level = int.Parse(T.Rows[i]["AccLevel"].ToString());
                }
                //TreeNode root = new TreeNode(AccName, T.Rows[i]["accountid"].ToString());

                dt.Rows.Add(AccountId, AccName, ParentId, MainNode, Level);
               
            }
            SaveFlag = true;
            //txtAccountId.Text = T.Rows[0]["accountid"].ToString();
            UpdateChildItems(dt, nodes, "1");
            jsonStrnig = (new JavaScriptSerializer()).Serialize(nodes).Replace(",\"nodes\":[]", "").Replace("checkedd", "checked");
            GetNodeInfo();
            SaveFlag = false ;
        }
    }
}