<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="KrazyGames.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="middle_content">
        <div id="left_content">
            <asp:Image ID="imgProduct" runat="server" CssClass="imgProduct" />
        </div>
        <div id="center_content">
            <asp:Label ID="lblProductName" runat="server" Text="" CssClass="titleProduct"></asp:Label>
            <br />
            Released on
            <asp:Label ID="lblReleaseDate" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblGameGenre" runat="server" Text=""></asp:Label>
            <br />
            Available for:
            <asp:Label ID="lblProductPrice" runat="server" Text="" CssClass="priceProduct"></asp:Label>
            <br />
            <asp:Label ID="lblProductDescription" runat="server" Text=""></asp:Label>
            <br />
            Quantity:
            <asp:Label ID="lblQuantity" runat="server" Text="Label"></asp:Label>
            <div>
                <asp:ListView ID="lvImageRating" runat="server" GroupItemCount="2">
                    <LayoutTemplate>
                        <table id="Table1" cellpadding="2" width="300" runat="server">
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
                        </tr>
                    </GroupSeparatorTemplate>
                    <ItemTemplate>
                        <td id="name" align="center" runat="server">
                            <asp:Image Width="70px" ID="pictureControlID" runat="server" ImageUrl='<%# "/Images/" + Eval("Image") %>' />
                        </td>
                    </ItemTemplate>
                    <ItemSeparatorTemplate>
                        <td id="Td2" class="separator" runat="server">
                        </td>
                    </ItemSeparatorTemplate>
                </asp:ListView>
            </div>
        </div>
        <div id="right_content">
            <asp:ImageButton ID="btnAddToBasket" runat="server" ImageUrl="/Images/btnCheckout.png"
                OnClick="btnAddToBasket_Click" />
            <asp:ImageButton ID="btnWishList" runat="server" ImageUrl="/Images/btnWishList.png"
                OnClick="btnWishList_Click" />
        </div>
        <br />
        <div class="reviews">
            <h4>
                Customer Reviews:</h4>
            <asp:GridView ID="gvReviews" runat="server" BorderColor="#FF8C0D" BorderStyle="None"
                ShowHeader="false" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnPageIndexChanging="gvReviews_PageIndexChanging"
                Width="880px" EmptyDataText="No reviews for this product yet">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <PagerStyle BackColor="#FFFFFF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFFFFF" ForeColor="#575757" BorderColor="#736F6E" />
                <PagerSettings FirstPageText="First" Visible="true" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                <Columns>
                    <asp:TemplateField SortExpression="Sort" ControlStyle-CssClass="test" ControlStyle-Width="50">
                        <ItemTemplate>
                            <asp:Label ID="lblrating" runat="server" Text='<%# Eval("Rating") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Sort" ControlStyle-Width="900">
                        <ItemTemplate>
                            <asp:Label ID="lblReview" runat="server" Text='<%#Eval("Review") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

                <div class="reviews">
            <h4>
                Submit a Review</h4>
                Select a Rating from 0 - 5
                    <asp:DropDownList ID="ddlRating" runat="server">
                    <asp:ListItem Selected="true" Text="" Value="" />
                    <asp:ListItem Selected="false" Text="1" Value="1" />
                    <asp:ListItem Selected="false" Text="2" Value="2" />
                    <asp:ListItem Selected="false" Text="3" Value="3" />
                    <asp:ListItem Selected="false" Text="4" Value="4" />
                    <asp:ListItem Selected="false" Text="4" Value="5" />
                    </asp:DropDownList>
                    <br />
                    Please enter a short review:
                    <asp:TextBox ID="tbReview" runat="server"  TextMode="MultiLine" Width="885px" ></asp:TextBox>
                    <asp:Button ID="btnReviewSubmit" runat="server" Text="Submit Review" 
                        onclick="btnReviewSubmit_Click" />

          
        </div>


    </div>
</asp:Content>
<%--text box and button for submit review, shopping cart AND wishlist buy button add no of quantity--%>
