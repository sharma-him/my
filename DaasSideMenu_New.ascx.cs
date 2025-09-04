using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DaasPortal.DKPlus
{
    public partial class DaasSideMenu_New : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void sideMenu_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;

            switch (lnk.ID)
            {
                case "ACIS":
                    //SaveCount
                    Common.SaveHitCounter("ACIS", null);
                    break;
                case "ACIS_CreateData":
                    Common.SaveHitCounter("ACIS Create Data", null);
                    break;
                case "ACIS_BRMS_UpdateData":
                    Common.SaveHitCounter("ACIS BRMS Update Data", null);
                    break;
                case "CDB":
                    Common.SaveHitCounter("CDB", null);
                    break;
                case "CDB_CreateMember":
                    Common.SaveHitCounter("Create CDB Member", null);
                    break;
                case "MYUHCRegistration":
                    Common.SaveHitCounter("myUHC", null);
                    break;
                case "lnkCAMS":
                    Common.SaveHitCounter("CAMS", null);
                    break;
                case "lnk_cams_fasa_mem_gen":
                    Common.SaveHitCounter("CAMS FSA Member Gen", null);
                    break;
                case "lnk_cams_member_feed_file":
                    Common.SaveHitCounter("CAMS Member Update", null);
                    break;
                case "CIRRUS":
                    Common.SaveHitCounter("CIRRUS", null);
                    break;
                case "COSMOS":
                    Common.SaveHitCounter("COSMOS", null);
                    break;
                case "COSMOS_LoadGPSMembers":
                    Common.SaveHitCounter("COSMOS", null);
                    break;
                case "CSP_FACETS":
                    Common.SaveHitCounter("FACETS", null);
                    break;
                case "DENTAL_FACETS":
                    Common.SaveHitCounter("Dental-Facets", null);
                    break;
                case "DentalFacets_ClaimsCreation":
                    Common.SaveHitCounter("Dental Facets Claim", null);
                    break;
                case "GPS":
                    Common.SaveHitCounter("GPS", null);
                    break;
                case "lnk_mnr_mem_reg":
                    Common.SaveHitCounter("MNR Registration", null);
                    break;
                case "ICUE":
                    Common.SaveHitCounter("ICUE", null);
                    break;
                case "IMDM":
                    Common.SaveHitCounter("IMDM", null);
                    break;
                case "IVR":
                    Common.SaveHitCounter("IVR", null);
                    break;
                case "C360":
                    Common.SaveHitCounter("C360", null);
                    break;
                case "NDB":
                    Common.SaveHitCounter("NDB", null);
                    break;
                case "NDB_MockData":
                    Common.SaveHitCounter("MOCK_NDB", null);
                    break;
                case "NICE":
                    Common.SaveHitCounter("NICE", null);
                    break;
                case "NICE_CreateData":
                    Common.SaveHitCounter("Create NICE Member", null);
                    break;
                case "PRIME":
                    Common.SaveHitCounter("PRIME", null);
                    break;
                case "PRIME_CreateData":
                    Common.SaveHitCounter("PRIME Create Data", null);
                    break;
                case "PRIME_Dashboard":
                    Common.SaveHitCounter("PRIME Dashboard", null);
                    break;
                case "TOPS":
                    Common.SaveHitCounter("TOPS", null);
                    break;
                case "TOPS_TestData":
                    Common.SaveHitCounter("TOPS", null);
                    break;
                case "TOPS_RealTimeData":
                    Common.SaveHitCounter("TOPS", null);
                    break;
                case "TOPS_CreateClaim":
                    Common.SaveHitCounter("TOPS", null);
                    break;
                case "VISION":
                    Common.SaveHitCounter("VISION", null);
                    break;
                case "OPTUM_Rx":
                    Common.SaveHitCounter("OptumRX", null);
                    break;
                case "OptumRxTDMP":
                    Common.SaveHitCounter("OptumRX", null);
                    break;
                case "E_HEALTH":
                    Common.SaveHitCounter("EHealth", null);
                    break;
                case "Doc360":
                    Common.SaveHitCounter("doc360", null);
                    break;
                case "Fiserv_ID_Cards":
                    Common.SaveHitCounter("Fiserv ID Cards", null);
                    break;
                case "Member_Locator":
                    Common.SaveHitCounter("Member Locator", null);
                    break;
                default:
                    break;
            }
            if (lnk.CommandName == "https://tdmp.optum.com/tdmp/tdmplanding.html")
            {
                string url = "https://tdmp.optum.com/tdmp/tdmplanding.html";

                Response.Write("<script type='text/javascript'>window.open('" + url + "');</script>");
            }
            else if (lnk.CommandName == "http://www.dataselfservice.optum.com/tdeg-dss/login")
            {
                string url = "http://www.dataselfservice.optum.com/tdeg-dss/login";

                Response.Write("<script type='text/javascript'>window.open('" + url + "');</script>");
            }
            else if (lnk.CommandName == "EDI")
            {                
                var url = ConfigurationManager.AppSettings["LinkToEDI"];
                url = url + HttpContext.Current.Session["ntid"].ToString();

                Response.Write("<script type='text/javascript'>window.open('" + url + "');</script>");
            }
            else
            {
                Response.Redirect(lnk.CommandName);
            }

        }

        protected void document_img_Click(object sender, ImageClickEventArgs e)
        {
            string filepath= string.Empty;
            ImageButton btn = (ImageButton)sender;
            try
            {
                switch (btn.ID)
                {
                    case "ACIS_DOC":
                        filepath = "../DKPlus/Manuals/ACIS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=ACIS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "CDB_DOC":
                        filepath = "../DKPlus/Manuals/CDB_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=CDB_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "DENTAL_FACETS_DOC":
                        filepath = "../DKPlus/Manuals/Dental_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=Dental_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "PRIME_DOC":
                        filepath = "../DKPlus/Manuals/Prime_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=Prime_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "VISION_DOC":
                        filepath = "../DKPlus/Manuals/Vision_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=Vision_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                   case "CAMS_DOC":
                        filepath = "../DKPlus/Manuals/CAMS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=CAMS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "ICUE_DOC":
                        filepath = "../DKPlus/Manuals/ICUE_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=ICUE_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "IVR_DOC":
                        filepath = "../DKPlus/Manuals/IVR_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=IVR_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "CIRRUS_DOC":
                        filepath = "../DKPlus/Manuals/CIRRUS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=CIRRUS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "C360_DOC":
                        filepath = "../DKPlus/Manuals/C360_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=C360_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "NDB_DOC":
                        filepath = "../DKPlus/Manuals/NDB_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=NDB_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "EHealth_DOC":
                        filepath = "../DKPlus/Manuals/EHealth_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=EHealth_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "CSP_FACETS_DOC":
                        filepath = "../DKPlus/Manuals/CSP_FACETS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=CSP_FACETS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "OPTRX_DOC":
                        filepath = "../DKPlus/Manuals/ORX_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=ORX_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "TOPS_DOC":
                        filepath = "../DKPlus/Manuals/TOPS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=TOPS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;

                    case "NICE_DOC":
                        filepath = "../DKPlus/Manuals/NICE_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=NICE_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;

                    case "GPS_DOC":
                        filepath = "../DKPlus/Manuals/GPS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=GPS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "COSMOS_DOC":
                        filepath = "../DKPlus/Manuals/COSMOS_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=COSMOS_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "IMDM_DOC":
                        filepath = "../DKPlus/Manuals/IMDM_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=IMDM_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;
                    case "Fiserv_DOC":
                        filepath = "../DKPlus/Manuals/Fiserv_User_Manual.docx";
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename=Fiserv_User_Manual.docx");
                        Response.ContentType = "application/octet-stream";
                        Response.TransmitFile(Server.MapPath(filepath));
                        Response.Flush();
                        Response.End();
                        break;


                    default:
                        break;
                }
            }
            catch
            {
                
            }
            
        }
    }
}