using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Web.UI.WebControls;

namespace DaasPortal.DKPlus
{
    public partial class ProductionMemberSearch : System.Web.UI.Page
    {
        private const string API_URL = "https://userlingo.int.userlingo.optum.com/rest/v2/hcp/read/prod";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlPageSize.SelectedValue = "10";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            grdMemberSearch.PageIndex = 0; // reset to first page
            BindGrid();
        }

        protected void grdMemberSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMemberSearch.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        private void BindGrid()
        {
            int pageIndex = grdMemberSearch.PageIndex + 1; // GridView PageIndex is 0-based
            int pageSize = int.Parse(ddlPageSize.SelectedValue);

            var payload = new
            {
                schema = "prodHcpIndividualQuery",
                searchId = (string)null,
                policyNumber = string.IsNullOrWhiteSpace(txtPolicyNumber.Text) ? null : txtPolicyNumber.Text,
                effectiveDate = "2024-01-01",
                terminationDate = "9999-12-31",
                fundingTypeCode = "F",
                insuranceType = "C",
                stateIssueCode = string.IsNullOrWhiteSpace(txtState.Text) ? null : txtState.Text,
                situsState = string.IsNullOrWhiteSpace(txtState.Text) ? null : txtState.Text,
                lineOfBusiness = string.IsNullOrWhiteSpace(txtLob.Text) ? null : txtLob.Text,
                medicareIndicator = (string)null,
                page = pageIndex,
                pageSize = pageSize
            };

            try
            {
                var rows = FetchFromApi(payload);
                grdMemberSearch.DataSource = rows;
                grdMemberSearch.DataBind();
                pnlResults.Visible = true;
            }
            catch (Exception ex)
            {
                // You can replace this with your logging mechanism
                grdMemberSearch.DataSource = null;
                grdMemberSearch.DataBind();
                pnlResults.Visible = false;
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        private List<MemberRow> FetchFromApi(object payload)
        {
            using (var client = new HttpClient())
            {
                // Replace with your real headers
                client.DefaultRequestHeaders.Add("x-ask-id", "UHGWM110-017123");
                client.DefaultRequestHeaders.Add("x-organization", "Optum");
                client.DefaultRequestHeaders.Add("x-userlingo-team", "DataKart");
                client.DefaultRequestHeaders.Add("x-userlingo-user", "tapan_k_saha@optum.com");

                var content = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");
                var resp = client.PostAsync(API_URL, content).Result;
                var respString = resp.Content.ReadAsStringAsync().Result;

                if (!resp.IsSuccessStatusCode)
                    throw new ApplicationException(respString);

                var j = JObject.Parse(respString);
                var rows = new List<MemberRow>();

                var eligibilities = j["data"]?["eligibilities"] as JArray;
                if (eligibilities != null)
                {
                    foreach (var elig in eligibilities)
                    {
                        var sourceInd = elig["sourceIndividual"];
                        var alt = sourceInd?["alternateIdentifiers"];
                        var subs = alt?["subscriberIds"] as JArray;
                        string subscriberId = (subs != null && subs.Count > 0) ? (string)subs[0]["identifier"] : "";
                        string enterpriseId = (string)(alt?["enterpriseIndividualIdentifier"] ?? "");
                        string customerNumber = (string)(sourceInd?["legacyAttributes"]?["customerNumber"] ?? "");

                        string town = "";
                        string state = "";
                        var addresses = sourceInd?["postalAddresses"] as JArray;
                        if (addresses != null && addresses.Count > 0)
                        {
                            town = (string)(addresses[0]?["townName"] ?? "");
                            state = (string)(addresses[0]?["stateProvinceCode"] ?? "");
                        }

                        var memberships = elig["memberships"] as JArray;
                        if (memberships != null && memberships.Count > 0)
                        {
                            foreach (var m in memberships)
                            {
                                string planCoverage = (string)(m["customerAccount"]?["planCoverageIdentifier"] ?? "");
                                if (string.IsNullOrEmpty(planCoverage))
                                    planCoverage = (string)(m["customerAccount"]?["customerAccountIdentifier"] ?? "");

                                string eff = (string)(m["effectiveDate"] ?? "");
                                string term = (string)(m["terminationDate"] ?? "");

                                rows.Add(new MemberRow
                                {
                                    SubscriberId = subscriberId,
                                    EnterpriseId = enterpriseId,
                                    CustomerNumber = customerNumber,
                                    PlanCoverageIdentifier = planCoverage,
                                    EffectiveDate = eff,
                                    TerminationDate = term,
                                    Town = town,
                                    State = state
                                });
                            }
                        }
                    }
                }

                return rows;
            }
        }

        private class MemberRow
        {
            public string SubscriberId { get; set; }
            public string EnterpriseId { get; set; }
            public string CustomerNumber { get; set; }
            public string PlanCoverageIdentifier { get; set; }
            public string EffectiveDate { get; set; }
            public string TerminationDate { get; set; }
            public string Town { get; set; }
            public string State { get; set; }
        }
    }
}
