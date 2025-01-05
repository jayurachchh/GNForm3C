<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPage.master" AutoEventWireup="true" CodeFile="HospitalWiseIncome.aspx.cs" Inherits="AdminPanel_Account_ACC_Income_HospitalWiseIncome" %>

 
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" Runat="Server">

        <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>

    <rsweb:ReportViewer ID="rvhsIncome" runat="server" Width="100%" Height="700px" Visible="true">
         <LocalReport ReportPath="AdminPanel\Report\RPT_ACC_Income\Hospital_Income.rdlc"></LocalReport>

    </rsweb:ReportViewer> 

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" Runat="Server">
</asp:Content>

