<%@ Page Title="" Language="C#" MasterPageFile="~/DKPlus/Daas_New.Master" AutoEventWireup="true" CodeBehind="MemberBenefitCheck.aspx.cs" Inherits="DaasPortal.DKPlus.MemberBenefitCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        //$(function () {
        //    $(".datepicker").datepicker();

        //    $(".datepicker").datepicker("option", "showAnim", 'slide');
        //});
        $(function () {
            $(".datepicker").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-60:+0",
            });

            $(".datepicker").datepicker("option", "showAnim", 'slide');
        });
    </script>

    <script>
        function validate() {

            var temp = 0;
            var regex = /^[a-zA-Z t]*$/;
            var alphanum = /^[0-9a-zA-Z]+$/;
            var numeric = /^[0-9]+$/;
            var alphaspace = /^[a-zA-Z ]+$/;


            if ($("#ddl_Environment").val() == "0") {
                $("#ddl_Environment").focus();
                $("#ddl_Environment").css({ "border-color": "red" });
                alert("Please select environment.");
                return false;
            }
            else {
                $("#ddl_Environment").css({ "border-color": "inherit" });
            }


            if ($("#txt_subscriber_id").val() == ""
            ) {
                alert("Please Enter Subscriber Id.");
                return false;
            }
            if ($("#txtPolicyNumber").val() == ""
            ) {
                alert("Please Enter Policy No.");
                return false;
            }

            if ($("#ddlLob").val() == "-1") {
                $("#ddlLob").focus();
                $("#ddlLob").css({ "border-color": "red" });
                alert("Please select Lob.");
                return false;
            }

            processbar(1);
            return true;
        }
    </script>

    <script>
        function _show_hide(search_criteria) {

            if (search_criteria == 1) {
                $("#table_BulkIpload").toggle();
                if ($("#sign_table_BulkIpload").text() == "-")
                    $("#sign_table_BulkIpload").text("+");
                else
                    $("#sign_table_BulkIpload").text("-");
            }
            else if (search_criteria == 2) {
                $("#table_subscriber").toggle();
                if ($("#sign_table_subscriber").text() == "-")
                    $("#sign_table_subscriber").text("+");
                else
                    $("#sign_table_subscriber").text("-");
            }


        }
    </script>

    <script>
        function processbar(id) {
            if (id == 1)
                $("#loader").removeClass('hidden');
            else
                $("#loader").addClass('hidden');
        }


    </script>



    <script>
        function processbar1() {
            //fuTextFile
            $(".vicsWebWidth").focus();
            $("#img_loading").show();
            $("#img_loading").dialog({
                autoOpen: false, modal: true, show: "blind", hide: "blind"
            });
            $("#img_loading").dialog("open");
            $(".ui-dialog-titlebar.ui-widget-header.ui-corner-all.ui-helper-clearfix").hide();
            $(".ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-draggable.ui-resizable").removeClass("ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable");
            $(".blurscreen").toggle();
        }
    </script>


    <script>

        function HideEnvironmentDetails() {


            var selectedTrends = document.getElementById('ddl_Environment');

            for (var i = 0; i < selectedTrends.length; i++) {
                if (i == selectedTrends.length - 1) {

                    selectedTrends.options[i].disabled = true;
                    selectedTrends.options[i].style.display = "none";

                }

            }
        }

        function CheckSession_data() {
            alert("You need to login first");
            window.location.href = "../index.html";

        }
    </script>
    <script>
        $(document).ready(function () {
            $("select option[value*='2090']").hide();
        });
    </script>

    <script>

        function check_bulk_search_file() {
            if ($("#bulk_search_file").get(0).files.length == 0) {
                alert('Please select excel File');
                $("#bulk_search_file").focus();
                return false;
            }
            else if ($("#bulk_search_file").val().split(".")[1] != "xlsm") {
                alert('Please select correct template file.');
                $("#bulk_search_file").focus();
                return false;
            }
            else {
                processbar(1);
                return true;
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static" onload="processbar(0)">
    <div class="width100per" id="dvPatientEditContainer">
        <asp:HiddenField ID="hdn_member" runat="server" Value="0" />
        <asp:HiddenField ID="hdn_graphQL" runat="server" Value="0" />
        <div class="container-fluid form-horizontal">
            <div class="row">
                <div class="col-xs-12 heading">
                    <h3>Member Benefit Check</h3>
                </div>
            </div>
            <div class="col-sm-4" style="display: none;">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-5" for="Effective">No. of Records to Fetch <b><span style="color: red; font-size: larger">*</span> :</b> </label>
                        <div class="col-sm-7">
                            <input name="txt_request_result_count" runat="server" id="txt_request_result_count" type="text" class="form-control" onkeypress="return isNumber(event);" onblur="return ValidateResultCount();" />

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4" style="display: none;">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="Effective">Environment <b><span style="color: red; font-size: larger">*</span> :</b> </label>
                        <div class="col-sm-6">
                            <select id="ddl_Environment" class="form-control" runat="server" datavaluefield="ID" datatextfield="NAME"></select>
                        </div>
                        <div class="col-sm-2">
                            <img id="img_environment_status" src="../images/loading_wait.gif" style="border-radius: 50%; position: relative; display: none" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-group clearfix">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" href="#collapse1">Member Benefit Check</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse" runat="server">
                        <div class="panel-body">
                            <div class="panel-group clearfix">
                                <div class="panel panel-default">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" href="#collapse_bulkupload">Bulk Member Benefit Check</a>
                                            </h4>
                                        </div>
                                        <div id="collapse_bulkupload" class="panel-collapse collapse" runat="server">
                                            <div class="panel-body">
                                                <br />
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-2" for="email">Browse File:</label>
                                                        <div class="col-sm-10">
                                                            <asp:FileUpload ID="bulk_search_file" runat="server" AllowMultiple="false" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <a id="A1" runat="server" class="btn btn-sm btn-danger" href="../DKPlus/Template/Member_Benefit_Check_BulkUpload.xlsm" style="margin-left: 96%;">Download Sample File</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-1 col-sm-2">
                                                            <asp:Button ID="btnBulk_Search" Text="Upload" runat="server" class="btn btn-sm btn-success" OnClick="btnBulk_Search_Click" OnClientClick="return check_bulk_search_file();" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <br />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" href="#collapse2">Member Benefit Check</a>
                                        </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body">
                                            <div class="col-sm-4">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-4" for="Effective">LOB<b><span style="color: red; font-size: larger">*</span> :</b> </label>
                                                        <div class="col-sm-8">
                                                            <asp:DropDownList ID="ddlLob" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="-1">-Select-</asp:ListItem>
                                                                <asp:ListItem Text="E&I" Value="E&I"></asp:ListItem>
                                                                <asp:ListItem Text="C&S" Value="C&S"></asp:ListItem>
                                                                <asp:ListItem Text="M&R" Value="M&R"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-4" for="Effective">Subscriber ID<b><span style="color: red; font-size: larger">*</span> :</b> </label>
                                                        <div class="col-sm-8">
                                                            <asp:TextBox runat="server" TextMode="SingleLine" ID="txt_subscriber_id" onkeypress="return isNumber(event)" CssClass="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-4" for="Effective">Policy/Group Number<b><span style="color: red; font-size: larger">*</span> :</b></label>
                                                        <div class="col-sm-8">
                                                            <asp:TextBox runat="server" TextMode="SingleLine" ID="txtPolicyNumber" placeholder="000000000" MaxLength="9" onkeypress="return blockSpecialChar(event)" CssClass="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="divMemberSearch" runat="server" style="max-height: 50%; max-width: 100%; overflow: scroll; overflow-y: hidden;">


                    <asp:GridView ID="grd_MemberSearch" runat="server" AutoGenerateColumns="False" BackColor="White"
                        Width="90%" ShowHeaderWhenEmpty="true" EmptyDataText="No records Found" PageSize="10" AllowPaging="true" AllowSorting="true" OnPageIndexChanging="grd_MemberSearch_PageIndexChanging">
                        <HeaderStyle BackColor="#5577c8" ForeColor="white" Font-Size="Small" Font-Bold="false" CssClass="gridViewHeader" />
                        <PagerSettings Mode="NumericFirstLast" LastPageText="Last" FirstPageText="First" />
                        <Columns>
                            <asp:BoundField HeaderText="SUBSCRIBER ID" DataField="SUBSCRIBER_ID" ReadOnly="True" ItemStyle-HorizontalAlign="center" />
                            <asp:BoundField HeaderText="POLICY NO" DataField="POLICY_NUMBER" ReadOnly="True" ItemStyle-HorizontalAlign="center" />
                            <asp:BoundField HeaderText="LOB" DataField="LOB" ReadOnly="True" ItemStyle-HorizontalAlign="center"  />
                            <asp:BoundField HeaderText="STATUS" DataField="BENEFIT_CHECK_RESP_STATUS" ReadOnly="True" ItemStyle-HorizontalAlign="center"  />
                            
                        </Columns>
                    </asp:GridView>
                    <br />
                </div>
                <asp:HiddenField ID="appid" runat="server" />
                <asp:HiddenField ID="appid_gps" runat="server" />
                <div class="btn-group btn-group-sm pull-right">
                    <asp:Button ID="btn_save_criteria" CssClass="btn btn-primary" runat="server" Text="Submit Data Request" OnClientClick="return validate();" OnClick="btn_save_criteria_Click" ToolTip='"Privacy & Security-Before requesting, consider the minimum data needed, with the minimum sensitivity/classification, to be accessed by the minimum number of people, for the shortest amount of time necessary."' />
                    <br />
                </div>
            </div>
        </div>
    </div>
    <div id="loader" class="hidden">
        <img src="../img/loader.gif" />
    </div>
</asp:Content>
