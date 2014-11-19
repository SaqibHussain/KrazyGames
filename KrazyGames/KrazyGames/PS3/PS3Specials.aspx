<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="PS3Specials.aspx.cs" Inherits="KrazyGames.PS3.PS3Specials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="middle_content">
        <center>
            <div class="flash">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                    width="900" height="285" id="/Flash/PS3slides.swf" align="">
                    <param name="movie" value="/Flash/PS3slides.swf">
                    <param name="quality" value="high">
                    <param name="bgcolor" value="#ffffff">
                    <embed src="/Flash/PS3slides.swf" quality="high" bgcolor="#ffffff" width="900" height="285"
                        name="/Flash/PS3slides" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
                </object>
            </div>
        </center>
    </div>
</asp:Content>
