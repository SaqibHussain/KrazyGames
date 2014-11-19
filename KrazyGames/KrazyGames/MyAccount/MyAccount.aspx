<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="True"
    Inherits="MyAccount" CodeBehind="MyAccount.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="middle_content">
        Welcome to your account page,
        <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblSurname" runat="server" Text=""></asp:Label>
        <div>
            <table>
                <tr>
                    <td>
                        Title
                    </td>
                    <td>
                        <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        First Name
                    </td>
                    <td>
                        <asp:Label ID="lblFirstName2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Surname
                    </td>
                    <td>
                        <asp:Label ID="lblSurname2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone
                    </td>
                    <td>
                        <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mobile
                    </td>
                    <td>
                        <asp:Label ID="lblMobile" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date of Birth
                    </td>
                    <td>
                        <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Country
                    </td>
                    <td>
                        <asp:Label ID="lblCountry" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="btnEditAccount" runat="server" Text="Edit Details" Width="100px" 
            onclick="btnEditAccount_Click" />
    </div>
</asp:Content>
