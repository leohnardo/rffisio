<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SidebarPage.ascx.cs" Inherits="RFFisio.SidebarPage" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
	<telerik:RadCodeBlock ID="CustomHeaderCodeBlock" runat="server">
		<link rel="stylesheet" href="0220801195158erência: Nenhuma" type="text/css" media="screen" title="no title" charset="utf-8" />
			<link rel="stylesheet" href="<%= ResolveUrl("~/Styles/Material_PanelBar_panelbar_default.css")%>" type ="text/css" media="screen" title="no title" charset="utf-8" />
	</telerik:RadCodeBlock>
	<asp:HiddenField ID="Sidebar_ClientState" runat="server" />
	<div id="Form1" runat="server" class="c_SidebarPage_Form1 c_SidebarPage_Form1">
		<div id="__MainDiv" class="SidebarPage_MainDiv" runat="server" StrechVertical="None">
			<div id="Div1" runat="server" AutoExpandToContent="False" AutoExpandToContentMargin="10"
				class="c_SidebarPage_Div1 div-secondary c_SidebarPage_Div1 div-secondary">
				<telerik:RadLabel id="labSolutionTitle" runat="server" CssClass="c_SidebarPage_labSolutionTitle c_SidebarPage_labSolutionTitle" Text="RFFisio" />
				<div class="c_container_Icon1">
					<i id="Icon1" class="fas fa-user-circle c_SidebarPage_Icon1 c_SidebarPage_Icon1">
					</i>
				</div>
			</div>
			<telerik:RadPanelBar id="PanelBar1" runat="server" CssClass="c_SidebarPage_PanelBar1 panelbar-default c_SidebarPage_PanelBar1 panelbar-default"
				CollapseAnimation-Duration="200" CollapseAnimation-Type="OutQuint" ExpandAnimation-Duration="200" ExpandAnimation-Type="OutQuint"
				ExpandMode="MultipleExpandedItems" OnClientItemClicked="___PanelBar1ClickHandler" PersistStateInCookie="True" RenderMode="Lightweight">
				<Items>
					<telerik:RadPanelItem id="PanelBarItem1" runat="server" CssClass="c_SidebarPage_PanelBarItem1 c_SidebarPage_PanelBarItem1"
						Text="<%$ Resources: PanelBarItem1 %>" Value="PanelBarItem1" />
					<telerik:RadPanelItem id="PanelBarItem12" runat="server" CssClass="c_SidebarPage_PanelBarItem12 c_SidebarPage_PanelBarItem12"
						Text="<%$ Resources: PanelBarItem12 %>" Value="PanelBarItem12" />
					<telerik:RadPanelItem id="PanelBarItem14" runat="server" CssClass="c_SidebarPage_PanelBarItem14 c_SidebarPage_PanelBarItem14"
						Text="<%$ Resources: PanelBarItem14 %>" Value="PanelBarItem14" />
					<telerik:RadPanelItem id="PanelBarItem11" runat="server" CssClass="c_SidebarPage_PanelBarItem11 c_SidebarPage_PanelBarItem11"
						Text="<%$ Resources: PanelBarItem11 %>" Value="PanelBarItem11" />
				</Items>
			</telerik:RadPanelBar>
		</div>
	</div>
<script type="text/javascript">
		function ___PanelBar1ClickHandler(sender, args)
		{
			var ClickedItem = args.get_item();
			if (HasValue(ClickedItem))
			{
				switch (ClickedItem.get_value())
				{
					case "PanelBarItem1":
						___PanelBarItem1_OnClick(sender, args);
					break;
					case "PanelBarItem12":
						___PanelBarItem12_OnClick(sender, args);
					break;
					case "PanelBarItem14":
						___PanelBarItem14_OnClick(sender, args);
					break;
					case "PanelBarItem11":
						___PanelBarItem11_OnClick(sender, args);
					break;
				}
			}
		}
		function ___PanelBarItem1_OnClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("~/PageUser") %>';
			NavigateBrowser(UrlPage);
		}
		function ___PanelBarItem12_OnClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("") %>';
			Navigate(UrlPage, false);
		}
		function ___PanelBarItem14_OnClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("~/Home") %>';
			NavigateBrowser(UrlPage);
		}
		function ___PanelBarItem11_OnClick(sender, args)
		{
			localStorage.removeItem('SSI_F'); localStorage.removeItem('SSI_T'); return Logoff();
		}
</script>
