<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="True" ValidateRequest="false" CodeFile="HomeAspx.aspx.cs" Inherits="RFFisio.HomeAspx" Culture="auto" UICulture="auto"%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="<%=RFFisio.Utility.CurrentSiteLanguage%>">
<head runat="server">
	<title><asp:Literal runat="server" Text="<%$ Resources: Form1 %>" /></title>


	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<telerik:RadStyleSheetManager runat="server" ID="styleSheetManager" EnableStyleSheetCombine="true" OutputCompression="AutoDetect">
		<StyleSheets>
			<telerik:StyleSheetReference Path="~/Styles/gvinci_button.css" OrderIndex="1"/>
			<telerik:StyleSheetReference Path="~/Styles/Material_ButtonStyle.css" OrderIndex="1"/>
			<telerik:StyleSheetReference Path="~/Styles/Material_LayoutRow_layoutrow_header_fixed_secondary.css" OrderIndex="1"/>
			<telerik:StyleSheetReference Path="~/Styles/Material_NavBar_navbar_accent.css" OrderIndex="1"/>
			<telerik:StyleSheetReference Path="~/Styles/Material_Button_button_rounded_secondary.css" OrderIndex="1"/>
			<telerik:StyleSheetReference Path="~/Styles/HomeAspx.css" OrderIndex="2"/>
		</StyleSheets>
	</telerik:RadStyleSheetManager>
	<telerik:RadCodeBlock ID="HeaderCodeBlock" runat="server">
		<link rel="stylesheet" href="<%= ResolveUrl("~/Styles/animate.min.css??sv=0.1_20220801195156") %>" type="text/css" media="screen" title="no title"/>
	<link rel="stylesheet" href="<%= ResolveUrl("~/Styles/bootstrap5.min.css??sv=0.1_20220801195156") %>" type="text/css" media="screen" title="no title"/>
		<link rel="stylesheet" href="<%= ResolveUrl("~/Styles/all.min.css??sv=0.1_20220801195156") %>" type="text/css" media="screen" title="no title"/>  
	</telerik:RadCodeBlock>
