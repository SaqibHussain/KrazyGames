<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Deliveries.aspx.cs" Inherits="KrazyGames.Home.Deliveries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="middle_content">
        <h2>
            Delivery charges explained</h2>
        Whether you need your order urgently or are happy to wait a few days we've got a
        delivery option to suit you. With a range of services available from Next day and
        Saturday delivery to our economy 1-3 day service we're confident that you'll find
        a service that suits you and your lifestyle.
        <br />
        We've included a guide below to show you the services available and the approximate
        costs but please note that these are dependent on where you live and the product
        that you are ordering. The amount payable and the options available will be clearly
        shown in the checkout and on the order confirmation page.
        <br />
        Don't forget to give us your mobile number when you've completed your order and
        we'll send you a text to confirm that its left our warehouse and the tracking number
        of your parcel.
        <br />
        UPDATE 18th December 2012: Based on customer feedback we are very pleased to announce
        that as of this week unless your order is coming direct from one of our suppliers
        or is unusually large or heavy then your parcel will be delivered by either Royal
        Mail or UPS. Both of these couriers offer an excellent service and we are very pleased
        to have them on board.
        <br />
        <table>
            <tr>
                <td>
                    Delivery Type
                </td>
                <td>
                    Price per kg
                </td>
            </tr>
            <tr>
                <td>
                    Super
                </td>
                <td>
                    £1.00
                </td>
            </tr>
            <tr>
                <td>
                    Express
                </td>
                <td>
                    £0.90
                </td>
            </tr>
            <tr>
                <td>
                    Standard
                </td>
                <td>
                    £0.75
                </td>
            </tr>
            <tr>
                <td>
                    Economy
                </td>
                <td>
                    £0.50
                </td>
            </tr>
            <tr>
                <td>
                    Super Saver
                </td>
                <td>
                    £0.30
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
