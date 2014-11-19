<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="KrazyGames.Home.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="middle_content">
        <center>
            <h1>
                Contact Us</h1>
        </center>
        If you have a question or quibble about your order, your account, or any of our
        services, we should have the answer for you within our help pages. But if you can't
        find the answer you're looking for, our Customer Service team are happy to help
        you.
        <br />
        <br />
        You can drop us a line via email or post. We've also got some handy information
        lines you can call to find out the latest about our stores and products.*
        <br />
        <h3>
            Ways to contact us</h3>
        <table style="width: 100%;">
            <tr>
                <td class="style1">
                    <center>
                        <img src="/Images/address.jpg" alt="Address" /></center>
                </td>
                <td class="style2">
                    <center>
                        <img src="/Images/email.jpg" alt="email" /></center>
                </td>
                <td class="style3">
                    <center>
                        <img src="/Images/tele.jpg" alt="tele" /></center>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <center>
                        <h6>
                            Our Main Trading Office Address is:</h6>
                        Curzon Street<br />
                        Birmingham<br />
                        B4 7XG<br />
                        United Kingdom<br />
                    </center>
                </td>
                <td class="style2">
                    &nbsp;
                    <center>
                        contactus@krazygames.com</center>
                </td>
                <td class="style3">
                    <center>
                        <h6>
                            Product Information</h6>
                    </center>
                    <center>
                        0121 586 0011</center>
                    <br />
                    <center>
                        <h6>
                            Store Information</h6>
                    </center>
                    <center>
                        0121 555 0022</center>
                </td>
            </tr>
        </table>
        <center>
            <h4>
                Contact Us</h4>
        </center>
        <center>
            <table>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        First name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Surname:
                    </td>
                    <td>
                        <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Message:
                    </td>
                    <td>
                        <asp:TextBox ID="txtMessage" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </center>
        <br />
        <center>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" /></center>
        <center>
            <h2>
                Krazy Games Main Office</h2>
            <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0"
                marginwidth="0" src="https://maps.google.co.uk/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=B4+7XG&amp;aq=&amp;sll=52.482468,-1.883305&amp;sspn=0.011304,0.033023&amp;ie=UTF8&amp;hq=&amp;hnear=Birmingham+B4+7XG,+United+Kingdom&amp;ll=52.482467,-1.883297&amp;spn=0.011696,0.033023&amp;t=m&amp;z=14&amp;layer=c&amp;cbll=52.481912,-1.886541&amp;panoid=72GJAUJK6K7LX2SY3ouz6A&amp;cbp=12,334.99,,0,-1&amp;output=svembed">
            </iframe>
            <br />
            <small><a href="https://maps.google.co.uk/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=B4+7XG&amp;aq=&amp;sll=52.482468,-1.883305&amp;sspn=0.011304,0.033023&amp;ie=UTF8&amp;hq=&amp;hnear=Birmingham+B4+7XG,+United+Kingdom&amp;ll=52.482467,-1.883297&amp;spn=0.011696,0.033023&amp;t=m&amp;z=14&amp;layer=c&amp;cbll=52.481912,-1.886541&amp;panoid=72GJAUJK6K7LX2SY3ouz6A&amp;cbp=12,334.99,,0,-1"
                style="color: #0000FF; text-align: left">View Larger Map</a></small></center>
    </div>
</asp:Content>
