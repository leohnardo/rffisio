using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.IO;
using System.Text;
using System.Web.SessionState;
using System.Resources;
using System.Globalization;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Configuration;
using System.Web.UI;
using System.Xml;
using System.Data;
using System.Security.Principal;
using System.Xml;
using System.Web.Configuration;
using Telerik.Web.UI;
using System.Collections.Generic;
using COMPONENTS;
using Newtonsoft.Json;
using System.Text;
using System.Net;

namespace RFFisio
{	


	public static class Utility
	{

		public static void SendPushNotification(string message, string title, string to, string authorizationKey, string senderId)
        {
            WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
            tRequest.Method = "post";
            tRequest.Headers.Add(string.Format("Authorization: key={0}", authorizationKey));  // "AAAA-N3yFyE:APA91bHw6wYu2Z0IhFzEJ5HIs_bJdUam1nuo18rZ5mB4SiQAQ7NOqD63_f1_Fpgm1kgmuRWTw8hVwKbn5VCHmitqel5hry_qsfUhJD04F9Xg2dkDBslNOFqsu7ry8NN049FkHnJ3mfrx"
            tRequest.Headers.Add(string.Format("Sender: id={0}", senderId));   // "1068875519777"
            tRequest.ContentType = "application/json";
            var payload = new
            {
                to = to, //"d8N53U-NbD0:APA91bE4mssDouXrKPc-JZAGlyYN9859oAJqLfhrYdp-X-vidxgume0TU3G_wIrhIsQ_7jlzhK3SrNJgvF8FDhqow6n8cNPy4zdC0LR0Ie6HOL7zD2A5UAi23gg1HcV-wxAWciEhOEX9",
                priority = "high",
                content_available = true,
                notification = new
                {
                    body = message,
                    title = title,
                    badge = 0
                },
            };

            string postbody = JsonConvert.SerializeObject(payload).ToString();
            Byte[] byteArray = Encoding.UTF8.GetBytes(postbody);
            tRequest.ContentLength = byteArray.Length;
            using (Stream dataStream = tRequest.GetRequestStream())
            {
                dataStream.Write(byteArray, 0, byteArray.Length);
                using (WebResponse tResponse = tRequest.GetResponse())
                {
                    using (Stream dataStreamResponse = tResponse.GetResponseStream())
                    {
                        if (dataStreamResponse != null) using (StreamReader tReader = new StreamReader(dataStreamResponse))
                            {
                                String sResponseFromServer = tReader.ReadToEnd();
                            }
                    }
                }
            }
        }


		public static T FixValue<T>(object Value)
		{
			T RetVal = default(T);
			if (typeof(T) == typeof(string))
			{
				if (Value != null) RetVal = (T)Value;
			}
			else if (typeof(T) == typeof(double))
			{
				if (Value != null) RetVal = (T)(object)Convert.ToDouble(Value);
			}
			else if (typeof(T) == typeof(bool))
			{
				if (Value != null) RetVal = (T)(object)bool.Parse(Value.ToString());
			}
			else if (typeof(T) == typeof(DateTime))
            {
                if (Value != null) RetVal = (T)(object)DateTime.Parse(Value.ToString());
				else RetVal = (T)(object)(new DateTime());
            }
			return RetVal;
		}
		public static string siteLanguage
		{
			get
			{
				return ConfigurationManager.AppSettings["SiteLanguage"];
			}
		}
		
		public static string CurrentSiteLanguage
		{
			get
			{
				return HttpContext.Current.Session["PreferedCulture"].ToString();
			}
		}

		/// <summary>
		/// Nome da página inicial para a aplicação
		/// </summary>
		public static string StartPageName
		{
			get
			{
				return ConfigurationManager.AppSettings["StartPage"];   
			}
		}
		
		/// <summary>
		/// Nome da página de login
		/// </summary>
		public static string LoginPageName
		{
			get
			{
				return ConfigurationManager.AppSettings["AccessDeniedUrl"];
			}
		}

		
		public static bool DoLogin(string User, string Password, Page Page, ref string Error , object AjaxPanel)
        {
            return DoLogin(User, Password, Page, ref Error , AjaxPanel, true);
        }

