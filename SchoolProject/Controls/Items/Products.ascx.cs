using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

using System.Web.Services;

namespace WebSchool.Controls.Items
{
    public partial class Products : System.Web.UI.UserControl
    {

        string Accessing, Adding, Updating, Deleting, Importing;
        public static string jsonStrnig;
        //public static DataView v;
        public static Node nodes;
        public static DataTable dt;



        public static Boolean EditFlag = false;
        public static Boolean SaveFlag = false;

        protected void Page_Load(object sender, EventArgs e)
        {




            // to get all user Prvlages on page 
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());

            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }

          


            if (!this.IsPostBack)
            {

               

                ProductTypeDropDownList.DataBind();

                DataView v = (DataView)GEODS.Select();
                //v.RowFilter = "Productid > 4";
                DataTable T = v.ToTable();
                //v.RowFilter = String.Empty;
                //dt.Rows.Clear();
                dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[] { new DataColumn("Id"), new DataColumn("Text"), new DataColumn("ParentId"), new DataColumn("Mainnode"), new DataColumn("Level") });
                for (int i = 0; i < T.Rows.Count; i++)
                {
                    string AccName = " " + T.Rows[i]["ProductCode"].ToString() + " " + (string)T.Rows[i]["ProductName"] + "-" + T.Rows[i]["EnglishName"].ToString();
                    string ProductId = T.Rows[i]["Productid"].ToString();
                    String ParentId = T.Rows[i]["ParentProductId"].ToString();
                    String MainNode = T.Rows[i]["MainNode"].ToString();
                    int Level = 0;
                    if (T.Rows[i]["Level"] != DBNull.Value)
                    {
                        Level = int.Parse(T.Rows[i]["Level"].ToString());
                    }

                    //TreeNode root = new TreeNode(AccName, T.Rows[i]["Productid"].ToString());

                    dt.Rows.Add(ProductId, AccName, ParentId, MainNode, Level);
                }
                txtProductId.Value = T.Rows[0]["Productid"].ToString();
                jsonStrnig = AddMainNode();
                //v.RowFilter = "ProductType=2";

