<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Member Search</title>
    <meta charset="utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      body { font-family: Arial, sans-serif; margin:20px; }
      .filters { margin-bottom:12px; }
      .filters input, .filters select { margin-right:8px; }
      table { border-collapse: collapse; width:100%; margin-top:12px; }
      table, th, td { border: 1px solid #ddd; }
      th, td { padding:8px; text-align:left; }
      .pager { margin-top: 10px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="filters">
            Policy Number: <input type="text" id="txtPolicy" />
            State: <input type="text" id="txtState" placeholder="e.g. LA" />
            Line of Business: <input type="text" id="txtLOB" placeholder="e.g. EI" />
            Page Size:
            <select id="selPageSize"><option>10</option><option>25</option><option>50</option></select>
            <button type="button" id="btnSearch">Search</button>
        </div>

        <table id="resultsTable">
            <thead>
                <tr>
                    <th>SubscriberId</th>
                    <th>EnterpriseId</th>
                    <th>CustomerNumber</th>
                    <th>PlanCoverageIdentifier</th>
                    <th>EffectiveDate</th>
                    <th>TerminationDate</th>
                    <th>Town</th>
                    <th>State</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="pager">
            <button type="button" id="prevBtn" disabled>Prev</button>
            <span id="pageInfo">Page 1</span>
            <button type="button" id="nextBtn" disabled>Next</button>
        </div>
    </form>

<script>
    var currentPage = 1;

    $(function () {
        $('#btnSearch').click(function () {
            currentPage = 1;
            fetchPage(currentPage);
        });

        $('#prevBtn').click(function () {
            if (currentPage > 1) {
                currentPage--;
                fetchPage(currentPage);
            }
        });

        $('#nextBtn').click(function () {
            currentPage++;
            fetchPage(currentPage);
        });

        // optional: initial load (if you want)
        // fetchPage(1);
    });

    function fetchPage(page) {
        var payload = {
            policyNumber: $('#txtPolicy').val() || null,
            stateIssueCode: $('#txtState').val() || null,
            lineOfBusiness: $('#txtLOB').val() || null,
            page: page,
            pageSize: parseInt($('#selPageSize').val(), 10)
        };

        $('#pageInfo').text('Loading...');

        $.ajax({
            type: 'POST',
            url: 'Search.aspx/SearchMembers',
            data: JSON.stringify(payload),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (res) {
                var result = res.d;
                if (!result) {
                    alert('No response from server.');
                    return;
                }
                if (!result.success) {
                    alert('API error: ' + (result.error || 'unknown'));
                    $('#pageInfo').text('Error');
                    $('#prevBtn, #nextBtn').prop('disabled', true);
                    return;
                }
                renderTable(result.data || []);
                $('#pageInfo').text('Page ' + page);
                $('#prevBtn').prop('disabled', page <= 1);
                // If we got less than pageSize rows, there's no next page
                $('#nextBtn').prop('disabled', (result.data || []).length < payload.pageSize);
            },
            error: function (err) {
                alert('Request error: ' + err.statusText);
                $('#pageInfo').text('Error');
            }
        });
    }

    function renderTable(rows) {
        var $tbody = $('#resultsTable tbody');
        $tbody.empty();
        if (!rows || rows.length === 0) {
            $tbody.append('<tr><td colspan="8">No records found.</td></tr>');
            return;
        }
        rows.forEach(function (r) {
            var tr = '<tr>'
                + '<td>' + (r.SubscriberId || '') + '</td>'
                + '<td>' + (r.EnterpriseId || '') + '</td>'
                + '<td>' + (r.CustomerNumber || '') + '</td>'
                + '<td>' + (r.PlanCoverageIdentifier || '') + '</td>'
                + '<td>' + (r.EffectiveDate || '') + '</td>'
                + '<td>' + (r.TerminationDate || '') + '</td>'
                + '<td>' + (r.Town || '') + '</td>'
                + '<td>' + (r.State || '') + '</td>'
                + '</tr>';
            $tbody.append(tr);
        });
    }
</script>
</body>
</html>