		public static bool DoLogin(string User, string Password, Page Page, ref string Error , object AjaxPanel, bool ShouldRedirect)
		{
			User = User.ToUpper();
			Password = Password.ToUpper();
			return false;
		}

		public static void SetControlTabOnEnter(WebControl vgTextBox)
		{
			Utility.SetControlOnFocus(vgTextBox);
		}

		public static void SetControlOnFocus(WebControl Control)
		{
			string script = "SetControlOnFocus('" + Control.ClientID + "', " + Control.Page.IsPostBack.ToString().ToLower() + ");";

			Control.Page.ClientScript.RegisterStartupScript(Control.Page.GetType(), "SetControlOnFocus" + Control.ClientID, "<script>" + script + "</script>");
		}

		public static void CheckAuthentication(Page Page, bool TryOnParent)
		{
			FileInfo F = new FileInfo(Page.Request.Path);
			string PageName = F.ToString();	


			if (Page.Request.QueryString.Count > 0)
			{
				PageName += "?" + Page.Request.QueryString.ToString();
			}
			PageName = Base64.Encode(PageName);
			if (!Page.User.Identity.IsAuthenticated || Page.Session["vgUserId"] == null || (Page.Request["__EVENTTARGET"] != null && Page.Request["__EVENTTARGET"].ToUpper() == "LOGOFF"))
			{
				if (TryOnParent)
				{
					HttpContext.Current.Response.Redirect("~/Pages/BlankPage.aspx?RequestingPage=" + PageName);
				}
				else
				{
					Page.ClientScript.RegisterStartupScript(Page.GetType(), "RequestLogin", "<script>TryLogin('" + PageName + "','');</script>");
				}
			}
		}
		public static void CheckAuthentication(Page Page)
		{
			CheckAuthentication(Page, true);
		}


		/// <summary>
		/// Altera configuração do App.Config, de um determinado banco
		/// </summary>
		/// <param name="vgKey">Key usada como referencia</param>
		/// <param name="vgValue">Valor a ser colocado no weconfig</param>
		public static void SetAppConfig(string DatabaseName, string vgKey, string vgValue )
		{
			SetAppConfig(DatabaseName, vgKey, vgValue, HttpContext.Current.Server.MapPath("~/App_Data/App.Config"));
		}

		private static void SetAppConfig(string DatabaseName, string vgKey, string vgValue, string ConfigFile)
		{
			XmlDocument vgDoc = new XmlDocument();
			vgDoc.Load(ConfigFile);
			vgDoc.SelectSingleNode(string.Format("/Configuration/Databases/Database[@Name='{0}']/Setting[@key='{1}']", DatabaseName, vgKey)).Attributes["value"].Value = vgValue;
			vgDoc.Save(ConfigFile);
		}

		public static void SetApplicationLanguage(string NeutralLanguage, Page Page, object AjaxPanel)
		{
			HttpContext.Current.Session["PreferedCulture"] = NeutralLanguage;
			SetThreadCulture();
			string RefreshBrowser = "setTimeout(\"RefreshBrowser();\",300);";
			if (AjaxPanel == null)
			{
				Page.ClientScript.RegisterStartupScript(Page.GetType(), "Refresh", "<script>" + RefreshBrowser + "</script>");
			}
			else
			{
				((RadAjaxPanel)AjaxPanel).ResponseScripts.Add(RefreshBrowser);
			}
		}
		
		public static void RegisterInitializePropertiesDynamically(string[] SetImages, Page Page)
		{
			string Script = "\r\n<script type=\"text/javascript\">\r\n" +
							"	function InitializePropertiesDynamically()\r\n" +
							"	{\r\n" +
							"		var $j = jQuery.noConflict();\r\n" +
							"		$j(document).ready(function()\r\n" +
							"		{\r\n" +
									string.Join("\t\t\t\r\n", SetImages) +
							"		});\r\n" +
							"	}\r\n" +
							"	InitializePropertiesDynamically();\r\n" +
							"</script>\r\n";

			Page.ClientScript.RegisterStartupScript(Page.GetType(), "InitializePropertiesDynamically", Script);
		}

