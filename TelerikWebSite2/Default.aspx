<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        .gridAuto {}
    </style>
</head>
<body> 
    <form id="form1" runat="server">
<%--    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>--%>

    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>

    </div>
    <div style="height: 32px">
        <h1>Patient DataBase</h1>
    </div>
        <div style="height: 84px">
        <p>Filter patient by color choice</p>
        <telerik:RadComboBox ID="RadComboBox1" Runat="server" Height="61px" AutoPostBack="True" OnSelectedIndexChanged="RadComboBox1_SelectedIndexChanged" style="margin-top: 0" Width="166px">
        </telerik:RadComboBox>  
    </div>
    <%--<div>
        <p>&nbsp;</p>
    </div>--%>
    <div style="height: 436px; width: 1198px;">
        <p>Choose a theme</p>
    <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server" EnableAJAX="true" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadComboBox1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadComboBox1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">

    </telerik:RadAjaxLoadingPanel>
                <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" Width="1000px" AllowPaging="True" AllowSorting="True"
            OnItemCommand="RadGrid1_ItemCommand" OnNeedDataSource="RadGrid1_NeedDataSource" CssClass="gridAuto" Height="279px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" TableLayout="Auto">
                <Columns>
            <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name"
              SortExpression="FirstName" UniqueName="FirstName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name"
              SortExpression="LastName" UniqueName="LastName">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn UniqueName="ColorPref_Blue" HeaderText="ColorPref_Blue" DataField="ColorPref_Blue"
              AllowSorting="true">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ColorPref_Green" HeaderText="ColorPref_Green" DataField="ColorPref_Green"
              AllowSorting="true">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ColorPref_Red" HeaderText="ColorPref_Red" DataField="ColorPref_Red"
              AllowSorting="true">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ColorPref_Purple" HeaderText="ColorPref_Purple" DataField="ColorPref_Purple"
              AllowSorting="true">
            </telerik:GridCheckBoxColumn>
            <telerik:GridTemplateColumn UniqueName="ChocoBox" HeaderText="ChocoPref" DataField="ChocoPref">
                    <ItemTemplate>
                    <asp:CheckBox ID="ChocoPref" runat="server" AutoPostBack="true" OnCheckedChanged="choco_checkchanged" Checked='<%# (DataBinder.Eval(Container.DataItem,"ChocoPref")) %>'/>
                    </ItemTemplate>
            </telerik:GridTemplateColumn> 

                </Columns>
                
                <PagerStyle Mode="NumericPages"></PagerStyle>
            </MasterTableView>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>
        



    </div>
    <div>
        <p>&nbsp;</p>
    </div>
    
    </form>
    </body>
</html>
