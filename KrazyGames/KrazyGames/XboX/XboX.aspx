<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="True"
    Inherits="XboX" CodeBehind="XboX.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="side_navigation_bar">
        <h4> Refine your search</h4>
        <div class="refine_section_wrapper">
            <div id="refine_search_textbox">
                <asp:TextBox ID="SearchTextBox" runat="server" Text="Search Within Results..." CssClass="searchbox"
                    Width="167"></asp:TextBox>
            </div>
            <div id="refine_search_button">
                <asp:ImageButton ID="imgSearch" runat="server" ImageUrl="/Images/Search.gif" />
            </div>
        </div>


        <div class="refine_section_wrapper">
        Select a Genre
            <asp:CheckBoxList ID="cblGenre" runat="server">
            </asp:CheckBoxList>    
        </div>


        <div class="refine_section_wrapper">
        Select an Age Rating
            <asp:CheckBoxList ID="cblRating" runat="server">
            </asp:CheckBoxList> 
        </div>

        <div class="refine_section_wrapper">
        Select a Price Range
        <br />
            £<asp:TextBox ID="tbPriceMin" runat="server" Width="35%"></asp:TextBox>
            to
            £<asp:TextBox ID="tbPriceMax" runat="server" Width="35%"></asp:TextBox>
        </div>

        <asp:Button ID="btnRefine" runat="server" Text="Refine" />
    </div>
    <div class="main_content">
        <div>
            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
            <asp:SiteMapPath ID="SiteMap1" runat="server">
            </asp:SiteMapPath>
        </div>
        <div id="content">
            <asp:Label ID="lblResults" runat="server" Text="Label"></asp:Label> Results Found.
            Items per page:
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
                <asp:ListItem Text="25" Value="25"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
            </asp:DropDownList>
            Sort By:
            <asp:DropDownList ID="SortByList" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Name" Value="Name"></asp:ListItem>
                <asp:ListItem Text="Price" Value="UnitPrice"></asp:ListItem>
            </asp:DropDownList>
            Sort Direction:
            <asp:DropDownList ID="SortDirectionList" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Ascending" Value="ASC"></asp:ListItem>
                <asp:ListItem Text="Descending" Value="DESC"></asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" BorderColor="#FF8C0D" BorderStyle="None"
                ShowHeader="false" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging"
                Width="685" EmptyDataText="Your search returned no results">
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
                 <asp:TemplateField SortExpression="Sort" ControlStyle-Width="70">
                        <ItemTemplate>
                                                <asp:Image ID="Image1" ImageUrl='<%#"/Images/Products/" + Eval("Image")%>' runat="server"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Sort" ControlStyle-CssClass="test" ControlStyle-Width="180">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnDetails" runat="server" Text='<%# Eval("Name") %>' OnCommand="lnkbtnDetails_Command"
                                CommandName="Details" CommandArgument='<%#Eval("ProductID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField SortExpression="Sort" ControlStyle-Width="200">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# "Release Date: " + Eval("Release_Date") %>'></asp:Label>
                            <br />
                            <asp:Label ID="lblQuickDescription" runat="server" Text='<%# "Quick Description: " + Eval("QuickDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField SortExpression="Sort" ControlStyle-Width="60">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" CssClass="price" Text='<%# "£" + Eval("UnitPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField SortExpression="Sort" ControlStyle-Width="140">
                        <ItemTemplate>
                             <asp:LinkButton ID="lnkbtnWishlist" runat="server" Text='Add to Wishlist' OnCommand="lnkbtnWishlist_Command"
                                CommandName="Wishlist" CommandArgument='<%#Eval("ProductID") %>'></asp:LinkButton>
                            <br />
                           <asp:LinkButton ID="lnkbtnShoppingCart" runat="server" Text='Add to Shopping Cart' OnCommand="lnkbtnShoppingCart_Command"
                                CommandName="ShoppingCart" CommandArgument='<%#Eval("ProductID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
