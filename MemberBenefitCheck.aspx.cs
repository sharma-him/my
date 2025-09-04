using DaaS_Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DaasPortal.Logger;
using Excel;
using System.Linq;

namespace DaasPortal.DKPlus
{
    public partial class MemberBenefitCheck : System.Web.UI.Page
    {
        private ILog _log;
        List<int> reqIDList = new List<int>();
        public MemberBenefitCheck()
        {
            _log = Log.GetInstance;
        }
        static List<MData> objMetadata;
        static List<MData> objStandardData;
        string IsClone = "";
        int send_req_count = 0;
        int get_req_count = 0;
        Boolean headerCreated = false;
        DataTable dt = new DataTable();
        List<EnvironmentDetails> lstEnviournment = new List<EnvironmentDetails>();
        static List<clsMEMBER_BENEFIT_CHECK_DATA_REQUEST_RESULT> objSummarizMemberInfoData;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ntid"] == null)
            {
                string message = "CheckSession_data();";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Success", message, true);
                return;
            }
            if (!IsPostBack)
            {
                FillEnviornmentData();


                txt_request_result_count.Value = Convert.ToString(ConfigurationManager.AppSettings["request_result_count"]);
                if (Request.QueryString["IsClone"] != null)
                {

                    _log.LogMessage("IsCLone Condition started");
                    IsClone = Common.Decrypt(Request.QueryString["IsClone"].ToString());
                    if (IsClone == "Yes")
                    {
                        string id = Session["ReqId"].ToString();
                        string EnvId = Session["EnvId"].ToString();
                        GetDataByMemberRequestId(Convert.ToInt32(id));
                        Session["ReqId"] = 0;
                    }
                    _log.LogMessage("IsCLone Condition completed");
                }
            }
            appid.Value = ConfigurationManager.AppSettings["Member_Benefit_Check"].ToString();

        }
        protected void btn_save_criteria_Click(object sender, EventArgs e)
        {

            if (Session["ntid"] == null)
            {
                string message = "CheckSession_data();";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Success", message, true);
                return;


            }
            _log.LogMessage("Search Button click event Started for " + "  Member Benefit Application user " + Session["ntid"].ToString() + " at " + DateTime.Now.ToString());
            SaveSearchData();


        }
        public void SaveSearchData()
        {

            string ntid = Session["ntid"].ToString();
            MemberBenefitCheckDataRequestInfo objMemberSearchRequestInfo = new MemberBenefitCheckDataRequestInfo();
            List<clsMemberBenefitCheckDataDetails> lstMemberSearchDataObj = new List<clsMemberBenefitCheckDataDetails>();
            int noOfRecordsToFetch;

            Metrics transmetrics = new Metrics();
            transmetrics.MSID = ntid;
            transmetrics.Environment = ddl_Environment.Value;
            string path = HttpContext.Current.Request.Url.AbsolutePath;
            transmetrics.Page = path.Substring(8);
            transmetrics.Trans = txt_request_result_count.Value;
            DKMetrics(transmetrics);

            objMemberSearchRequestInfo.PROVISIONING_APP_ID = ConfigurationManager.AppSettings["Member_Benefit_Check"].ToString();
            objMemberSearchRequestInfo.REQUESTOR_MSID = Convert.ToString(Session["ntid"]);
            objMemberSearchRequestInfo.ENVIRONMENT_ID = Convert.ToString(ddl_Environment.Value);
            objMemberSearchRequestInfo.CREATED_BY_MSID = Session["ntid"].ToString();
            objMemberSearchRequestInfo.CREATED_DATETIME = DateTime.Now;
            objMemberSearchRequestInfo.DATA_REQUEST_COMPLETION_DATE = null;
            objMemberSearchRequestInfo.DATA_REQUEST_STATUS = "Processing";
            objMemberSearchRequestInfo.DATA_REQUIRED_BY_DATE = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"));
            clsMemberBenefitCheckDataDetails objMemberSearchData = new clsMemberBenefitCheckDataDetails();


            if (txtPolicyNumber.Text.ToString() != "")
            {
                objMemberSearchData.POLICY_NUMBER = txtPolicyNumber.Text;
            }
            if (txt_subscriber_id.Text.ToString() != "")
            {
                objMemberSearchData.SUBSCRIBER_ID = txt_subscriber_id.Text;
            }
            if (ddlLob.SelectedValue != "-1")
            {
                objMemberSearchData.LOB = ddlLob.SelectedValue;
            }


            objMemberSearchData.REQUEST_RESULT_COUNT = Convert.ToString(txt_request_result_count.Value);


            lstMemberSearchDataObj.Add(objMemberSearchData);
            objMemberSearchRequestInfo.MEMBER_BENEFIT_CHECK_DATA = lstMemberSearchDataObj;

            try
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, object> strObject = new System.Collections.Generic.Dictionary<string, object>();
                strObject.Add("MemberDataRequestInfo", objMemberSearchRequestInfo);
                object data = strObject;
                object returnObj = WCFServiceCallPage.processCall("DKPLUS", "InsertMemberBenefitCheckDataDetails", data);
                object val = serializer.Deserialize(returnObj.ToString(), typeof(string));

                string[] result = val.ToString().Split(',');
                if (val != null && val.ToString() != "-1")
                {
                    bind_MemberBenefit_request_result(result[0].ToString());
                }

                //txt_subscriber_id.Text = string.Empty;
                //txtPolicyNumber.Text = string.Empty;

            }
            catch (Exception ex)
            {
                _log.LogException("Exception occured while fetching Member data ", ex);
                string filePath = @"C:\Error_Logs\Error.txt";

                // Exception ex = ...

                using (StreamWriter writer = new StreamWriter(filePath, true))
                {
                    writer.WriteLine("-----------------------------------------------------------------------------");
                    writer.WriteLine("Date : " + DateTime.Now.ToString());
                    writer.WriteLine();

                    while (ex != null)
                    {
                        writer.WriteLine(ex.GetType().FullName);
                        writer.WriteLine("Potal:Message : " + ex.Message);
                        writer.WriteLine("StackTrace : " + ex.StackTrace);


                        ex = ex.InnerException;
                    }
                }

            }

        }
        public void FillEnviornmentData()
        {
            try
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, object> strValues = new System.Collections.Generic.Dictionary<string, object>();
                strValues.Add("appid", ConfigurationManager.AppSettings["Member_Benefit_Check"].ToString());
                object data = strValues;
                object returnObj = WCFServiceCallPage.processCall("DKPLUS", "GetEnvironmentName", data);
                object val = serializer.Deserialize(returnObj.ToString(), typeof(List<EnvironmentDetails>));



                if (val != null)
                {
                    lstEnviournment = (List<EnvironmentDetails>)val;

                    System.Data.DataTable dt = new System.Data.DataTable();
                    dt.Columns.AddRange(new DataColumn[2] {
                        new DataColumn("ID", typeof(string)),
                        new DataColumn("NAME", typeof(string)),

                });

                    foreach (EnvironmentDetails info in lstEnviournment)
                    {
                        dt.Rows.Add(info.ID, info.NAME);
                    }

                    dt.DefaultView.Sort = "NAME ASC";
                    ddl_Environment.DataSource = dt;


                    ddl_Environment.DataValueField = "ID";
                    ddl_Environment.DataTextField = "NAME";
                    ddl_Environment.DataBind();
                    ddl_Environment.Items.Insert(0, new ListItem("-Select-", "0"));
                    if (ddl_Environment.Items.Count > 0)
                    {
                        ddl_Environment.SelectedIndex = 1;
                    }
                }
            }
            catch (Exception ex)
            {

            }

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string DKMetrics(Metrics metrics)
        {
            if (HttpContext.Current.Session["ntid"] != null)
            {
                if (metrics.Trans != null)
                {
                    LogMetrics.DKPlusMetrics(metrics);
                }
                else
                {
                    metrics.MSID = HttpContext.Current.Session["ntid"].ToString();
                    metrics.Type = "Page";
                    metrics.Environment = "NULL";
                    LogMetrics.DKPlusMetrics(metrics);
                }
            }
            else
            {
                HttpContext.Current.Response.Redirect(ConfigurationManager.AppSettings["site_url"].ToString());
            }
            return "Message: Success as a log hit";
        }
        private void bind_MemberBenefit_request_result(string memberDataRequestId, string tag = "")
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = 2147483645;
            Dictionary<string, object> strObject = new System.Collections.Generic.Dictionary<string, object>();
            Boolean bulk = false;
            if (tag == "BULK")
                bulk = true;
            strObject.Add("memberDataRequestId", memberDataRequestId);
            strObject.Add("bulk", bulk);
            object data = strObject;
            object returnObj = WCFServiceCallPage.processCall("DKPLUS", "Get_Member_Benefit_Request_Result", data);
            object val = serializer.Deserialize(returnObj.ToString(), typeof(List<clsMEMBER_BENEFIT_CHECK_DATA_REQUEST_RESULT>));

            objSummarizMemberInfoData = new List<clsMEMBER_BENEFIT_CHECK_DATA_REQUEST_RESULT>();
            objSummarizMemberInfoData = (List<clsMEMBER_BENEFIT_CHECK_DATA_REQUEST_RESULT>)val;

            dt.Columns.AddRange(new DataColumn[] {
                    new DataColumn("SUBSCRIBER_ID", typeof(string)),
                    new DataColumn("POLICY_NUMBER", typeof(string)),
                    new DataColumn("LOB", typeof(string)),
                    new DataColumn("BENEFIT_CHECK_RESP_STATUS", typeof(string))
                   

                });

            foreach (clsMEMBER_BENEFIT_CHECK_DATA_REQUEST_RESULT info in objSummarizMemberInfoData)
            {
                dt.Rows.Add(
                          info.SUBSCRIBER_ID,
                          info.POLICY_NUMBER,
                          info.LOB,
                          info.BENEFIT_CHECK_RESP_STATUS

                        );
            }
            if (val != null)
            {
                grd_MemberSearch.DataSource = dt;
                grd_MemberSearch.DataBind();
                ViewState["grd_MemberSearch"] = dt;
                divMemberSearch.Visible = true;

            }
        }
        public void GetDataByMemberRequestId(int MemberDataRequestId)
        {
            try
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, object> strValues = new System.Collections.Generic.Dictionary<string, object>();
                strValues.Add("MemberDataRequestId", MemberDataRequestId);
                object data = strValues;

                object returnObj = WCFServiceCallPage.processCall("DKPLUS", "GetDataByMemberBenefitRequestId", data);
                object val = serializer.Deserialize(returnObj.ToString(), typeof(clsMemberLocatorSearchDataDetails));
                PopulateData((clsMemberBenefitCheckDataDetails)val);
            }
            catch (Exception ex)
            {

            }
        }
        public void PopulateData(clsMemberBenefitCheckDataDetails cloneInfo)
        {
            appid_gps.Value = ConfigurationManager.AppSettings["Member_Benefit_Check"].ToString();

            if (cloneInfo.REQUEST_RESULT_COUNT != null)
                txt_request_result_count.Value = Convert.ToString(cloneInfo.REQUEST_RESULT_COUNT);

            if (cloneInfo.ENVIRONMENT_ID != null)
                ddl_Environment.Value = cloneInfo.ENVIRONMENT_ID;

            if (cloneInfo.POLICY_NUMBER != null)
                txtPolicyNumber.Text = cloneInfo.POLICY_NUMBER;

            if (cloneInfo.SUBSCRIBER_ID != null)
                txt_subscriber_id.Text = cloneInfo.SUBSCRIBER_ID.ToString();

            if (cloneInfo.LOB != null)
                ddlLob.SelectedValue = cloneInfo.LOB.ToString();

        }
        #region bulk upload
        protected void btnBulk_Search_Click(object sender, EventArgs e)
        {
            string uniqeFileName;
            DataTable dtFromStream;
            DataTable dtNew = new DataTable();
            DataTable dtWithOutBlankRows;

            uniqeFileName = GetUniqueFilename(bulk_search_file.FileName);
            string filepath = bulk_search_file.PostedFile.FileName;
            ViewState["bulk_search_file"] = bulk_search_file.PostedFile.FileName;

            bulk_search_file.PostedFile.SaveAs(Server.MapPath("~/BulkSearchUploadFiles/" + uniqeFileName));
            FileStream stream = File.Open(Server.MapPath("~/BulkSearchUploadFiles/" + uniqeFileName), FileMode.Open, FileAccess.Read);

            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            DataSet result = excelReader.AsDataSet();
            excelReader.Close();

            #region Member Data Sheet
            dtFromStream = result.Tables[0];

            for (int i = 0; i < dtFromStream.Columns.Count; i++)
                dtNew.Columns.Add(dtFromStream.Rows[0][i].ToString());

            int skipFirstRow = 0;
            foreach (DataRow dr in dtFromStream.Rows)
            {
                if (skipFirstRow == 0)
                {
                    skipFirstRow++;
                    continue;
                }
                dtNew.Rows.Add(dr.ItemArray);
            }
            dtWithOutBlankRows = RemoveBlankRowsFromDT(dtNew);
            #endregion

            get_SearchData_FromExcel(dtWithOutBlankRows);

        }
        private void get_SearchData_FromExcel(DataTable dt_member)
        {

            JavaScriptSerializer serializer;
            try
            {
                if (dt_member.Rows.Count > 0)
                {
                    var sheet_status_result = from DataRow dtrow in dt_member.Rows
                                              where (string)dtrow["Sheet Status"] == "Failed"
                                              select dtrow;
                    if (sheet_status_result == null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Failed", "alert('Please Validate your sheet and the sheet status should be pass.');", true);
                    }
                    else if (sheet_status_result.Count() == 0)
                    {
                        foreach (DataRow row in dt_member.Rows)
                        {

                            MemberBenefitCheckDataRequestInfo objMemberSearchRequestInfo = new MemberBenefitCheckDataRequestInfo();
                            List<clsMemberBenefitCheckDataDetails> lstMemberSearchDataObj = new List<clsMemberBenefitCheckDataDetails>();

                            objMemberSearchRequestInfo.PROVISIONING_APP_ID = ConfigurationManager.AppSettings["Member_Benefit_Check"].ToString();
                            objMemberSearchRequestInfo.ENVIRONMENT_ID = "2166"; 

                            objMemberSearchRequestInfo.REQUESTOR_MSID = Convert.ToString(Session["ntid"]);
                            objMemberSearchRequestInfo.CREATED_BY_MSID = Convert.ToString(Session["ntid"]);
                            objMemberSearchRequestInfo.CREATED_DATETIME = DateTime.Now;
                            objMemberSearchRequestInfo.DATA_REQUEST_COMPLETION_DATE = DateTime.Now;
                            objMemberSearchRequestInfo.DATA_REQUEST_STATUS = "Processing";
                            objMemberSearchRequestInfo.DATA_REQUIRED_BY_DATE = DateTime.Now;

                            clsMemberBenefitCheckDataDetails objMemberSearchData = new clsMemberBenefitCheckDataDetails();


                            if (row["Subscriber ID"].ToString() != "")
                                objMemberSearchData.SUBSCRIBER_ID = row["Subscriber ID"].ToString();

                            if (row["Policy Number"].ToString() != "")
                                objMemberSearchData.POLICY_NUMBER = row["Policy Number"].ToString();

                            if (row["LOB"].ToString() != "")
                            {
                                ddlLob.SelectedIndex = ddlLob.Items.IndexOf(ddlLob.Items.FindByText(row["LOB"].ToString()));
                                objMemberSearchData.LOB = Convert.ToString(ddlLob.SelectedValue);
                            }

                            objMemberSearchData.REQUEST_RESULT_COUNT = "10";

                            lstMemberSearchDataObj.Add(objMemberSearchData);

                            objMemberSearchRequestInfo.MEMBER_BENEFIT_CHECK_DATA = lstMemberSearchDataObj;
                            serializer = new JavaScriptSerializer();
                            Dictionary<string, object> strObject = new System.Collections.Generic.Dictionary<string, object>();
                            strObject.Add("MemberDataRequestInfo", objMemberSearchRequestInfo);
                            object data = strObject;
                            object returnObj = WCFServiceCallPage.processCall("DKPLUS", "InsertMemberBenefitCheckDataDetails", data);
                            object val = serializer.Deserialize(returnObj.ToString(), typeof(string));
                            string[] result = val.ToString().Split(',');

                            reqIDList.Add(Convert.ToInt32(result[0].ToString()));
                        }
                        serializer = new JavaScriptSerializer();
                        if (reqIDList.Count() > 0)
                        {
                            JavaScriptSerializer idSerializer = new JavaScriptSerializer();
                            Dictionary<string, object> reqIDObject = new Dictionary<string, object>();
                            reqIDObject.Add("reqIDList", reqIDList);
                            object IDdata = reqIDObject;
                            object returnRes = WCFServiceCallPage.processCall("DKPLUS", "updateMemberBenefitCheckBulkUploadID", IDdata);
                            object bulkUploadIDObj = idSerializer.Deserialize(returnRes.ToString(), typeof(int));


                            bind_MemberBenefit_request_result(bulkUploadIDObj.ToString(), "BULK");

                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Failed", "alert('Please Validate your sheet and the sheet status should be pass.');", true);
                    }
                }
            }

            catch (Exception ex)
            {
                _log.LogException("Exception occured in btn_demographic_add_Click event ", ex);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Successful", "alert('Server is busy, Please try after some time or Create a search with different parameter .');window.location.href=window.location;", true);
                Common.SaveHitCounter("MEMBER BENEFIT CHECK", false);
            }

        }
        public string GetUniqueFilename(string filename)
        {
            string basename = Path.Combine(Path.GetDirectoryName(filename),
                                           Path.GetFileNameWithoutExtension(filename));
            string uniquefilename = string.Format("{0}{1}{2}",
                                                    basename,
                                                    DateTime.Now.Ticks,
                                                    Path.GetExtension(filename));
            // Thread.Sleep(1); // To really prevent collisions, but usually not needed
            return uniquefilename;
        }
        public DataTable RemoveBlankRowsFromDT(DataTable dt)
        {
            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                bool isEmptyRow = true;
                for (int j = dt.Columns.Count - 1; j >= 0; j--)
                {
                    if (dt.Rows[i][j] != DBNull.Value)
                    {
                        isEmptyRow = false;
                    }
                }
                if (isEmptyRow)
                {
                    dt.Rows[i].Delete();
                }
            }
            dt.AcceptChanges();
            return dt;
        }
        protected void grd_MemberSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_MemberSearch.PageIndex = e.NewPageIndex;
            grd_MemberSearch.DataSource = ViewState["grd_MemberSearch"];
            grd_MemberSearch.DataBind();
        }
        #endregion
    }
}