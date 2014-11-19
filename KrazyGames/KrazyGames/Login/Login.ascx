<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="KrazyGames.Login.Login" %>
<div id="login_container">
    <table class="control_holder">
        <tr>
            <td class="login_text">
                Email:
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" class="txtEmail"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="login_text">
                Password:
            </td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" TextMode="password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="login_text">
            </td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLoginCheck" runat="server"></asp:Label>
</div>
<asp:RequiredFieldValidator ForeColor="Red" 
    ID="txtEmailValidator" 
    runat="server"
    ErrorMessage="Must Provide an Email Address" 
    ControlToValidate="txtEmail"
    Display="None" 
    ValidationGroun="LoginGroup"/>
<asp:RegularExpressionValidator ID="regexEmailValid" 
    runat="server" 
    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
    ControlToValidate="txtEmail" 
    ForeColor="Red" 
    ErrorMessage="Invalid Email Format" 
    Text="*"
    Display="None" 
    ValidationGroun="LoginGroup"/>
<asp:RequiredFieldValidator ForeColor="Red" 
    ID="txtPassValidator" 
    runat="server"
    ErrorMessage="Must Provide a Password" 
    ControlToValidate="txtPass"
    Display="None"
    ValidationGroun="LoginGroup" />

<asp:ValidationSummary ID="ValidationSummary1" 
    runat="server" 
    DisplayMode="BulletList"
    EnableClientScript="true"
    HeaderText="Please correct the following errors:"/>