		/// <summary>
		/// Coloca caracteres a esquerda até a string ter o numero de caracteres passado
		/// </summary>
		/// <param name="str">String passada para ser co completa</param>
		/// <param name="TotalWidth">Tamanho final da string</param>
		/// <returns>Sting pronta</returns>
		public static string LPad(string str, int TotalWidth)
		{
			return str.PadLeft(TotalWidth);
		}

		/// <summary>
		/// Coloca caracteres a esquerda até a string ter o numero de caracteres passado e faz o pad com os caracteres passados
		/// </summary>
		/// <param name="str">String que vai ser modificada</param>
		/// <param name="TotalWidth">Tamanho que a string vai ficar</param>
		/// <param name="PaddingChar">Caracter que vai ser usado no pad</param>
		/// <returns>String pronta</returns>
		public static string LPad(string str, int TotalWidth, char PaddingChar)
		{
			return str.PadLeft(TotalWidth, PaddingChar);
		}
		/// <summary>
		/// Coloca caracteres a direita até a string ter o numero de caracteres passado
		/// </summary>
		/// <param name="str">String passada para ser co completa</param>
		/// <param name="TotalWidth">Tamanho final da string</param>
		/// <returns>String pronta</returns>
		public static string RPad(string str, int TotalWidth)
		{
			return str.PadRight(TotalWidth);
		}

		/// <summary>
		/// Coloca caracteres a direita até a string ter o numero de caracteres passado e faz o pad com os caracteres passados
		/// </summary>
		/// <param name="str">String que vai ser modificada</param>
		/// <param name="TotalWidth">Tamanho que a string vai ficar</param>
		/// <param name="PaddingChar">Caracter que vai ser usado no pad</param>
		/// <returns>string pronta</returns>
		public static string RPad(string str, int TotalWidth, char PaddingChar)
		{
			return str.PadRight(TotalWidth, PaddingChar);
		}

		public static Control GetParentByType(Control BaseControl, Type ParentType)
        {
            Control RetControl = BaseControl;
            while (RetControl.Parent != null)
            {
                RetControl = RetControl.Parent;
                if (RetControl.GetType() == ParentType)
                {
                    return RetControl;
                }
            }
            return null;
        }


		/// <summary>
		/// Count number of occurrence of a string in another
		/// </summary>
		/// <param name="Str">String instance</param>
		/// <param name="FindString">Find value</param>
		/// <returns></returns>
		public static int Tally(string Str, string FindString)
		{ 
			int Return = 0;
			int i;
			int Start = 0;
			do
			{
				i = Str.IndexOf(FindString, Start, StringComparison.Ordinal);
				if (i != -1)
				{
					Return++;
					Start = i + 1;
				}
			} while (i != -1);
			return Return;
		}

		/// <summary>
		/// Converde de asc para caracter
		/// </summary>
		/// <param name="Asc">Asc a ser convertido</param>
		/// <returns>Chr reultante da converção</returns>
		public static string Chr(int Asc)
		{
			byte[] Tmp = new byte[1];
			Tmp[0] = Convert.ToByte(Asc);
			return System.Text.Encoding.GetEncoding(1252).GetString(Tmp);
		}

		/// <summary>
		/// Converte de caracter para asc
		/// </summary>
		/// <param name="Chr">Caracter a ser convertido</param>
		/// <returns>Asc resultante da converção</returns>
		public static int Asc(string Chr)
		{
			return Encoding.GetEncoding(1252).GetBytes(Chr)[0];
		}

		/// <summary>
		/// Substirui na string str o valor de NewStr o naa posição Index
		/// </summary>
		/// <param name="Str">String a ser modificada</param>
		/// <param name="Index">Lugar da string a ser substiruido</param>
		/// <param name="NewStr">Novo pedaço da string</param>
		public static void ChangeStr(ref string Str, int Index, string NewStr)
		{
			Str = Str.Remove(Index, NewStr.Length);
			Str = Str.Insert(Index, NewStr);
		}

