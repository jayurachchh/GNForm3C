<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPage.master" AutoEventWireup="true" CodeFile="RPT_HospitalWise_FinYearWise_IncomeExpense.aspx.cs" Inherits="AdminPanel_Account_ACC_Expense_ACC_HospitalWise_FinYearWise_IncomeExpense" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="rvIncomeExpense" runat="server" Width="100%" Height="700px" Visible="true" >
         <LocalReport ReportPath="AdminPanel\Report\Ledger\RPT_HospitalWise_FInYearWise_IncomeExpense.rdlc"></LocalReport>
    </rsweb:ReportViewer> 

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
</asp:Content>

