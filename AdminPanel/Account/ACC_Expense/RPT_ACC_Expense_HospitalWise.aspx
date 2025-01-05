<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPage.master" AutoEventWireup="true" CodeFile="RPT_ACC_Expense_HospitalWise.aspx.cs" Inherits="AdminPanel_Account_ACC_Expense_RPT_ACC_Expense_HospitalWise" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" runat="Server">
    <asp:Label ID="lblPageHeader_XXXXX" runat="server" Text="Expense List"></asp:Label>
    <small>
        <asp:Label ID="lblPageHeaderInfo_XXXXX" runat="server" Text="Report"></asp:Label></small>
    <span class="pull-right">
        <small>
            <asp:HyperLink ID="hlShowHelp" SkinID="hlShowHelp" runat="server"></asp:HyperLink>
        </small>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
    <li>
        <i class="fa fa-home"></i>
        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/AdminPanel/Default.aspx" Text="Home"></asp:HyperLink>
        <i class="fa fa-angle-right"></i>
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>

    <%-- Search --%>
    <asp:UpdatePanel ID="upApplicationFeature" runat="server">
        <ContentTemplate>
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        <asp:Label SkinID="lblSearchHeaderIcon" runat="server"></asp:Label>
                        <asp:Label ID="lblSearchHeader" SkinID="lblSearchHeaderText" runat="server"></asp:Label>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse pull-right"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div role="form">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                            <asp:TextBox ID="dtpFromDate" CssClass="form-control" runat="server" placeholder="From Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                            <asp:TextBox ID="dtpToDate" CssClass="form-control" runat="server" placeholder="To Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-9">
                                <asp:Button ID="btnSearch" SkinID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                <asp:Button ID="btnClear" runat="server" SkinID="btnClear" Text="Clear" OnClick="btnClear_Click" />
                                <asp:LinkButton ID="lbtnExportPDF" runat="server" SkinID="lbtnPDF" CommandArgument="PDF" OnClick="lbtnExport_Click" />
                                <asp:LinkButton ID="lbtnExportExcel" SkinID="lbtnExcel" runat="server" CommandArgument="Excel" OnClick="lbtnExport_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
       
        </ContentTemplate>
    </asp:UpdatePanel>
    <%-- End Search --%>

    <%--    <rsweb:ReportViewer ID="rvExpenseReport" runat="server" Width="100%" Height="100%">
        <LocalReport ReportPath="AdminPanel\Report\RPT_ACC_Expense\RPT_HospitalWise_ExpenseList.rdlc"></LocalReport>
    </rsweb:ReportViewer>--%>

    <%-- List --%>
    <asp:UpdatePanel ID="upList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <ucMessage:ShowMessage ID="ucMessage" runat="server" ViewStateMode="Disabled" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <asp:Label SkinID="lblSearchResultHeaderIcon" runat="server"></asp:Label>
                                <asp:Label ID="lblSearchResultHeader" SkinID="lblSearchResultHeaderText" runat="server"></asp:Label>
                                <label class="control-label">&nbsp;</label>
                                <label class="control-label pull-right">
                                    <asp:Label ID="lblRecordInfoTop" Text="No entries found" CssClass="pull-right" runat="server"></asp:Label>
                                </label>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row" runat="server" id="Div_SearchResult" visible="false">
                                <div class="col-md-12">

                                    <table class="table table-bordered table-striped table-hover">

                                        <asp:Repeater ID="rpData" runat="server" OnItemDataBound="rptGroupedExpenses_ItemDataBound">
                                            <ItemTemplate>
                                                <thead>
                                                    <tr>
<th class="TRDark" style="border: none !important; border-top: none !important;">
    <strong><%# Eval("ExpenseDate", GNForm3C.CV.DefaultDateFormatForGrid) %> </strong>
</th>

                                                    </tr>

                                                    <tr class="table-header TRDark">
                                                        <th>Fin Year</th>
                                                        <th>Expense Type</th>
                                                        <th class="text-right">Amount</th>
                                                        <th>Tag Name</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="rptExpenses" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("FinYearName") %></td>
                                                                <td>
                                                                    <asp:HyperLink ID="hlViewExpenseID" NavigateUrl='<%# "~/AdminPanel/Account/ACC_Expense/ACC_ExpenseView.aspx?ExpenseID=" + GNForm3C.CommonFunctions.EncryptBase64(Eval("ExpenseID").ToString()) %>' data-target="#viewiFrameReg" CssClass="modalButton" data-toggle="modal" runat="server"><%#Eval("ExpenseType") %></asp:HyperLink>
                                                                </td>
                                                                <td class="text-right"><%# Eval("Amount", GNForm3C.CV.DefaultCurrencyFormat) %></td>
                                                                <td><%# Eval("TagName") %></td>
                                                            </tr>

                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <tr>
                                                        <td></td>
                                                        <th class="text-right">
                                                            <asp:Label ID="lbhTotalAmount" runat="server" Text="Total Amount"></asp:Label>
                                                        </th>
                                                        <th class="text-right">
                                                            <asp:Label ID="lblTotalAmount" runat="server" Text="0.00"></asp:Label>
                                                        </th>
                                                        <td></td>

                                                    </tr>
                                                </tbody>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnClear" EventName="Click" />
            <asp:PostBackTrigger ControlID="lbtnExportExcel" />
            <asp:PostBackTrigger ControlID="lbtnExportPDF" />
        </Triggers>
    </asp:UpdatePanel>
    <%-- END List --%>


    <rsweb:ReportViewer ID="rvExpenseReport" runat="server" Width="100%" Height="100%" Visible="false">
        <LocalReport ReportPath="AdminPanel\Report\RPT_ACC_Expense\RPT_HospitalWise_ExpenseList.rdlc"></LocalReport>
    </rsweb:ReportViewer>

    <%-- Loading  --%>
    <asp:UpdateProgress ID="upr" runat="server">
        <ProgressTemplate>
            <div class="divWaiting">
                <asp:Label ID="lblWait" runat="server" Text=" Please wait... " />
                <asp:Image ID="imgWait" runat="server" SkinID="UpdatePanelLoding" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <%-- END Loading  --%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
    <script>
        SearchGridUI('<%=btnSearch.ClientID%>', 'sample_1', 1);
    </script>
</asp:Content>

