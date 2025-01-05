<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RPT_ACC_GNTransactionPatientReceipt.aspx.cs" Inherits="AdminPanel_Account_ACC_GNTransaction_RPT_ACC_GNTransactionPatientReceipt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <rsweb:ReportViewer ID="rvpatientreceipt" runat="server" Width="100%" Height="100%" Visible="false">
                <LocalReport ReportPath="AdminPanel\Report\Transaction\RPT_Transaction.rdlc"></LocalReport>
            </rsweb:ReportViewer>

        </div>
    </form>
</body>
</html>