</head>
<body onload="InitializeClient();" id="Form1_body" style="margin-left:auto;margin-right:auto;">
	<telerik:RadCodeBlock ID="BodyCodeBlock" runat="server">
		


		<script type="text/javascript" src="<%= ResolveUrl("~/JS/jquery.js??sv=0.1_20220801195156") %>" ></script>
		<script type="text/javascript" src="<%= ResolveUrl("~/JS/jquery.mask.min.js??sv=0.1_20220801195156") %>" ></script>
		<script type="text/javascript" src="<%= ResolveUrl("~/JS/jquery.mask.global.js??sv=0.1_20220801195156") %>" ></script>
		<script type="text/javascript" src="<%= ResolveUrl("~/JS/bootstrap5.bundle.min.js??sv=0.1_20220801195156") %>" ></script>
		<script type="text/javascript" src="<%= ResolveUrl("~/JS/wow.min.js??sv=0.1_20220801195156") %>" ></script>
		<script type="text/javascript"> new WOW().init(); </script>
		
		<script type="text/javascript" src="<%= ResolveUrl("~/JS/Common.js??sv=0.1_20220801195156") %>"></script>
		<script type="text/javascript" src="<%= ResolveUrl("~/JS/Functions.js??sv=0.1_20220801195156") %>"></script>

			<script type="text/javascript" src="<%= ResolveUrl("~/JS/Material_LayoutRow_layoutrow_header_fixed_secondary.js??sv=0.1_20220801195156") %>"></script>
			<script type="text/javascript" src="<%= ResolveUrl("~/JS/HomeAspx_USER.js??sv=0.1_20220801195156") %>"></script>
				<script type="text/javascript" src="Nenhuma"></script>
				<script type="text/javascript" src="Nenhuma"></script>
		<script type="text/javascript">
			function OnLoginSucceded()
			{
				if(getParentPage() != self && getParentPage() != null)
				{
					getParentPage().OnLoginSucceded();
				}
			}
			function TryLogin(PageToRedirect, RefreshControlsID)
			{
				TryParentLogin(PageToRedirect, RefreshControlsID, false);
			}
			currentPath = "<%= Page.Request.Path %>";
		</script>
	</telerik:RadCodeBlock>
		
	<script type="text/javascript">
		function ___NavBarItem6_OnClick(sender, args)
		{
			var $g = jQuery.noConflict();
			var id = $j('#LayoutRowHome'), targetOffset = $g(id).offset().top;
			window.scrollTo({ top: targetOffset - 50, behavior: "smooth" });
		}
		function ___NavBarItem7_OnClick(sender, args)
		{
			var $g = jQuery.noConflict();
			var id = $j('#LayoutRowSobre'), targetOffset = $g(id).offset().top;
			window.scrollTo({ top: targetOffset - 50, behavior: "smooth" });
		}
		function ___NavBarItem10_OnClick(sender, args)
		{
			var $g = jQuery.noConflict();
			var id = $j('#LayoutColPortifolio'), targetOffset = $g(id).offset().top;
			window.scrollTo({ top: targetOffset - 50, behavior: "smooth" });
		}
		function ___NavBarItem9_OnClick(sender, args)
		{
			var $g = jQuery.noConflict();
			var id = $j('#LayoutColContato'), targetOffset = $g(id).offset().top;
			window.scrollTo({ top: targetOffset - 50, behavior: "smooth" });
		}
		function ___Button2_OnClientClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("https://api.whatsapp.com/send?phone=557191871672&text=Gostaria%20de%20um%20atendimento!") %>';
			NavigatePopup(UrlPage);
			args.set_cancel(true);
			return false;
		}
		function ___Button4_OnClientClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("~/Doc/Curriculo.docx") %>';
			NavigatePopup(UrlPage);
			args.set_cancel(true);
			return false;
		}
		function ___Button7_OnClientClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("https://www.instagram.com/raffafreitasfisio") %>';
			NavigatePopup(UrlPage);
			args.set_cancel(true);
			return false;
		}
		function ___Button6_OnClientClick(sender, args)
		{
			var UrlPage = '<%= ResolveUrl("mailto:rafaelfreitasfisio@hotmail.com") %>';
			NavigateBrowser(UrlPage);
			args.set_cancel(true);
			return false;
		}
		function ___Link1_OnClientClick(sender)
		{
			var $g = jQuery.noConflict();
			var id = $j('#Button6'), targetOffset = $g(id).offset().top;
			window.scrollTo({ top: targetOffset - 50, behavior: "smooth" });
			return false;
		}
	</script>
		<form id="Form1" runat="server" class="c_Form1">
			<asp:ScriptManager ID="MainScriptManager" runat="server"/>
				<div id="LayoutContainer1" runat="server" class="container-fluid c_LayoutContainer1">
					<div id="LayoutRow7" class="row c_LayoutRow7">
						<div id="LayoutCol4" class="col col-12 c_LayoutCol4">
							<div id="LayoutRow18" class="row c_LayoutRow18">
								<div id="LayoutCol61" class="col col-12 c_LayoutCol61">
									<div id="LayoutRow36" class="row c_LayoutRow36 layoutrow-header-fixed">
										<div id="LayoutCol62" class="col col-12 c_LayoutCol62">
											<div id="LayoutContainer4" runat="server" class="container c_LayoutContainer4">
												<div id="LayoutRow17" class="row c_LayoutRow17">
													<div id="LayoutCol40" class="col col-6 col-lg-3 c_LayoutCol40">
														<div id="Div26" runat="server" class="c_Div26 div-transparent">
															<div class="c_container_Icon16">
																<i id="Icon16" class="fas fa-hospital-user c_Icon16">
																</i>
															</div>
															<telerik:RadLabel id="Label64" runat="server" CssClass="c_Label64" Text="<%$ Resources: Label64 %>" />
														</div>
													</div>
													<div id="LayoutCol41" class="col col-6 col-lg-9 c_LayoutCol41">
														<telerik:RadNavigation id="NavBar1" runat="server" CssClass="c_NavBar1 navbar-accent" CollapseAnimation-Duration="200"
															CollapseAnimation-Type="OutQuint" ExpandAnimation-Duration="200" ExpandAnimation-Type="OutQuint" Flow="Horizontal" Height="55"
															OnClientNodeClicked="___NavBar1ClickHandler" RenderMode="Lightweight" Width="698">
															<Nodes>
																<telerik:NavigationNode id="NavBarItem6" runat="server" CssClass="c_NavBarItem6" Target="NavBarItem6"
																	Text="<%$ Resources: NavBarItem6 %>" />
																<telerik:NavigationNode id="NavBarItem7" runat="server" CssClass="c_NavBarItem7" Target="NavBarItem7"
																	Text="<%$ Resources: NavBarItem7 %>" />
																<telerik:NavigationNode id="NavBarItem10" runat="server" CssClass="c_NavBarItem10" Target="NavBarItem10"
																	Text="<%$ Resources: NavBarItem10 %>" />
																<telerik:NavigationNode id="NavBarItem9" runat="server" CssClass="c_NavBarItem9" Target="NavBarItem9"
																	Text="<%$ Resources: NavBarItem9 %>" />
															</Nodes>
														</telerik:RadNavigation>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="LayoutCol43" class="col col-12 c_LayoutCol43">
									<div id="LayoutContainer5" runat="server" class="container c_LayoutContainer5">
										<div id="LayoutRowHome" class="row c_LayoutRowHome">
											<div id="LayoutCol3" class="col col-12 col-lg-6 c_LayoutCol3">
												<asp:Image id="Image14" runat="server" class="c_Image14" ImageUrl="~/Images/RafaelFreitas Fisioterapia/rafael.jpg" />
											</div>
											<div id="LayoutCol2" class="col col-12 col-lg-6 c_LayoutCol2">
												<telerik:RadLabel id="Label1" runat="server" CssClass="c_Label1 wow fadeInRight" Text="<%$ Resources: Label1 %>" />
												<telerik:RadLabel id="Label2" runat="server" CssClass="c_Label2 wow fadeInRight" Text="<%$ Resources: Label2 %>" />
												<telerik:RadButton id="Button2" runat="server" ButtonType="SkinnedButton"
													CssClass="c_Button2 button-rounded-secondary wow fadeInRight gvButtonIconText gvButtonAlignIconRight" CommandName="Button2"
													OnClientClicking="___Button2_OnClientClick" RenderMode="Lightweight" TabIndex="3" Text="<%$ Resources: Button2 %>">
													<ContentTemplate>
														<span class="gvText">Agende uma Visita</span>
														<span class="fas fa-arrow-right c_Button2_icon gvIcon"></span>
													</ContentTemplate>
												</telerik:RadButton>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="LayoutCol36" class="col col-12 c_LayoutCol36">
							<div id="LayoutContainer3" runat="server" class="container c_LayoutContainer3">
								<div id="LayoutRowSobre" class="row c_LayoutRowSobre">
									<div id="LayoutCol5" runat="server" class="col col-12 col-lg-6 c_LayoutCol5">
										<telerik:RadLabel id="Label3" runat="server" CssClass="c_Label3 wow fadeInLeft" Text="<%$ Resources: Label3 %>" />
										<telerik:RadLabel id="Label4" runat="server" CssClass="c_Label4 wow fadeInLeft" Text="<%$ Resources: Label4 %>" />
										<telerik:RadLabel id="Label5" runat="server" CssClass="c_Label5 wow fadeInLeft" Text="<%$ Resources: Label5 %>" />
										<telerik:RadButton id="Button4" runat="server" ButtonType="SkinnedButton"
											CssClass="c_Button4 button-rounded-secondary wow fadeInLeft gvButtonIconText gvButtonAlignIconRight" CommandName="Button4"
											OnClientClicking="___Button4_OnClientClick" RenderMode="Lightweight" TabIndex="4" Text="<%$ Resources: Button4 %>">
											<ContentTemplate>
												<span class="gvText">Ver Currículo</span>
												<span class="fas fa-arrow-right c_Button4_icon gvIcon"></span>
											</ContentTemplate>
										</telerik:RadButton>
									</div>
									<div id="LayoutCol6" class="col col-12 col-lg-6 c_LayoutCol6">
										<asp:Image id="Image2" runat="server" class="c_Image2 wow fadeIn" ImageUrl="~/Images/RafaelFreitas Fisioterapia/fisio.png" />
									</div>
								</div>
								<div id="LayoutRow33" class="row c_LayoutRow33">
									<div id="LayoutColPortifolio" class="col col-12 c_LayoutColPortifolio">
										<telerik:RadLabel id="Label23" runat="server" CssClass="c_Label23 wow fadeIn" Text="<%$ Resources: Label23 %>" />
									</div>
									<div id="LayoutCol18" class="col col-12 col-lg-6 c_LayoutCol18">
										<asp:Image id="Image6" runat="server" class="c_Image6 wow fadeIn" ImageUrl="~/Images/RafaelFreitas Fisioterapia/banner1.png" />
									</div>
									<div id="LayoutCol25" class="col col-12 col-lg-6 c_LayoutCol25">
										<div id="LayoutRow22" class="row c_LayoutRow22">
											<div id="LayoutCol47" class="col col-12 col-sm-6 c_LayoutCol47">
												<div id="Div9" runat="server" class="c_Div9 div-surface wow fadeInRight">
													<div class="c_container_Icon5">
														<i id="Icon5" class="fas fa-check-square c_Icon5">
														</i>
													</div>
													<telerik:RadLabel id="Label24" runat="server" CssClass="c_Label24" Text="<%$ Resources: Label24 %>" />
												</div>
											</div>
											<div id="LayoutCol48" class="col col-12 col-sm-6 c_LayoutCol48">
												<div id="Div10" runat="server" class="c_Div10 div-surface wow fadeInRight">
													<div class="c_container_Icon6">
														<i id="Icon6" class="fas fa-check-square c_Icon6">
														</i>
													</div>
													<telerik:RadLabel id="Label25" runat="server" CssClass="c_Label25" Text="<%$ Resources: Label25 %>" />
												</div>
											</div>
											<div id="LayoutCol49" class="col col-12 col-sm-6 c_LayoutCol49">
												<div id="Div11" runat="server" class="c_Div11 div-surface wow fadeInRight">
													<div class="c_container_Icon7">
														<i id="Icon7" class="fas fa-check-square c_Icon7">
														</i>
													</div>
													<telerik:RadLabel id="Label26" runat="server" CssClass="c_Label26" Text="<%$ Resources: Label26 %>" />
												</div>
											</div>
											<div id="LayoutCol50" class="col col-12 col-sm-6 c_LayoutCol50">
												<div id="Div12" runat="server" class="c_Div12 div-surface wow fadeInRight">
													<div class="c_container_Icon8">
														<i id="Icon8" class="fas fa-check-square c_Icon8">
														</i>
													</div>
													<telerik:RadLabel id="Label27" runat="server" CssClass="c_Label27" Text="<%$ Resources: Label27 %>" />
												</div>
											</div>
											<div id="LayoutCol51" class="col col-12 col-sm-6 c_LayoutCol51">
												<div id="Div13" runat="server" class="c_Div13 div-surface wow fadeInRight">
													<div class="c_container_Icon9">
														<i id="Icon9" class="fas fa-check-square c_Icon9">
														</i>
													</div>
													<telerik:RadLabel id="Label28" runat="server" CssClass="c_Label28" Text="<%$ Resources: Label28 %>" />
												</div>
											</div>
											<div id="LayoutCol52" class="col col-12 col-sm-6 c_LayoutCol52">
												<div id="Div14" runat="server" class="c_Div14 div-surface wow fadeInRight">
													<div class="c_container_Icon10">
														<i id="Icon10" class="fas fa-check-square c_Icon10">
														</i>
													</div>
													<telerik:RadLabel id="Label29" runat="server" CssClass="c_Label29" Text="<%$ Resources: Label29 %>" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="LayoutRow31" class="row c_LayoutRow31">
									<div id="LayoutColServicos" class="col col-12 c_LayoutColServicos">
										<div id="LayoutRow3" class="row c_LayoutRow3">
											<div id="LayoutCol8" class="col col-12 col-sm-4 c_LayoutCol8">
												<div id="LayoutRow21" class="row c_LayoutRow21">
													<div id="LayoutCol46" class="col col-12 c_LayoutCol46 card">
														<asp:Image id="Image3" runat="server" class="c_Image3 wow fadeIn" ImageUrl="~/Images/RafaelFreitas Fisioterapia/RPG.png" />
														<telerik:RadLabel id="Label8" runat="server" CssClass="c_Label8 wow fadeInUp" Text="<%$ Resources: Label8 %>" />
														<telerik:RadLabel id="Label9" runat="server" CssClass="c_Label9 wow fadeInUp" Text="<%$ Resources: Label9 %>" />
													</div>
												</div>
											</div>
											<div id="LayoutCol11" class="col col-12 col-sm-4 c_LayoutCol11">
												<div id="LayoutRow20" class="row c_LayoutRow20">
													<div id="LayoutCol45" class="col col-12 c_LayoutCol45 card">
														<asp:Image id="Image4" runat="server" class="c_Image4 wow fadeIn" ImageUrl="~/Images/RafaelFreitas Fisioterapia/acupuntura.png" />
														<telerik:RadLabel id="Label10" runat="server" CssClass="c_Label10 wow fadeInUp" Text="<%$ Resources: Label10 %>" />
														<telerik:RadLabel id="Label11" runat="server" CssClass="c_Label11 wow fadeInUp" Text="<%$ Resources: Label11 %>" />
													</div>
												</div>
											</div>
											<div id="LayoutCol10" class="col col-12 col-sm-4 c_LayoutCol10">
												<div id="LayoutRow19" class="row c_LayoutRow19">
													<div id="LayoutCol44" class="col col-12 c_LayoutCol44 card">
														<asp:Image id="Image5" runat="server" class="c_Image5 wow fadeIn" ImageUrl="~/Images/RafaelFreitas Fisioterapia/neurofuncional2.png" />
														<telerik:RadLabel id="Label12" runat="server" CssClass="c_Label12 wow fadeInUp" Text="<%$ Resources: Label12 %>" />
														<telerik:RadLabel id="Label13" runat="server" CssClass="c_Label13 wow fadeInUp" Text="<%$ Resources: Label13 %>" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="LayoutRow35" class="row c_LayoutRow35">
									<div id="LayoutColContato" class="col col-12 c_LayoutColContato">
										<telerik:RadLabel id="Label45" runat="server" CssClass="c_Label45 wow fadeIn" Text="<%$ Resources: Label45 %>" />
									</div>
									<div id="LayoutCol32" class="col col-6 col-lg-3 c_LayoutCol32">
										<div id="LayoutRow27" class="row c_LayoutRow27">
											<div id="LayoutCol57" class="col col-12 c_LayoutCol57 card">
												<telerik:RadLabel id="Label47" runat="server" CssClass="c_Label47" Text="<%$ Resources: Label47 %>" />
											</div>
										</div>
									</div>
									<div id="LayoutCol33" class="col col-6 col-lg-3 c_LayoutCol33">
										<div id="LayoutRow28" class="row c_LayoutRow28">
											<div id="LayoutCol58" class="col col-12 c_LayoutCol58 card">
												<telerik:RadButton id="Button7" runat="server" ButtonType="SkinnedButton" CssClass="c_Button7 button-outline-primary"
													CommandName="Button7" OnClientClicking="___Button7_OnClientClick" RenderMode="Lightweight" TabIndex="5">
													<ContentTemplate>
														<span class="gvText"></span>
														<span class="fab fa-instagram c_Button7_icon gvIcon"></span>
													</ContentTemplate>
												</telerik:RadButton>
												<telerik:RadButton id="Button6" runat="server" ButtonType="SkinnedButton" CssClass="c_Button6 button-outline-primary"
													CommandName="Button6" OnClientClicking="___Button6_OnClientClick" RenderMode="Lightweight" TabIndex="1">
													<ContentTemplate>
														<span class="gvText"></span>
														<span class="fas fa-envelope-square c_Button6_icon gvIcon"></span>
													</ContentTemplate>
												</telerik:RadButton>
											</div>
										</div>
										<telerik:RadButton id="Button5" runat="server" ButtonType="SkinnedButton" CssClass="c_Button5 button-outline-primary" CommandName="Button5"
											OnClick="___Button5_OnClick" RenderMode="Lightweight" TabIndex="2">
											<ContentTemplate>
												<span class="gvText"></span>
												<span class="fab fa-whatsapp-square c_Button5_icon gvIcon"></span>
											</ContentTemplate>
										</telerik:RadButton>
									</div>
									<div id="LayoutCol37" class="col col-6 col-lg-3 c_LayoutCol37">
										<div id="LayoutRow29" class="row c_LayoutRow29">
											<div id="LayoutCol59" class="col col-12 c_LayoutCol59 card">
												<asp:LinkButton id="Link1" runat="server" class="c_Link1" Font-Underline="true"
													OnClientClick="___Link1_OnClientClick(this);return false;" Text="<%$ Resources: Link1 %>" />
											</div>
										</div>
									</div>
									<div id="LayoutCol38" class="col col-6 col-lg-3 c_LayoutCol38">
										<div id="LayoutRow30" class="row c_LayoutRow30">
											<div id="LayoutCol60" class="col col-12 c_LayoutCol60 card">
												<telerik:RadLabel id="Label81" runat="server" CssClass="c_Label81" Text="<%$ Resources: Label81 %>" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		
</body>
<telerik:RadCodeBlock ID="EndCodeBlock" runat="server">
<script type="text/javascript">
	ShowClientFormulas();

	function ShowClientFormulas()
	{
	}
		function ___NavBar1ClickHandler(sender, args)
		{
			var ClickedItem = args.get_node();
			var children = ClickedItem.get_nodes();
			if (HasValue(ClickedItem))
			{
				if (children.get_count() == 0) {
					collapseAll(ClickedItem);
				}
				switch (ClickedItem.get_target())
				{
					case "NavBarItem6":
						___NavBarItem6_OnClick(sender, args);
					break;
					case "NavBarItem7":
						___NavBarItem7_OnClick(sender, args);
					break;
					case "NavBarItem10":
						___NavBarItem10_OnClick(sender, args);
					break;
					case "NavBarItem9":
						___NavBarItem9_OnClick(sender, args);
					break;
				}
			}
		}
		function collapseAll(node) {
			node.collapse();
			var parent = node.get_parent();
			if (parent instanceof Telerik.Web.UI.RadNavigation) {
				parent.collapseMenuButton();
			} else {
				collapseAll(parent);
			}
		}

</script>
</telerik:RadCodeBlock>
</html>
<noscript>Please enable JavaScript in your browser!</noscript>
