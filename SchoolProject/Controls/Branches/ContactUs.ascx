<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.ascx.cs" Inherits="WebSchool.Controls.ContentPages.ContactUs" %>

  <!-- Add Contact Block -->
<div class="row">
  
                                  <!-- Masked Inputs Block -->
                                <div class="block">
                                    <!-- Masked Inputs Title -->
                                    <div class="block-title">
                                        <h4><strong><%= Resources.DefaultResource.ContactUs%> </strong></h4>
                                    </div>
                                    <!-- END Masked Inputs Title -->

                                    <!-- Masked Inputs Content -->
                                    <div  class="form-horizontal form-bordered">
                                             <fieldset>
                                                 <%--  <legend><i class="fa fa-angle-right"></i> Vital Info</legend>--%>
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="val_username"><%= Resources.DefaultResource.Name%> <span class="text-danger">*</span></label>
                                                <div class="col-md-6">
                                                      <div class="input-group">
                                                    <asp:TextBox ID="val_name" runat="server" CssClass="form-control"  placeholder="<%$ Resources:DefaultResource, Name%>">
                                                     </asp:TextBox>
                                                     <span class="input-group-addon"><i class="gi gi-user"></i></span>
                                                    </div>

                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="col-md-4 control-label" for="val_username"><%= Resources.DefaultResource.Email%> <span class="text-danger">*</span></label>
                                                <div class="col-md-6">
                                                      <div class="input-group">
                                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" placeholder="Enter Email.."></asp:TextBox>
                                                          <%-- <asp:TextBox ID="" runat="server" " CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Tel%>" />--%>
                                                 <span class="input-group-addon"><i class="gi gi-envelope"></i></span>
                                                 </div>
                                                </div>
                                            </div>
                                                <div class="form-group">
                                                <label class="col-md-4 control-label" for="val_username"><%= Resources.DefaultResource.Tel%> <span class="text-danger">*</span></label>
                                                <div class="col-md-6">
                                                      <div class="input-group">
                                                <asp:TextBox ID="val_Tel" runat="server" CssClass="form-control" placeholder="99999999"></asp:TextBox>
                                                          <%-- <asp:TextBox ID="" runat="server" " CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Tel%>" />--%>
                                                 <span class="input-group-addon"><i class="gi gi-earphone"></i></span>
                                                 </div>
                                                </div>
                                            </div>
                                                  <div class="form-group">
                                                <label class="col-md-4 control-label" for="val_username"><%= Resources.DefaultResource.CutomerAddress%> <span class="text-danger">*</span></label>
                                                <div class="col-md-6">
                                                      <div class="input-group">
                                                <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="form-control" placeholder="Enter Address.."></asp:TextBox>
                                                         
                                                 <span class="input-group-addon"><i class="gi gi-globe"></i></span>
                                                 </div>
                                                </div>
                                            </div>
                                           
                                                
                                        </fieldset>
                                     
                                       
                                        <div class="form-group form-actions">
                                            <div class="col-md-8 col-md-offset-4">
                                              <%--  <button type="submit" class="btn btn-sm btn-primary">--%>
                                              
                                                    <asp:LinkButton ID="ConfirmBtn" runat="server" class="btn btn-sm btn-primary" >
                                                        <i class="fa fa-ok"></i> <%= Resources.DefaultResource.Send%>  </asp:LinkButton>
                                                   
                                             
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END Masked Inputs Content -->
                                </div>
                                <!-- END Masked Inputs Block -->

    </div>