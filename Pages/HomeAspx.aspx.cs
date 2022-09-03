using System;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Diagnostics;
using System.Web;
using System.IO;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.Globalization;

namespace RFFisio
{
	public partial class HomeAspx:Page
	{
		

		protected override void OnLoad(EventArgs e)
		{
			try
			{
			
				InitializePageContent();
				Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this));
			}
			catch (Exception ex)
			{
			}
		}


		public void ShowFormulas()
		{
			Label64.Text = Label64.Text.Replace("<", "&lt;");
			Label64.Text = Label64.Text.Replace(">", "&gt;");
			Label1.Text = Label1.Text.Replace("<", "&lt;");
			Label1.Text = Label1.Text.Replace(">", "&gt;");
			Label2.Text = Label2.Text.Replace("<", "&lt;");
			Label2.Text = Label2.Text.Replace(">", "&gt;");
			Label3.Text = Label3.Text.Replace("<", "&lt;");
			Label3.Text = Label3.Text.Replace(">", "&gt;");
			Label4.Text = Label4.Text.Replace("<", "&lt;");
			Label4.Text = Label4.Text.Replace(">", "&gt;");
			Label5.Text = Label5.Text.Replace("<", "&lt;");
			Label5.Text = Label5.Text.Replace(">", "&gt;");
			Label23.Text = Label23.Text.Replace("<", "&lt;");
			Label23.Text = Label23.Text.Replace(">", "&gt;");
			Label24.Text = Label24.Text.Replace("<", "&lt;");
			Label24.Text = Label24.Text.Replace(">", "&gt;");
			Label25.Text = Label25.Text.Replace("<", "&lt;");
			Label25.Text = Label25.Text.Replace(">", "&gt;");
			Label26.Text = Label26.Text.Replace("<", "&lt;");
			Label26.Text = Label26.Text.Replace(">", "&gt;");
			Label27.Text = Label27.Text.Replace("<", "&lt;");
			Label27.Text = Label27.Text.Replace(">", "&gt;");
			Label28.Text = Label28.Text.Replace("<", "&lt;");
			Label28.Text = Label28.Text.Replace(">", "&gt;");
			Label29.Text = Label29.Text.Replace("<", "&lt;");
			Label29.Text = Label29.Text.Replace(">", "&gt;");
			Label8.Text = Label8.Text.Replace("<", "&lt;");
			Label8.Text = Label8.Text.Replace(">", "&gt;");
			Label9.Text = Label9.Text.Replace("<", "&lt;");
			Label9.Text = Label9.Text.Replace(">", "&gt;");
			Label10.Text = Label10.Text.Replace("<", "&lt;");
			Label10.Text = Label10.Text.Replace(">", "&gt;");
			Label11.Text = Label11.Text.Replace("<", "&lt;");
			Label11.Text = Label11.Text.Replace(">", "&gt;");
			Label12.Text = Label12.Text.Replace("<", "&lt;");
			Label12.Text = Label12.Text.Replace(">", "&gt;");
			Label13.Text = Label13.Text.Replace("<", "&lt;");
			Label13.Text = Label13.Text.Replace(">", "&gt;");
			Label45.Text = Label45.Text.Replace("<", "&lt;");
			Label45.Text = Label45.Text.Replace(">", "&gt;");
			Label47.Text = Label47.Text.Replace("<", "&lt;");
			Label47.Text = Label47.Text.Replace(">", "&gt;");
			Label81.Text = Label81.Text.Replace("<", "&lt;");
			Label81.Text = Label81.Text.Replace(">", "&gt;");
		}

		private void InitializePageContent()
		{
			ShowFormulas();
		}

			protected void ___Button5_OnClick(object sender, EventArgs e)
			{
				bool ActionSucceeded_1 = true;
				try
				{
					string UrlPage = ResolveUrl("https://api.whatsapp.com/send?phone=557191871672&text=Gostaria%20de%20um%20atendimento!");
					try
					{
						ClientScript.RegisterStartupScript(this.GetType(), "OnClick_Nova janela do Browser", "<script>NavigatePopup('" + UrlPage + "');</script>");
					}
					catch(Exception ex)
					{
					}
				}
				catch (Exception ex)
				{
					ActionSucceeded_1 = false;
				}
			}

		protected override void InitializeCulture()
		{
			Utility.SetThreadCulture();  
		}

	}

}