		/// <summary>
		/// Substirui na string str o valor de NewStr o naa posição Index
		/// </summary>
		/// <param name="Str">String a ser modificada</param>
		/// <param name="Index">Lugar da string a ser substiruido</param>
		/// <param name="NewStr">Novo Char da string</param>
		public static void ChangeStr(ref string Str, int Index, char NewStr)
		{
			Str = Str.Remove(Index, 1);
			Str = Str.Insert(Index, Convert.ToString(NewStr));
		}

		/// <summary>
		/// Seta a cultura da pagina de acordo com as preferencias do usuario
		/// </summary>
		public static void SetThreadCulture()
		{
			HttpContext current = HttpContext.Current;
			Hashtable locales = (Hashtable)current.Application["_locales"];
			if (current.Application[current.Request.PhysicalPath] != null)
			{
				current.Request.ContentEncoding = System.Text.Encoding.GetEncoding(current.Application[current.Request.PhysicalPath].ToString());
			}
			
			string culture = "";

			if (current.Session["PreferedCulture"] != null)
			{
				culture = current.Session["PreferedCulture"].ToString();
			}
			else
			{
				culture = siteLanguage;
				current.Session.Add("PreferedCulture", culture);
			}

			if (!System.Threading.Thread.CurrentThread.CurrentCulture.Equals((CultureInfo)locales[culture]))
			{
				current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				current.Response.Expires = 0;
				current.Response.Cache.SetNoStore();
				current.Response.AppendHeader("Pragma", "no-cache");
			}
			System.Threading.Thread.CurrentThread.CurrentCulture = (CultureInfo)locales[culture];
			System.Threading.Thread.CurrentThread.CurrentUICulture = CultureInfo.CurrentCulture;
		}

		public static string Replace(string Str, string oldValue, string newValue, bool wholeWorld, bool ignoreCase, bool useWildCards, bool replaceAll)
		{
			Regex regex;
			string regExString = oldValue;
			if (useWildCards)
			{
				regExString = regExString.Replace("*", @"\w*");     // multiple characters wildcard (*)
				regExString = regExString.Replace("?", @"\w");      // single character wildcard (?)

				// if wild cards selected, find whole words only
				regExString = String.Format("{0}{1}{0}", @"\b", regExString);
			}
			else
			{
				// replace escape characters
				regExString = Regex.Escape(regExString);
			}

			// Is whole word check box checked?
			if (wholeWorld)
			{
				regExString = String.Format("{0}{1}{0}", @"\b", regExString);
			}

			// Is match case checkbox checked?
			if (ignoreCase)
			{
				regex = new Regex(regExString, RegexOptions.IgnoreCase);
			}
			else
			{
				regex = new Regex(regExString);
			}

			if (replaceAll)
			{
				return regex.Replace(Str, newValue);
			}
			else
			{
				return regex.Replace(Str, newValue, 1);
			}
		}	

		public static bool StringConverterToBool(string Value)
		{
			if (Value.ToLower() == "1" || Value.ToLower() == "-1" || Value.ToLower() == "yes" || Value.ToLower() == "true" || Value.ToLower() == "sim")
				return true;
			else 
				return false;
		}

		/// <summary>
		/// Coloca underline nos espaços em branco
		/// </summary>
		/// <param name="St">String a ser corrigida</param>
		/// <returns>String com underline em vez de espaço</returns>
		public static string PoeUnderLines(string St)
		{
			return St.Replace(" ", "_");
		}
	}
}

namespace COMPONENTS
{
	public class vgCultureInfo : CultureInfo
	{

		private string m_BooleanFormat;
		private string m_numberZeroFormat;
		private string m_numberNullFormat;
		private string m_outputEncoding;
		private string m_defaultCountry;
		private string[] m_weekdayNarrowNames;

		public vgCultureInfo(string name) : base(name)
		{
		}

		public string BooleanFormat
		{
			get
			{
				return m_BooleanFormat;
			}
			set
			{
				m_BooleanFormat = value;
			}

		}

		public string NumberZeroFormat
		{
			get
			{
				return m_numberZeroFormat;
			}
			set
			{
				m_numberZeroFormat = value;
			}
		}

		public string[] WeekdayNarrowNames
		{
			get
			{
				return m_weekdayNarrowNames;
			}
			set
			{
				m_weekdayNarrowNames = value;
			}
		}

