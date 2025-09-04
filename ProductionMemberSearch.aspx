<%@ Page Title="Production Member Search" Language="C#" MasterPageFile="~/Daas_New.Master"
    AutoEventWireup="true" CodeBehind="ProductionMemberSearch.aspx.cs"
    Inherits="DaasPortal.DKPlus.ProductionMemberSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page specific styles/scripts can go here -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="pageHeader">
        <h2>Production Member Search</h2>
    </div>

    <!-- Filters -->
    <table>
        <tr>
            <td>Policy Number:</td>
            <td><asp:TextBox ID="txtPolicyNumber" runat="server" /></td>
            <td>State:</td>
            <td><asp:TextBox ID="txtState" runat="server" /></td>
            <td>Line of Business:</td>
            <td><asp:TextBox ID="txtLob" runat="server" /></td>
        </tr>
        <tr>
            <td>Page Size:</td>
            <td>
                <asp:DropDownList ID="ddlPageSize" runat="server">
                    <asp:ListItem Text="10" Value="10" />
                    <asp:ListItem Text="25" Value="25" />
                    <asp:ListItem Text="50" Value="50" />
                </asp:DropDownList>
            </td>
            <td colspan="4">
                <asp:Button ID="btnSearch" runat="server" Text="Search"
                    CssClass="btn" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>

    <!-- Results -->
    <asp:Panel ID="pnlResults" runat="server" Visible="false">
        <asp:GridView ID="grdMemberSearch" runat="server" CssClass="table table-striped"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="10"
            OnPageIndexChanging="grdMemberSearch_PageIndexChanging">
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
        </asp:GridView>
    </asp:Panel>
</asp:Content>
