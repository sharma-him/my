<%@ Page Title="Production Member Search" Language="C#" MasterPageFile="~/Daas_New.Master"
    AutoEventWireup="true" CodeBehind="ProductionMemberSearch.aspx.cs"
    Inherits="DaasPortal.DKPlus.ProductionMemberSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="pageHeader">
        <h2>Production Member Search</h2>
    </div>

    <!-- Search Filters -->
    <div id="divSearch" runat="server" class="searchPanel">
        <table class="tblSearch">
            <tr>
                <td>Policy Number:</td>
                <td><asp:TextBox ID="txtPolicyNumber" runat="server" CssClass="txtBox" /></td>
                <td>State:</td>
                <td><asp:TextBox ID="txtState" runat="server" CssClass="txtBox" /></td>
                <td>Line of Business:</td>
                <td><asp:TextBox ID="txtLob" runat="server" CssClass="txtBox" /></td>
            </tr>
            <tr>
                <td>Page Size:</td>
                <td>
                    <asp:DropDownList ID="ddlPageSize" runat="server" CssClass="ddlBox">
                        <asp:ListItem Text="10" Value="10" />
                        <asp:ListItem Text="25" Value="25" />
                        <asp:ListItem Text="50" Value="50" />
                    </asp:DropDownList>
                </td>
                <td colspan="4">
                    <asp:Button ID="btnSearch" runat="server" Text="Search"
                        CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>
    </div>

    <!-- Results Panel -->
    <div id="divMemberSearch" runat="server" visible="false" class="resultsPanel">
        <asp:GridView ID="grdMemberSearch" runat="server"
            CssClass="grid table table-striped table-bordered"
            AutoGenerateColumns="False" AllowPaging="True"
            PageSize="10" OnPageIndexChanging="grdMemberSearch_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="SubscriberId" HeaderText="Subscriber ID" />
                <asp:BoundField DataField="EnterpriseId" HeaderText="Enterprise ID" />
                <asp:BoundField DataField="CustomerNumber" HeaderText="Customer #" />
                <asp:BoundField DataField="PlanCoverageIdentifier" HeaderText="Plan Coverage" />
                <asp:BoundField DataField="EffectiveDate" HeaderText="Effective Date" />
                <asp:BoundField DataField="TerminationDate" HeaderText="Termination Date" />
                <asp:BoundField DataField="Town" HeaderText="Town" />
                <asp:BoundField DataField="State" HeaderText="State" />
            </Columns>
            <PagerStyle CssClass="pager" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
