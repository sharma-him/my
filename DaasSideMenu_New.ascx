<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DaasSideMenu_New.ascx.cs" Inherits="DaasPortal.DKPlus.DaasSideMenu_New" %>
<style>
    .no-border {
        border: none;
    }

    .doc-padding {
        padding-left: 5px;
    }
</style>
<script>
    $(function () {
        $(".aside a").mousedown(function (e) {
            //Right click event.
            if (e.which == "3") {
                var id = $(this).attr("id");
                alert(id);
                switch (id) {
                    case "DaasSide_ACIS":
                        //open in new tab
                        var win = window.open("AcisSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_ACIS_CreateData":
                        var win = window.open("ManageAcisRequest_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_ACIS_BRMS_UpdateData":
                        var win = window.open("BRMSDataUpdation_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CDB":
                        var win = window.open("MySearch_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CDB_CreateMember":
                        var win = window.open("CreateCDBMember_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CDB_UpdateMember":
                        var win = window.open("UpdateCDBMember.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CDB_AdvanceSearch":
                        var win = window.open("CDBAdvanceSearch_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CDB_RXMemberBulkRegistration":
                        var win = window.open("RXBulkMemberUpload.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CDB_RXMemberDashboard":
                        var win = window.open("RxCreateDataResult.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_lnkCAMS":
                        var win = window.open("CamsSearchData.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CIRRUS":
                        var win = window.open("http://www.dataselfservice.optum.com/tdeg-dss/login", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_COSMOS":
                        var win = window.open("CosmosSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_COSMOS_LoadGPSMembers":
                        var win = window.open("LoadGpsMembers.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_CSP_FACETS":
                        var win = window.open("FacetsSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_DENTAL_FACETS":
                        var win = window.open("DentalFacets_Search_Data.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_GPS":
                        var win = window.open("GpsSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_ICUE":
                        var win = window.open("ICUESearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_IMDM":
                        var win = window.open("IMDMSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_IVR":
                        var win = window.open("IvrSearchData_New.ASPX", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_C360":
                        var win = window.open("IvrSimplified_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_NDB":
                        var win = window.open("NDB_Search_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_NDB_MockData":
                        var win = window.open("NdbMockedUpData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_NICE":
                        var win = window.open("NiceSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_PRIME":
                        var win = window.open("PrimeSearchData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_PRIME_CreateData":
                        var win = window.open("PrimeCreateData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_PRIME_Dashboard":
                        var win = window.open("PrimeCreateDataResult_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_TOPS":
                        var win = window.open("Tops_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_TOPS_TestData":
                        var win = window.open("IntegrateTOPSTestData.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_TOPS_RealTimeData":
                        var win = window.open("IntegrateTopsData_New.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_TOPS_CreateClaim":
                        var url = '<%=ConfigurationManager.AppSettings["LinkToEDI"]%>';
                        url = url + HttpContext.Current.Session["ntid"].ToString();
                        var win = window.open(url, "_blank");
                        win.focus();
                        break;
                    case "DaasSide_VISION":
                        var win = window.open("Vision_Wonder_Box_Search_Data_New.aspx", "_blank");
                        win.focus();
                        break;
                    //case "DaasSide_B2B_TDR":
                    //    var win = window.open("B2BSearchData_New.aspx", "_blank");
                    //    win.focus();
                    //    break;
                    case "DaasSide_OPTUM_Rx":
                        var win = window.open("OptumRXSearchData.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_OptumRxTDMP":
                        var win = window.open("http://www.dataselfservice.optum.com/tdeg-dss/login", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_E_HEALTH":
                        var win = window.open("EHealthSearchData.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_Doc360":
                        var win = window.open("Doc360SearchData.aspx", "_blank");
                        win.focus();
                        break;
                    case "DaasSide_Fiserv_ID_Cards":
                        var win = window.open("FiservIdCardsSearchData.aspx", "_blank");
                        win.focus();
                        break;
                    default:
                        break;
                }
            }
        })
    });
</script>

<div id="dvSideMenu" runat="server" class="sideMenu1" style="margin: 0px; padding: 0px; height: 84vh;">
    <div class="sideMenu" runat="server">
        <div class="text-block"><span class="white sidehead"><a href="SearchDashBoardFilter_New2.aspx">Dashboard</a></span></div>
        <div style="margin: auto; position: relative;" class="aside" runat="server">
            <ul>
                <%--ACIS--%>
                <li class="dropdown">
                    <asp:LinkButton ID="ACIS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/AcisSearchData_New.aspx">ACIS</asp:LinkButton>
                    <asp:ImageButton ID="ACIS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--CDB--%>
                <li class="dropdown">
                    <asp:LinkButton ID="CDB" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/MySearch_New.aspx">CDB</asp:LinkButton>
                    <asp:ImageButton ID="CDB_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CDB_Search" runat="server" CommandName="~/DKPlus/MySearch_New.aspx" OnClick="sideMenu_Click">CDB Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CDB_CreateMember" runat="server" CommandName="~/DKPlus/CreateCDBMember_New.aspx" OnClick="sideMenu_Click">Create Member<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none; display: none">
                            <asp:LinkButton ID="MYUHCRegistration" runat="server" CommandName="~/DKPlus/MYUHCRegistration.aspx" OnClick="sideMenu_Click">myUHC Member  Registration<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="UploadFeedFile" runat="server" CommandName="~/DKPlus/UploadFeedFile.aspx" OnClick="sideMenu_Click">Upload Feed File<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border hidden" style="border: none; display: none">
                            <asp:LinkButton ID="CDB_RXMemberDashboard" runat="server" CommandName="~/DKPlus/RxCreateDataResult.aspx" OnClick="sideMenu_Click">RX Member Dashboard<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CDB_UpdateMember" runat="server" CommandName="~/DKPlus/UpdateCDBMember.aspx" OnClick="sideMenu_Click">Update Member<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CDB_DataCopy" runat="server" CommandName="~/DKPlus/CDBDataCopy.aspx" OnClick="sideMenu_Click">Member Data Copy<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>

                <%--CAMS--%>
                <li class="dropdown">
                    <asp:LinkButton ID="lnkCAMS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/CamsSearchData.aspx">CAMS</asp:LinkButton>
                    <asp:ImageButton ID="CAMS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="lnk_cams_search" runat="server" CommandName="~/DKPlus/CamsSearchData.aspx" OnClick="sideMenu_Click">CAMS Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="lnk_cams_fasa_mem_gen" runat="server" CommandName="~/DKPlus/CAMS_FSA_Member_Gen.aspx" OnClick="sideMenu_Click">CAMS FSA Member Generation<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="lnk_cams_member_feed_file" runat="server" CommandName="~/DKPlus/CAMSMemberFeedFile.aspx" OnClick="sideMenu_Click">CAMS Member Update<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--CIRRUS--%>
                <li>
                    <asp:LinkButton ID="CIRRUS" runat="server" OnClick="sideMenu_Click" CommandName="http://www.dataselfservice.optum.com/tdeg-dss/login">CIRRUS</asp:LinkButton>
                    <asp:ImageButton ID="CIRRUS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--TOPS--%>
                <li class="dropdown">
                    <asp:LinkButton ID="TOPS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/Tops_New.aspx">TOPS</asp:LinkButton>
                    <asp:ImageButton ID="TOPS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li style="border: none">
                            <asp:LinkButton ID="TOPS_Search" runat="server" CommandName="~/DKPlus/Tops_New.aspx" OnClick="sideMenu_Click">TOPS Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li style="border: none; display: none;">
                            <asp:LinkButton ID="TOPS_TestData" runat="server" CommandName="~/DKPlus/IntegrateTOPSTestData.aspx" OnClick="sideMenu_Click">TEST DATA<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li style="border: none; display: none;">
                            <asp:LinkButton ID="TOPS_RealTimeData" runat="server" CommandName="~/DKPlus/IntegrateTopsData_New.aspx" OnClick="sideMenu_Click">REAL TIME DATA<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li style="border: none">
                            <asp:LinkButton ID="TOPS_CreateClaim" runat="server" CommandName="EDI" OnClick="sideMenu_Click">CREATE CLAIM<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--ICUE--%>
                <li>
                    <asp:LinkButton ID="ICUE" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/ICUESearchData_New.aspx">ICUE</asp:LinkButton>
                    <asp:ImageButton ID="ICUE_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--NDB--%>
                <li class="dropdown">
                    <asp:LinkButton ID="NDB" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/NDB_Search_New.aspx">NDB</asp:LinkButton>
                    <asp:ImageButton ID="NDB_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li style="border: none">
                            <asp:LinkButton ID="NDB_Search" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/NDB_Search_New.aspx">NDB Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li style="border: none; display: none;">
                            <asp:LinkButton ID="NDB_MockData" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/NdbMockedUpData_New.aspx">MOCK NDB DATA<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--PRIME--%>
                <li class="dropdown">
                    <asp:LinkButton ID="PRIME" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/PrimeSearchData_New.aspx">PRIME</asp:LinkButton>
                    <asp:ImageButton ID="PRIME_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--Member Locator--%>
                <li>
                    <asp:LinkButton ID="lnkMemberlocator" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/MemberLocator.aspx">MEMBER LOCATOR</asp:LinkButton>
                    <asp:ImageButton ID="Mem_LOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--Member Benefit Check--%>
                <li>
                    <asp:LinkButton ID="lnkMemberCheck" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/MemberBenefitCheck.aspx">MEMBER BENEFIT CHECK</asp:LinkButton>
                    <asp:ImageButton ID="Member_Check" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--PA Member Eligibility Check--%>
                <li>
                    <asp:LinkButton ID="lnkMemberEligCheck" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/PAMemberEligCheck.aspx">PA-Member Eligibility Check</asp:LinkButton>
                    <asp:ImageButton ID="Member_Elig_Check" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--Data Repository--%>
                <li class="dropdown">
                    <asp:LinkButton ID="lnkDataRepository" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/DataRepository.aspx">Data Repository</asp:LinkButton>
                    <asp:ImageButton ID="DataRepository" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="lnkUploadData" runat="server" CommandName="~/DKPlus/BulkUploadDataRepository.aspx" OnClick="sideMenu_Click">Upload Data<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--IMDM--%>
                <li>
                    <asp:LinkButton ID="IMDM" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/IMDMSearchData_New.aspx">IMDM</asp:LinkButton>
                    <asp:ImageButton ID="IMDM_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>

                <%--CSP-FACETS--%>
                <li>
                    <asp:LinkButton ID="CSP_FACETS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/FacetsSearchData_New.aspx">CSP-FACETS</asp:LinkButton>
                    <asp:ImageButton ID="CSP_FACETS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CSP_Search" runat="server" CommandName="~/DKPlus/FacetsSearchData_New.aspx" OnClick="sideMenu_Click">CSP-FACETS Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>


                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CSP_CreateMember" runat="server" CommandName="~/DKPlus/CreateCSPMember_New.aspx" OnClick="sideMenu_Click">Create CSP Member<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>


                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="CSP_AddMemberAttribute" runat="server" CommandName="~/DKPlus/AddCSPMemberAttribute.aspx" OnClick="sideMenu_Click">Add CSP Mem Attribute<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>


                        </li>
                        <li style="border: none">
                            <asp:LinkButton ID="CSP_CreateClaim" runat="server" CommandName="EDI" OnClick="sideMenu_Click">CREATE CLAIM<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--DENTAL-FACETS--%>
                <li>
                    <asp:LinkButton ID="DENTAL_FACETS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/DentalFacets_Search_Data.aspx">DENTAL-FACETS</asp:LinkButton>
                    <asp:ImageButton ID="DENTAL_FACETS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="DentalFacets_Search" runat="server" CommandName="~/DKPlus/DentalFacets_Search_Data.aspx" OnClick="sideMenu_Click">DENTAL-FACETS Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="DentalFacets_ClaimsCreation" runat="server" CommandName="~/DKPlus/CreateDentalFacets_Claim.aspx" OnClick="sideMenu_Click">Create Dental Facets Claim<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--C360--%>
                <li>
                    <asp:LinkButton ID="C360" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/IvrSimplified_New.aspx">C360</asp:LinkButton>
                    <asp:ImageButton ID="C360_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--COSMOS--%>
                <li class="dropdown">
                    <asp:LinkButton ID="COSMOS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/CosmosSearchData_New.aspx">COSMOS</asp:LinkButton>
                    <asp:ImageButton ID="COSMOS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li id="CosmosMemberLoad" class="no-border" style="border: none">
                            <asp:LinkButton ID="COSMOS_LoadGPSMembers" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/LoadGpsMembers.aspx">Load GPS Members<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--GPS--%>
                <li class="dropdown">
                    <asp:LinkButton ID="GPS" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/GpsSearchData_New.aspx">GPS</asp:LinkButton>
                    <asp:ImageButton ID="GPS_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="lnk_gps_mem_search" runat="server" CommandName="~/DKPlus/GpsSearchData_New.aspx" OnClick="sideMenu_Click">GPS Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none; display: none">
                            <asp:LinkButton ID="lnk_mnr_mem_reg" runat="server" CommandName="~/DKPlus/MNRRegistration.aspx" OnClick="sideMenu_Click">M&R Member Registration<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--NICE--%>
                <li class="dropdown">
                    <asp:LinkButton ID="NICE" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/NiceSearchData_New.aspx">NICE</asp:LinkButton>
                    <asp:ImageButton ID="NICE_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="NICE_SearchData" runat="server" CommandName="~/DKPlus/NiceSearchData_New.aspx" OnClick="sideMenu_Click">NICE Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li class="no-border" style="border: none">
                            <asp:LinkButton ID="NICE_CreateData" runat="server" CommandName="~/DKPlus/CreateNICEMember.aspx" OnClick="sideMenu_Click">Create NICE Member<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>

                <%--IVR--%>
                <li>
                    <asp:LinkButton ID="IVR" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/IvrSearchData_New.aspx">IVR</asp:LinkButton>
                    <asp:ImageButton ID="IVR_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>





                <%--VISION--%>
                <li>
                    <asp:LinkButton ID="VISION" runat="server" CommandName="~/DKPlus/Vision_Wonder_Box_Search_Data_New.aspx" OnClick="sideMenu_Click">VISION</asp:LinkButton>
                    <asp:ImageButton ID="VISION_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--OPTUM Rx--%>
                <li class="dropdown">
                    <asp:LinkButton ID="OPTUM_Rx" runat="server" CommandName="~/DKPlus/OptumRXSearchData.aspx" OnClick="sideMenu_Click">Optum Rx</asp:LinkButton>
                    <asp:ImageButton ID="OPTRX_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                    <a class="dropdown-toggle" data-toggle="dropdown" style="float: right;">
                        <span class="glyphicon glyphicon-chevron-down pull-down"></span></a>
                    <ul class="dropdown-menu">
                        <li style="border: none">
                            <asp:LinkButton ID="OptumRxSearch" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/OptumRXSearchData.aspx">Optum Rx Search<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                        <li style="border: none">
                            <asp:LinkButton ID="OptumRxTDMP" runat="server" OnClick="sideMenu_Click" CommandName="https://tdmp.optum.com/tdmp/tdmplanding.html">ORx TDMP<span class="glyphicon glyphicon-chevron-right pull-right"></span></asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <%--E-HEALTH--%>
                <li>
                    <asp:LinkButton ID="E_HEALTH" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/EHealthSearchData.aspx">E-HEALTH</asp:LinkButton>
                    <asp:ImageButton ID="EHealth_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
                <%--Doc360--%>
                <li>
                    <asp:LinkButton ID="Doc360" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/Doc360_SearchData.aspx">Doc360</asp:LinkButton>
                </li>
                <%--Fiserv--%>
                <li>
                    <asp:LinkButton ID="Fiserv_ID_Cards" runat="server" OnClick="sideMenu_Click" CommandName="~/DKPlus/FiservIdCardsSearchData.aspx">Fiserv</asp:LinkButton>
                    <asp:ImageButton ID="Fiserv_DOC" runat="server" Height="12px" Width="18px" OnClick="document_img_Click" ImageUrl="~/Images/Edit_Icon.png" CssClass="doc-padding" />
                </li>
            </ul>
        </div>
        <br />
        <br />
        <span style="font-size: small; color: white;">*Gray background fields doesn't support search</span>
    </div>
</div>
