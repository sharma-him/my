<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DaaSTopBar_New.ascx.cs" Inherits="DaasPortal.DKPlus.DaaSTopBar_New" %>
<script type="text/javascript" lang="javascript">


    function ShowHide(id) {

        if (id == "1") {

            $(".dvEdit").removeClass('hidden');
        }
        else {
            $(".dvEdit").addClass('hidden');
        }
    }
    function PopupCenter(url, title, w, h) {
        // Fixes dual-screen position                         Most browsers      Firefox
        var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
        var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

        var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
        var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

        var left = ((width / 2) - (w / 2)) + dualScreenLeft;
        var top = ((height / 2) - (h / 2)) + dualScreenTop;
        var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

        // Puts focus on the newWindow
        if (window.focus) {
            newWindow.focus();
        }
    }


</script>
<div class="line">
    <nav id="menu" class="topnav">
        <div class="col-xs-4 logo_container">
            <div class="logo">
                <a href="#">
                    <img src="../img/datakartnewlogoTDM_new_5.png" alt="DataKart Home" />

                </a>
            </div>
            <h1 style="padding-right:10px;">Data as a  Service</h1>
        </div>
        <div class="col-xs-8" style="width:auto;">
            <ul class="menu" style="text-align:right">
                <asp:HiddenField ID="hdnUserName" runat="server" />
                <li>
                    <div class="dvWelcome" onmouseover="ShowHide('1');"><span class="userpic">Welcome&nbsp;&nbsp;&nbsp;<img alt="" src="../Images/mypicture.jpg">&nbsp;</span><a href="#" style="border: none" class="opt-orange"> <%= Session["UserName"]%></a></div>
                    <div class="dvEdit hidden" style="float: right" onmouseout="ShowHide('0');"><a href="Account_New.aspx">Edit</a></div>
                </li>
                <li runat="server"><a href="../Intake/List_Of_IntakeForms.aspx" target="_blank" onclick="">Intake List</a></li>
                <li><a href="../Intake/List_Of_DefectForms.aspx" target="_blank" onclick="">Defect Form</a></li>
                <li><a target="_blank" href="DK_Plus_User_Manual.pdf">Help</a></li>
                <li><a href="#" onclick="PopupCenter('FAQPage.html','FAQ','800','470');">FAQ</a></li>               
                <li><a href="#" onclick="PopupCenter('FirstTimeDisclaimer.html','Disclaimer','800','470');">Privacy & Security Policy</a></li>
                <li><asp:LinkButton ID="Analytics" runat="server" OnClick="TopMenu_Click" href="HitCounter.aspx" CommandName="~/DKPlus/HitCounter.aspx">Analytics</asp:LinkButton></li>
                <li><a href="../Logout.aspx">Logout</a></li>


            </ul>
        </div>
    </nav>

</div>
