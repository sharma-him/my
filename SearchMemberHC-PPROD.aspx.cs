using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) { }

    // Update this URL if your API endpoint is different
    private const string API_URL = "https://userlingo.int.userlingo.optum.com/rest/v2/hcp/read/prod";

    [WebMethod]
    public static object SearchMembers(string policyNumber, string stateIssueCode, string lineOfBusiness, int page, int pageSize)
    {
        try
        {
            var payload = new
            {
                schema = "prodHcpIndividualQuery",
                searchId = (string)null,
                policyNumber = string.IsNullOrWhiteSpace(policyNumber) ? null : policyNumber,
                effectiveDate = "2024-01-01",
                terminationDate = "9999-12-31",
                fundingTypeCode = "F",
                insuranceType = "C",
                stateIssueCode = stateIssueCode,
                situsState = stateIssueCode,
                lineOfBusiness = lineOfBusiness,
                medicareIndicator = (string)null,
                page = page,
                pageSize = pageSize
            };

            using (var client = new HttpClient())
            {
                // ==== IMPORTANT: update these headers to the values you use in Postman/production ====
                client.DefaultRequestHeaders.Add("x-ask-id", "UHGWM110-017123");
                client.DefaultRequestHeaders.Add("x-organization", "Optum");
                client.DefaultRequestHeaders.Add("x-userlingo-team", "DataKart");
                client.DefaultRequestHeaders.Add("x-userlingo-user", "tapan_k_saha@optum.com");
                // =======================================================================================

                var content = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");
                var resp = client.PostAsync(API_URL, content).GetAwaiter().GetResult();
                var respString = resp.Content.ReadAsStringAsync().GetAwaiter().GetResult();

                if (!resp.IsSuccessStatusCode)
                {
                    return new { success = false, error = respString };
                }

                var j = JObject.Parse(respString);
                var rows = new List<object>();

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
                                string planCoverage = (string)(m["customerAccount"]?["planCoverageIdentifier"] ?? "") ;
                                if (string.IsNullOrEmpty(planCoverage))
                                    planCoverage = (string)(m["customerAccount"]?["customerAccountIdentifier"] ?? "");

                                string eff = (string)(m["effectiveDate"] ?? "");
                                string term = (string)(m["terminationDate"] ?? "");

                                rows.Add(new
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
                        else
                        {
                            // If no memberships, still show the identification info
                            rows.Add(new
                            {
                                SubscriberId = subscriberId,
                                EnterpriseId = enterpriseId,
                                CustomerNumber = customerNumber,
                                PlanCoverageIdentifier = "",
                                EffectiveDate = "",
                                TerminationDate = "",
                                Town = town,
                                State = state
                            });
                        }
                    }
                }

                return new { success = true, data = rows };
            }
        }
        catch (Exception ex)
        {
            return new { success = false, error = ex.Message };
        }
    }
}
