<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Inherits="_Default" CodeBehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="middle_content">
 <div class="Flash">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                    width="900" height="235" id="Images/movingimages.swf" align="">
                    <param name="movie" value="Images/movingimages.swf">
                    <param name="quality" value="high">
                    <param name="bgcolor" value="#ffffff">
                    <embed src="Flash/movingimages.swf" quality="high" bgcolor="#ffffff" width="900"
                        height="235" name="Images/movingimages" align="" type="application/x-shockwave-flash"
                        pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
                </object>
            </div>
            <center>
                <div class="Maintext">
                    <h3>
                        Games, Consoles and Accessories</h3>
                    <br />
                    We know our video games as well as anyone and we want to share our enthusiasm with
                    you. We have a selection the best video games online across all platforms, as well
                    as some great accessories and consoles including the PS3, Xbox 360, and Wii and
                    Wii U. Fear not, we also love PC and handheld gaming. As the next generation of
                    consoles is revealed, we’re getting increasingly excited. Will the new Playstation
                    controller share attributes with the PS Vita? Will the new Xbox have even more Xbox
                    Kinect features? We’re not getting ahead of ourselves though; we still have some
                    great deals on DS games, PC games and Playstation Move bundles, as well as the best
                    games and accessories that Sony, Microsoft and Nintendo have to offer.
                </div>
            </center>
            <center>
                <div class="imageslide">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                        width="900" height="500" id="OBJECT1" align="">
                        <param name="movie" value="Images/imageslide.swf">
                        <param name="quality" value="high">
                        <param name="bgcolor" value="#ffffff">
                        <embed src="Flash/imageslide.swf" quality="high" bgcolor="#ffffff" width="900" height="500"
                            name="Images/imageslide" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
                    </object>
                </div>
            </center>
</div>

</asp:Content>
