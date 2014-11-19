function HideContent(d) {
    if (d.length < 1) { return; }
    document.getElementById(d).style.display = "none";
}
function ShowContent(d) {
    if (d.length < 1) { return; }
    document.getElementById(d).style.display = "block";
}

//Shows and hides the bottom row of links depending on which page you are viewing
function showLinks() {
    if (location.href.indexOf('Default') != -1) { document.getElementById("Home").style.borderBottom = "2px solid #00BCF2"; ShowContent('Home_subnav'); HideContent('XboX_subnav'); HideContent('PS3_subnav'); HideContent('Wii_subnav'); HideContent('Handheld_subnav'); HideContent('My_Account_subnav'); }
    if (location.href.indexOf('/Home/') != -1) { document.getElementById("Home").style.borderBottom = "2px solid #00BCF2"; ShowContent('Home_subnav'); HideContent('XboX_subnav'); HideContent('PS3_subnav'); HideContent('Wii_subnav'); HideContent('Handheld_subnav'); HideContent('My_Account_subnav'); }
    if (location.href.indexOf('/XboX/') != -1) { document.getElementById("XboX").style.borderBottom = "2px solid #FF8C0D"; HideContent('Home_subnav'); ShowContent('XboX_subnav'); HideContent('PS3_subnav'); HideContent('Wii_subnav'); HideContent('Handheld_subnav'); HideContent('My_Account_subnav'); }
    if (location.href.indexOf('/PS3/') != -1) { document.getElementById("PS3").style.borderBottom = "2px solid #BAD80A"; HideContent('Home_subnav'); HideContent('XboX_subnav'); ShowContent('PS3_subnav'); HideContent('Wii_subnav'); HideContent('Handheld_subnav'); HideContent('My_Account_subnav'); }
    if (location.href.indexOf('/Wii/') != -1) { document.getElementById("Wii").style.borderBottom = "2px solid #FF00CC"; HideContent('Home_subnav'); HideContent('XboX_subnav'); HideContent('PS3_subnav'); ShowContent('Wii_subnav'); HideContent('Handheld_subnav'); HideContent('My_Account_subnav'); }
    if (location.href.indexOf('/Handheld/') != -1) { document.getElementById("Handheld").style.borderBottom = "2px solid #FFFF00"; HideContent('Home_subnav'); HideContent('XboX_subnav'); HideContent('PS3_subnav'); HideContent('Wii_subnav'); ShowContent('Handheld_subnav'); HideContent('My_Account_subnav'); }
    if (location.href.indexOf('/MyAccount/') != -1) { document.getElementById("My_Account").style.borderBottom = "2px solid #f00"; HideContent('Home_subnav'); HideContent('XboX_subnav'); HideContent('PS3_subnav'); HideContent('Wii_subnav'); HideContent('Handheld_subnav'); ShowContent('My_Account_subnav'); }
    if (location.href.indexOf('/Login/') != -1) { document.getElementById("My_Account").style.borderBottom = "2px solid #f00"; HideContent('Home_subnav'); HideContent('XboX_subnav'); HideContent('PS3_subnav'); HideContent('Wii_subnav'); HideContent('Handheld_subnav'); ShowContent('My_Account_subnav'); }
}
//Handles colour underlining for the bottom row of links
function linkColours() {
    if (location.href.indexOf('Default.aspx') != -1) { document.getElementById("home_subnav_home").style.borderBottom = "2px solid #00BCF2"; }
    if (location.href.indexOf('About.aspx') != -1) { document.getElementById("home_subnav_about").style.borderBottom = "2px solid #00BCF2"; }
    if (location.href.indexOf('Help.aspx') != -1) { document.getElementById("home_subnav_help").style.borderBottom = "2px solid #00BCF2"; }
    if (location.href.indexOf('ContactUs.aspx') != -1) { document.getElementById("home_subnav_contactus").style.borderBottom = "2px solid #00BCF2"; }

    if (location.href.indexOf('XboXSpecials.aspx') != -1) { document.getElementById("XboX_subnav_specials").style.borderBottom = "2px solid #FF8C0D"; }
    if (location.href.indexOf('XboXGames.aspx') != -1) { document.getElementById("XboX_subnav_games").style.borderBottom = "2px solid #FF8C0D"; }
    if (location.href.indexOf('XboXAccessories.aspx') != -1) { document.getElementById("XboX_subnav_accessories").style.borderBottom = "2px solid #FF8C0D"; }
    if (location.href.indexOf('XboXConsoles.aspx') != -1) { document.getElementById("XboX_subnav_consoles").style.borderBottom = "2px solid #FF8C0D"; }

    if (location.href.indexOf('PS3Specials.aspx') != -1) { document.getElementById("PS3_subnav_specials").style.borderBottom = "2px solid #BAD80A"; }
    if (location.href.indexOf('PS3Games.aspx') != -1) { document.getElementById("PS3_subnav_games").style.borderBottom = "2px solid #BAD80A"; }
    if (location.href.indexOf('PS3Accessories.aspx') != -1) { document.getElementById("PS3_subnav_accessories").style.borderBottom = "2px solid #BAD80A"; }
    if (location.href.indexOf('PS3Consoles.aspx') != -1) { document.getElementById("PS3_subnav_consoles").style.borderBottom = "2px solid #BAD80A"; }

    if (location.href.indexOf('WiiSpecials.aspx') != -1) { document.getElementById("Wii_subnav_specials").style.borderBottom = "2px solid #FF00CC"; }
    if (location.href.indexOf('WiiGames.aspx') != -1) { document.getElementById("Wii_subnav_games").style.borderBottom = "2px solid #FF00CC"; }
    if (location.href.indexOf('WiiAccessories.aspx') != -1) { document.getElementById("Wii_subnav_accessories").style.borderBottom = "2px solid #FF00CC"; }
    if (location.href.indexOf('WiiConsoles.aspx') != -1) { document.getElementById("Wii_subnav_consoles").style.borderBottom = "2px solid #FF00CC"; }

    if (location.href.indexOf('HandheldPSPGames.aspx') != -1) { document.getElementById("Handheld_subnav_PSPGames").style.borderBottom = "2px solid #FFFF00"; }
    if (location.href.indexOf('HandheldPSPConsoles.aspx') != -1) { document.getElementById("Handheld_subnav_PSPConsoles").style.borderBottom = "2px solid #FFFF00"; }
    if (location.href.indexOf('HandheldPSPAccessories.aspx') != -1) { document.getElementById("Handheld_subnav_PSPAccessories").style.borderBottom = "2px solid #FFFF00"; }
    if (location.href.indexOf('HandheldDSGames.aspx') != -1) { document.getElementById("Handheld_subnav_DSGames").style.borderBottom = "2px solid #FFFF00"; }
    if (location.href.indexOf('HandheldDSConsoles.aspx') != -1) { document.getElementById("Handheld_subnav_DSConsoles").style.borderBottom = "2px solid #FFFF00"; }
    if (location.href.indexOf('HandheldDSAccessories.aspx') != -1) { document.getElementById("Handheld_subnav_DSAccessories").style.borderBottom = "2px solid #FFFF00"; }

    if (location.href.indexOf('MyAccount.aspx') != -1) { document.getElementById("MyAccounts_subnav_MyAccounts").style.borderBottom = "2px solid #f00"; }
    if (location.href.indexOf('MyOrders.aspx') != -1) { document.getElementById("MyAccounts_subnav_MyOrders").style.borderBottom = "2px solid #f00"; }
    if (location.href.indexOf('Returns.aspx') != -1) { document.getElementById("MyAccounts_subnav_Returns").style.borderBottom = "2px solid #f00"; }
    if (location.href.indexOf('Preferences.aspx') != -1) { document.getElementById("MyAccounts_subnav_Preferences").style.borderBottom = "2px solid #f00"; }
    if (location.href.indexOf('MyReviews.aspx') != -1) { document.getElementById("MyAccounts_subnav_MyReviews").style.borderBottom = "2px solid #f00"; }
    if (location.href.indexOf('Wishlist.aspx') != -1) { document.getElementById("MyAccounts_subnav_Wishlist").style.borderBottom = "2px solid #f00"; }
}