                v.RowFilter = "";
                GetNodeInfo();
                SetTabSel();

            }
            else
            {
                //PriceTab.Attributes.Add("class", "active"); //current is the id of the tab
                //HiddenFieldTab.Value = "#profile";
                //HiddenFieldTab1.Value = "tab-pane fade";
                //HiddenFieldTab2.Value = "tab-pane fade show active";

                UpdateChildItems(dt, nodes, "0");
                jsonStrnig = (new JavaScriptSerializer()).Serialize(nodes).Replace(",\"nodes\":[]", "").Replace("checkedd", "checked");
            }



           

        }



        public void GetNodeInfo()
        {
            //PriceTab.Visible = false;
            //txtProductId.Value = ProductId;
            DataView v = (DataView)GEODSById.Select();
            for (int i = 0; i < v.Count; i++)
            {
                string name = v[i]["productname"].ToString();

                ProductCodeTextBox.Text = v[i]["PRODUCTCODE"].ToString();
                ProductNameTextBox.Text = v[i]["productname"].ToString();
                MainProductTextBox.Text = v[i]["ProductparentName"].ToString();
                //CreditTextBox.Text = v[i]["Totalfromvalue"].ToString();
                //DebitTextBox.Text = v[i]["Totaltovalue"].ToString();
                txtParentID.Text = v[i]["ParentProductId"].ToString();

                txtlevel.Text = v[i]["Level"].ToString();

                txtProcessFlag.Text = v[i]["ProcessFlag"].ToString();
                txtRoot.Text = v[i]["root"].ToString();

                SERIALNOTextBox.Text = v[i]["SERIALNO"].ToString();

                WeightTextBox.Text = v[i]["PWeight"].ToString();
                ColorTextBox.Text = v[i]["PColor"].ToString();
                SizeTextBox.Text = v[i]["PSize"].ToString();
                VolumeTextBox.Text = v[i]["PVolume"].ToString();
                PDescTextBox.Text = v[i]["PDesc"].ToString();
                BrandTextBox.Text = v[i]["shape2"].ToString();
                txtLastSerialNo.Text = v[i]["SerialCode"].ToString();

                EditFlag = true; // set update 
                AddButton.Enabled = true;


                if (v[i]["MainNode"] != DBNull.Value)
                {
                    ProductMainNameCheckBox.Checked = Boolean.Parse(v[i]["MainNode"].ToString());
                }
                else
                {
                    ProductMainNameCheckBox.Checked = false;
                }

                if (v[i]["ProductTypeID"] != DBNull.Value)
                {
                    ProductTypeDropDownList.SelectedValue = v[i]["ProductTypeID"].ToString();
                }

                txtProductId.Value = v[i]["Productid"].ToString();
                txtMainNode.Text = v[i]["MainNode"].ToString();
                ErrorDiv.Visible = false;
                if (v.Count > 0)
                {
                    if (v[i]["MainNode"] != DBNull.Value)
                    {
                        if (!Boolean.Parse(v[i]["MainNode"].ToString()))
                        {
                            PriceTab.Visible = true;
                            StockTab.Visible = true;
                        }
                        else
                        {
                            PriceTab.Visible =false;
                            StockTab.Visible = false;
                        }
                    }
                    

                }

            }
        }
            [WebMethod]
            public string AddMainNode()
            {
                nodes = new Node { text = Resources .DefaultResource .ItemsTree.ToString ()};
                DataView view = new DataView(dt);
                view.RowFilter = "ParentId=0";
                foreach (DataRowView kvp in view)
                {
                    State state = new State();
                    state.checkedd = false;
                    state.disabled = false;
                    state.expanded = true;
                    if (kvp["Id"].ToString() == txtProductId.Value)
                    {
                        state.selected = true;
                    }
                    else
                    {
                        state.selected = false;
                    }

                    string parentId = kvp["Id"].ToString();
                    Node node = new Node { id = kvp["Id"].ToString(), text = kvp["text"].ToString(), selectable = true, MainNode = kvp["MainNode"].ToString(), state = state, Level = 0, icon = "glyphicon glyphicon-stop", color = Setcolor(int.Parse(kvp["Level"].ToString())) };
                    nodes.nodes.Add(node);
                    AddChildItems(dt, node, parentId, 0);
                }
                return (new JavaScriptSerializer()).Serialize(nodes).Replace(",\"nodes\":[]", "").Replace("checkedd", "checked");

            }

            private string Setcolor(int level)
            {
                string color = "#000000";
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
                    if (childView["id"].ToString() == txtProductId.Value)
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
                    if (i >= parentNode.nodes.Count)
                    {
                        string AccName = " " + ProductCodeTextBox.Text + " " + ProductNameTextBox.Text + "-"; // + T.Rows[i]["EnglishName"].ToString();

                        Node node = new Node { id = childView["id"].ToString(), text = AccName, MainNode = childView["MainNode"].ToString(), selectable = true, state = state, Level = i, icon = "glyphicon glyphicon-stop", color = Setcolor(int.Parse(childView["Level"].ToString())) };
                        parentNode.nodes.Add(node);
                        string Id = childView["Id"].ToString();
                        AddChildItems(dt, node, Id, i);
                    }

                    if (childView["id"].ToString() == txtProductId.Value)
                    {
                        state.selected = true;
                        parentNode.nodes[i].state.selected = true;
                        parentNode.nodes[i].state.expanded = true;
                        if (SaveFlag)
                        {
                            parentNode.nodes[i].text = " " + ProductCodeTextBox.Text + " " + ProductNameTextBox.Text + "-"; // + T.Rows[i]["EnglishName"].ToString();
                        }


                        if (txtExpand.Value != "")
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
                AddNewProduct(false);

            }

            private void AddNewProduct(Boolean MainProduct)
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

                PriceTab.Visible = false;
                MainProductTextBox.Text = ProductNameTextBox.Text;
                    txtParentID.Text = txtProductId.Value;
                    ProductNameTextBox.Text = "";


                    SERIALNOTextBox.Text = "";
                    ProductTypeDropDownList.SelectedValue = "0";
                    WeightTextBox.Text = "";
                    ColorTextBox.Text = "";
                    SizeTextBox.Text = "";
                    VolumeTextBox.Text = "";
                    PDescTextBox.Text = "";
                    BrandTextBox.Text = "";


                    txtLastSerialNo.Text = Serial.ToString();
                    ProductCodeTextBox.Text = ProductCodeTextBox.Text + Serial.ToString();



                    txtlevel.Text = Level.ToString();
                    ProductMainNameCheckBox.Checked = MainProduct;

                    txtProductId.Value = "";
                    EditFlag = false;
                    AddButton.Enabled = false;
                }
                else
                {
                    ErrorDiv.Visible = true;
                    ErrorDiv.InnerHtml = "<div class=\"alert alert-info\" role=\"alert\">" + Resources.DefaultResource.AddProductMessage.ToString() + "</div>";
                }
            }
            protected void SaveButton_Click(object sender, EventArgs e)
            {
                SaveProduct();

            }
            private void SaveProduct()
            {
                if (ProductNameTextBox.Text != "" & ProductCodeTextBox.Text != "")
                {
                    if (!EditFlag)
                    {
                        GEODS.Insert();
                        DataView v = (DataView)GEODSByCode.Select();
                        if (v.Count > 0)
                        {
                            DataTable T = v.ToTable();
                            txtProductId.Value = T.Rows[0]["Productid"].ToString();
                        }
                    }
                    else
                    {
                        GEODS.Update();
                    }
                    SaveAndAddUpdate();
                    ErrorDiv.Visible = true;
                    //ErrorDiv.InnerHtml = "<div class=\"alert alert-success alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + Resources.DefaultResource.Savesuccess.ToString() + "</div>";
                    ErrorDiv.InnerHtml = "<div class=\"alert alert-success\" role=\"alert\">" + Resources.DefaultResource.Savesuccess.ToString() + "</div>";
                }
            }
            protected void DelButton_Click(object sender, EventArgs e)
            {
                DeleteProduct();
            }
            private void DeleteProduct()
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

            protected void NewSubProduct_Click(object sender, EventArgs e)
            {
                AddNewProduct(false);
            }

            protected void MainSubProductBtn_Click(object sender, EventArgs e)
            {
                AddNewProduct(true);
            }





            protected void LinkButtonSave_Click(object sender, EventArgs e)
            {
                SaveProduct();
            }

            protected void lv_DataBound(object sender, EventArgs e)
            {

            }

        protected void LinkButtonHome_Click(object sender, EventArgs e)
        {
            SetTabSel();


        }
        protected void LinkButtonPrice_Click(object sender, EventArgs e)
        {
            SetTab2();
        }

        protected void LinkButtonQty_Click(object sender, EventArgs e)
        {
            SetTab3();

        }

        private void SetTabSel()
        {
            // tabs
            this.HomeTab.Attributes["class"] = "tab-pane active"; //tab 1
            this.PriceTab.Attributes["class"] = "tab-pane "; //tab 2
            this.StockTab.Attributes["class"] = "tab-pane "; //tab 3

            // screen
            home.Attributes["class"] = "tab-pane fade show active"; // screen 1
            price.Attributes["class"] = "tab-pane fade"; // screen 2
            Stock.Attributes["class"] = "tab-pane fade"; // screen 3


            HiddenFieldTab1.Value = "tab-pane fade show active"; // variabl 1 to tab 1
            HiddenFieldTab2.Value = "tab-pane fade "; // variabl 1 to tab 2
            HiddenFieldTab3.Value = "tab-pane fade "; // variabl 1 to tab 3
        }
        private void SetTab2()
        {
            this.HomeTab.Attributes["class"] = "tab-pane";
            this.PriceTab.Attributes["class"] = "tab-pane active";
            StockTab.Attributes["class"] = "tab-pane";
            //PriceTab.Attributes.Add("class", "active"); //current is the id of the tab

            HiddenFieldTab1.Value = "tab-pane fade";
            HiddenFieldTab2.Value = "tab-pane fade show active";
            HiddenFieldTab3.Value = "tab-pane fade";

            price.Attributes["class"] = "tab-pane fade show active";
            home.Attributes["class"] = "tab-pane fade";
            Stock.Attributes["class"] = "tab-pane fade";
        }
        private void SetTab3()
        {
            this.HomeTab.Attributes["class"] = "tab-pane";
            this.PriceTab.Attributes["class"] = "tab-pane";
            StockTab.Attributes["class"] = "tab-pane active";

            //PriceTab.Attributes.Add("class", "active"); //current is the id of the tab

            HiddenFieldTab1.Value = "tab-pane fade";
            HiddenFieldTab2.Value = "tab-pane fade";
            HiddenFieldTab3.Value = "tab-pane fade show active";

            price.Attributes["class"] = "tab-pane fade";
            home.Attributes["class"] = "tab-pane fade";
            Stock.Attributes["class"] = "tab-pane fade show active";
        }
        
        protected void LinkButtondelete_Click(object sender, EventArgs e)
            {
                DeleteProduct();
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


                SetTab2();



            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";

            }
            }
            private void SaveAndAddUpdate()
            {
                DataView v = (DataView)GEODS.Select();
                //v.RowFilter = "Productid > 4";
                DataTable T = v.ToTable();
                //v.RowFilter = String.Empty;

                dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[] { new DataColumn("Id"), new DataColumn("Text"), new DataColumn("ParentId"), new DataColumn("Mainnode"), new DataColumn("Level") });
                for (int i = 0; i < T.Rows.Count; i++)
                {
                    string AccName = " " + T.Rows[i]["ProductCode"].ToString() + " " + (string)T.Rows[i]["productname"] + "-" + T.Rows[i]["EnglishName"].ToString();
                    string ProductId = T.Rows[i]["Productid"].ToString();
                    String ParentId = T.Rows[i]["ParentProductId"].ToString();
                    String MainNode = T.Rows[i]["MainNode"].ToString();

                    //TreeNode root = new TreeNode(AccName, T.Rows[i]["Productid"].ToString());
                    int Level = 0;
                    if (T.Rows[i]["Level"] != DBNull.Value)
                    {
                        Level = int.Parse(T.Rows[i]["Level"].ToString());
                    }
                    //TreeNode root = new TreeNode(AccName, T.Rows[i]["Productid"].ToString());

                    dt.Rows.Add(ProductId, AccName, ParentId, MainNode, Level);

                }
                SaveFlag = true;
                //txtProductId.Text = T.Rows[0]["Productid"].ToString();
                UpdateChildItems(dt, nodes, "0");
                jsonStrnig = (new JavaScriptSerializer()).Serialize(nodes).Replace(",\"nodes\":[]", "").Replace("checkedd", "checked");
                GetNodeInfo();
                SaveFlag = false;
            }
        }
    
}