<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="KrazyGames.MyAccount.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="middle_content">
        Your wishlist:
        <asp:GridView ID="GridView1" runat="server" BorderColor="#FF8C0D" BorderStyle="None"
            ShowHeader="false" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging"
            Width="890px" EmptyDataText="No items in your wishlist">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <PagerStyle BackColor="#FFFFFF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#FFFFFF" ForeColor="#575757" BorderColor="#f5e74d" />
            <PagerSettings FirstPageText="First" Visible="true" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
            <Columns>
                <asp:TemplateField SortExpression="Sort" ControlStyle-Width="750">
                    <ItemTemplate>
                      <asp:LinkButton ID="lnkbtnDetails" runat="server" Text='<%# Eval("Name") %>' OnCommand="lnkbtnDetails_Command"
                                CommandName="Details" CommandArgument='<%#Eval("ProductID") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Sort" ControlStyle-Width="150">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkbtnDelete" runat="server" Text='Remove from Wishlist' OnCommand="lnkbtnDelete_Command"
                                CommandName="DeleteRow" CommandArgument='<%#Eval("WishlistID") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
