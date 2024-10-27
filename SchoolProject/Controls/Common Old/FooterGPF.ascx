<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterGPF.ascx.cs" Inherits="WebGymAPP.Controls.Common.FooterGPF" %>
<div class="kt-footer kt-grid__item kt-grid kt-grid--desktop kt-grid--ver-desktop">
    <div class="kt-footer__copyright">
        2019&nbsp;&copy;&nbsp;<a href="#" target="_blank" class="kt-link">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Site_Fottertitle%>" />
            </a>
    </div>
    <div class="kt-footer__menu">
        <a href="#" target="_blank" class="kt-footer__menu-link kt-link">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Site_GetSupport%>" />
        </a>
    </div>
</div>
