<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Logon.aspx.cs" Inherits="KrazyGames.Logon" %>

<%@ Register Src="Login.ascx" TagName="Login" TagPrefix="uc1" %>
<%@ Register src="CreateUser.ascx" tagname="CreateUser" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="middle_content">
        <div class="login_container">
            <div class="login_heading">
                Please log in to access this area
            </div>
            <uc1:Login ID="Login1" runat="server" />
            
        </div>
        <div class="login_container">
            <div class="login_heading">
                Don't have an account? Create one now!
            </div>
            <uc2:CreateUser ID="CreateUser1" runat="server" />
        </div>
        <div id="clearer">a</div>
    </div>
</asp:Content>