		public string DefaultCountry
		{
			get
			{
				return m_defaultCountry;
			}
			set
			{
				m_defaultCountry = value;
			}
		}

		public string NumberNullFormat
		{
			get
			{
				return m_numberNullFormat;
			}
			set
			{
				m_numberNullFormat = value;
			}
		}

		public string Encoding
		{
			get
			{
				return m_outputEncoding;
			}
			set
			{
				m_outputEncoding = value;
			}
		}
	}

	public class Cultura : System.Configuration.IConfigurationSectionHandler
	{
		public Cultura()
		{
		}

		public object Create(object parent, object configContext, XmlNode section)
		{
			Hashtable locales = new Hashtable();
			foreach (XmlNode node in section.SelectNodes("*"))
			{
				vgCultureInfo ci = new vgCultureInfo(node.SelectSingleNode("@name").Value);
				locales.Add(node.SelectSingleNode("@language").Value + (node.SelectSingleNode("@country").Value == "" ? "" : ("-" + node.SelectSingleNode("@country").Value)), ci);
				ci.BooleanFormat = node.SelectSingleNode("@booleanFormat").Value;
				ci.DefaultCountry = node.SelectSingleNode("@defaultCountry").Value;
				ci.Encoding = node.SelectSingleNode("@encoding").Value;
				if (node.SelectSingleNode("@weekdayShortNames") != null)
					ci.DateTimeFormat.AbbreviatedDayNames = node.SelectSingleNode("@weekdayShortNames").Value.Split(new char[] { ';' });
				if (node.SelectSingleNode("@weekdayNarrowNames") != null)
					ci.WeekdayNarrowNames = node.SelectSingleNode("@weekdayNarrowNames").Value.Split(new char[] { ';' });
				if (node.SelectSingleNode("@weekdayNames") != null)
					ci.DateTimeFormat.DayNames = node.SelectSingleNode("@weekdayNames").Value.Split(new char[] { ';' });
				if (node.SelectSingleNode("@monthShortNames") != null)
					ci.DateTimeFormat.AbbreviatedMonthNames = node.SelectSingleNode("@monthShortNames").Value.Split(new char[] { ';' });
				if (node.SelectSingleNode("@monthNames") != null)
					ci.DateTimeFormat.MonthNames = node.SelectSingleNode("@monthNames").Value.Split(new char[] { ';' });
				if (node.SelectSingleNode("@shortDate") != null)
					ci.DateTimeFormat.ShortDatePattern = node.SelectSingleNode("@shortDate").Value;
				if (node.SelectSingleNode("@shortTime") != null)
					ci.DateTimeFormat.ShortTimePattern = node.SelectSingleNode("@shortTime").Value;
				if (node.SelectSingleNode("@longDate") != null)
					ci.DateTimeFormat.LongDatePattern = node.SelectSingleNode("@longDate").Value;
				if (node.SelectSingleNode("@longTime") != null)
					ci.DateTimeFormat.LongTimePattern = node.SelectSingleNode("@longTime").Value;
				if (node.SelectSingleNode("@firstWeekDay") != null)
					ci.DateTimeFormat.FirstDayOfWeek = (System.DayOfWeek)Int16.Parse(node.SelectSingleNode("@firstWeekDay").Value);
				if (node.SelectSingleNode("@decimalDigits") != null)
					ci.NumberFormat.NumberDecimalDigits = int.Parse(node.SelectSingleNode("@decimalDigits").Value);
				if (node.SelectSingleNode("@decimalSeparator") != null)
					ci.NumberFormat.NumberDecimalSeparator = node.SelectSingleNode("@decimalSeparator").Value;
				if (node.SelectSingleNode("@groupSeparator") != null)
					ci.NumberFormat.NumberGroupSeparator = node.SelectSingleNode("@groupSeparator").Value;
				if (node.SelectSingleNode("@zeroFormat") != null)
					ci.NumberZeroFormat = node.SelectSingleNode("@zeroFormat").Value;
				if (node.SelectSingleNode("@nullFormat") != null)
					ci.NumberNullFormat = node.SelectSingleNode("@nullFormat").Value;
			}
			return locales;
		}
	}
}
