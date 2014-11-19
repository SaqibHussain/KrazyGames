<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="EditAccount.aspx.cs" Inherits="KrazyGames.MyAccount.EditAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="middle_content">
    Please use the below fields to edit your information then select the submit button
    at the bottom of the form
    <div>
        <table>
            <tr>
                <td>
                    Title
                </td>
                <td>
                    <asp:DropDownList ID="ddlTitle" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    First Name
                </td>
                <td>
                    <asp:TextBox ID="tbFirstName" runat="server" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Surname
                </td>
                <td>
                    <asp:TextBox ID="tbSurname" runat="server" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone
                </td>
                <td>
                    <asp:TextBox ID="tbPhone" runat="server" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile
                </td>
                <td>
                    <asp:TextBox ID="tbMobile" runat="server" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Date of Birth
                </td>
                <td>
                    <asp:TextBox ID="tbDateOfBirth" runat="server" Width="195px"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td>
                    Country
                </td>
                <td>
                    <asp:DropDownList ID="ddlCountry" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <asp:Button ID="btnEditAccount" runat="server" Text="Done" Width="201px" 
          onclick="btnEditAccount_Click" />
     </div>
</asp:Content>
