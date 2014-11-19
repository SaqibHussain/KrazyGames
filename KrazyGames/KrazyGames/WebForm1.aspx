<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="WebForm1.aspx.cs" Inherits="KrazyGames.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <asp:Image ID="pictureControlID" runat="server" AlternateText='<% #Eval("Image") %>'
                ImageUrl='<%# "/Images/" + Eval("Image") %>' />
        </ItemTemplate>
    </asp:ListView>



    <asp:ListView ID="lvImageRating" runat="server" GroupItemCount="2">
        <LayoutTemplate>
            <table cellpadding="2" width="300" runat="server">
                <tr runat="server" id="groupPlaceholder">
                </tr>
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr id="UserAcc" runat="server" style="margin: 3px; float: left;">
                <td runat="server" id="itemPlaceholder" />
            </tr>
        </GroupTemplate>
        <GroupSeparatorTemplate>
            <tr id="Tr3" runat="server">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
        </GroupSeparatorTemplate>
        <ItemTemplate>
            <td id="name" align="center" runat="server">
                      <asp:Image Width="50px" ID="pictureControlID" runat="server" ImageUrl='<%# "/Images/" + Eval("Image") %>' />
                             </td>
        </ItemTemplate>
<%--        <ItemSeparatorTemplate>
            <td id="Td2" class="separator" runat="server">
        
            </td>
        </ItemSeparatorTemplate>--%>
    </asp:ListView>

</asp:Content>
