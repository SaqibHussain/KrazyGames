<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.ascx.cs"
    Inherits="KrazyGames.Login.CreateUser" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>
<table>
    <tr>
        <td>
            Title*
        </td>
        <td>
            <asp:DropDownList ID="ddlTitle" runat="server">
                <asp:ListItem Selected="true" Text="" Value="" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Must Provide a Title"
                ControlToValidate="ddlTitle" Display="None" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            First Name*
        </td>
        <td>
            <asp:TextBox ID="tbFirstName" runat="server" Width="195px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Must Provide a First Name"
                ControlToValidate="tbFirstName" Display="None" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Surname*
        </td>
        <td>
            <asp:TextBox ID="tbSurname" runat="server" Width="195px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must Provide a Surname"
                ControlToValidate="tbSurname" Display="None" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Email*
        </td>
        <td>
            <asp:TextBox ID="tbEmail" runat="server" Width="195px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must Provide an email address"
                ControlToValidate="tbEmail" Display="None" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegexEmail" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="tbEmail" ForeColor="Red" ErrorMessage="Invalid Email Format"
                Text="*" Display="None" ValidationGroup="SignUpGroup" />
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
            Date of Birth*
        </td>
        <td>
            <cc1:DatePicker ID="DatePicker1" runat="server" AutoPostBack="true" Width="100px"
                PaneWidth="150px">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </td>
    </tr>
    <tr>
        <td>
            Country*
        </td>
        <td>
            <asp:DropDownList ID="ddlCountry" runat="server">
                <asp:ListItem Selected="true" Text="" Value="" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Must Provide a Country"
                ControlToValidate="ddlCountry" Display="None" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
        <tr>
        <td>
            Passsword*
        </td>
        <td>
            <asp:TextBox ID="tbPassword" runat="server" TextMode="password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Must Provide a Password"
                ControlToValidate="tbPassword" Display="None" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="login_text">
        </td>
        <td>
            <asp:Button ID="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignup_Click"
                ValidationGroup="SignUpGroup" />
        </td>
    </tr>
</table>
(* Indicates a required field)
<br />
<asp:Label ID="lblCreateUser" runat="server" Text=""></asp:Label>
<asp:ValidationSummary ID="CreateUserSummary" runat="server" DisplayMode="BulletList"
    EnableClientScript="true" HeaderText="Please correct the following errors:" ValidationGroup="SignUpGroup" />
