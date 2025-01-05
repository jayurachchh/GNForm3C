<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPage.master" AutoEventWireup="true" CodeFile="Hospitaldatatree.aspx.cs" Inherits="AdminPanel_DataTree_Hospitaldatatree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" runat="Server">
    <asp:Label ID="lblPageHeader_XXXXX" runat="server" Text="Demo Hospital"></asp:Label>
    <small>
        <asp:Label ID="lblPageHeaderInfo_XXXXX" runat="server" Text="Master"></asp:Label></small>
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
    <li class="active">
        <asp:Label ID="lblBreadCrumbLast" runat="server" Text="Hospital"></asp:Label>
    </li>
</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <!--Help Text-->
    <ucHelp:ShowHelp ID="ucHelp" runat="server" />
    <!--Help Text End-->
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
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-search"></i>
                                            </span>
                                            <asp:DropDownList ID="ddlHospitalID" AutoPostBack="true" CssClass="form-control select2me" runat="server"></asp:DropDownList>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%-- End Search --%>


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
                        </div>
                        <div class="portlet-body">
                            <div class="row" runat="server" id="Div_SearchResult">
                                <div class="col-md-12">
                                    <!-- Nested Repeater for Hospitals, Financial Years, and Incomes -->
                                    <asp:Repeater ID="rptHospitals" runat="server" OnItemCommand="rptHospitals_ItemCommand">
                                        <HeaderTemplate>
                                            <table class="table table-bordered ">

                                                <%--                                                    <tr>
                                                        <th style="width: 5%;">Action</th>
                                                        <th>Hospital</th>
                                                    </tr>--%>
                                                <thead>
                                                    <tr class="TRDark">
                                                        <th>
                                                            <asp:Label ID="lbhlAction" runat="server" Text="#"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhHospital" runat="server" Text="Hospital"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhPrintName" runat="server" Text="Print Name"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhPrintLine1" runat="server" Text="Print Line1"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhPrintLine2" runat="server" Text="Print Line2"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhPrintLine3" runat="server" Text="Print Line3"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhFooterName" runat="server" Text="Footer Name"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="lbhReportHeaderName" runat="server" Text="Report Header Name"></asp:Label>
                                                        </th>
                                                        <%--                                                    <th>
                                                        <asp:Label ID="lblCount" runat="server" Text="ExpenseType Count"></asp:Label>
                                                    </th>
                                                    <th class="nosortsearch text-nowrap text-center">
                                                        <asp:Label ID="lbhAction" runat="server" Text="Action"></asp:Label>
                                                    </th>--%>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnShowFinYears" CssClass="btn green btn-circle btn-xs tooltips" runat="server" ClientIDMode="Static" Text="+" CommandName="LoadFinYears" CommandArgument='<%# Eval("HospitalID") %>' />

                                                </td>
                                                <td>
                                                    <asp:HyperLink ID="hlViewHospitalID" NavigateUrl='<%# "~/AdminPanel/Master/MST_Hospital/MST_HospitalView.aspx?HospitalID=" + GNForm3C.CommonFunctions.EncryptBase64(Eval("HospitalID").ToString()) %>' data-target="#viewiFrameReg" CssClass="modalButton" data-toggle="modal" runat="server"><%#Eval("Hospital") %></asp:HyperLink>
                                                </td>
                                                <td>
                                                    <%#Eval("PrintName") %>
                                                </td>
                                                <td>
                                                    <%#Eval("PrintLine1") %>
                                                </td>
                                                <td>
                                                    <%#Eval("PrintLine2") %>
                                                </td>
                                                <td>
                                                    <%#Eval("PrintLine3") %>
                                                </td>
                                                <td>
                                                    <%#Eval("FooterName") %>
                                                </td>
                                                <td>
                                                    <%#Eval("ReportHeaderName") %>
                                                </td>
                                                <asp:HiddenField ID="hdnHospitalID" runat="server" Value='<%# Eval("HospitalID") %>' />
                                            </tr>

                                            <asp:Panel ID="pnlFinYears" runat="server" Visible="false">
                                                <!-- Financial Year Repeater -->
                                                <tr id="" display="none">
                                                    <td></td>
                                                    <td colspan="7">
                                                        <div>
                                                            <asp:Repeater ID="rptFinYears" runat="server" OnItemCommand="rptFinYears_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <table class="table table-bordered">
                                                                        <thead>
                                                                            <tr class="TRDark">
                                                                                <th>#</th>
                                                                                <th>Financial Year</th>
                                                                                <th>From Date</th>
                                                                                <th>To Date</th>
                                                                                <th>Remarks</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>

                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="btnShowIncomes" CssClass="btn green btn-circle btn-xs tooltips" runat="server" CommandName="LoadIncomes" Text="+" CommandArgument='<%# Eval("FinYearID") %>' />
                                                                        </td>

                                                                        <td>
                                                                            <asp:HyperLink ID="hlViewFinYearID" NavigateUrl='<%# "~/AdminPanel/Master/MST_FinYear/MST_FinYearView.aspx?FinYearID=" + GNForm3C.CommonFunctions.EncryptBase64(Eval("FinYearID").ToString()) %>' data-target="#viewiFrameReg" CssClass="modalButton" data-toggle="modal" runat="server" class="text-center"> <%#Eval("FinYearName") %> </asp:HyperLink>
                                                                        </td>
                                                                        <td>
                                                                            <%#Eval("FromDate",GNForm3C.CV.DefaultDateFormatForGrid) %>
                                                                        </td>
                                                                        <td>
                                                                            <%#Eval("ToDate",GNForm3C.CV.DefaultDateFormatForGrid) %>
                                                                        </td>
                                                                        <td>
                                                                            <%#Eval("Remarks") %>
                                                                        </td>
                                                                    </tr>

                                                                    <asp:Panel ID="pnlIncomes" runat="server" Visible="false">
                                                                        <!-- Income Repeater -->
                                                                        <tr>
                                                                            <td></td>
                                                                            <td colspan="4">
                                                                                <asp:Repeater ID="rptIncomes" runat="server">
                                                                                    <HeaderTemplate>
                                                                                        <table class="table table-bordered">
                                                                                            <thead>
                                                                                                <tr class="TRDark">
                                                                                                    <th>Income Type</th>
                                                                                                    <th class="text-right">Amount</th>
                                                                                                    <th>Income Date</th>
                                                                                                    <th>Note</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                    </HeaderTemplate>

                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <%--<td><%# Eval("IncomeType") %></td>--%>
                                                                                            <td>
                                                                                                <asp:HyperLink ID="hlViewIncomeID" NavigateUrl='<%# "~/AdminPanel/Account/ACC_Income/ACC_IncomeView.aspx?IncomeID=" + GNForm3C.CommonFunctions.EncryptBase64(Eval("IncomeID").ToString()) %>' data-target="#viewiFrameReg" CssClass="modalButton" data-toggle="modal" runat="server"><%#Eval("IncomeType") %></asp:HyperLink></td>
                                                                                            <td class="text-right"><%# Eval("Amount",GNForm3C.CV.DefaultCurrencyFormatWithDecimalPoint) +" Rs" %></td>
                                                                                            <td><%# Eval("IncomeDate",GNForm3C.CV.DefaultDateFormatForGrid) %></td>
                                                                                            <td><%# Eval("Note") %></td>
                                                                                        </tr>
                                                                                    </ItemTemplate>

                                                                                    <FooterTemplate>

                                                                                        <%-- Total Amount Row --%>
                                                                                        <tr>
                                                                                            <td style="text-align: right; font-weight: bold;">Total Amount:</td>

                                                                                            <td style="font-weight: bold;">
                                                                                                <asp:Label ID="lblTotalAmount" runat="server" />

                                                                                            </td>
                                                                                            <td>
                                                                                                <%-- Empty cell for alignment --%>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <%-- END Total Amount Row --%>
                                                                                        
                                                                                        </tbody>
                                                                                </table>
                                                                                   
                                                                                    </FooterTemplate>
                                                                                </asp:Repeater>
                                                                            </td>
                                                                        </tr>
                                                                    </asp:Panel>
                                                                </ItemTemplate>

                                                                <FooterTemplate>
                                                                    </tbody>
                                                                </table>
                                                               
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            </tbody>
                                            </table>
                                       
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <%-- Pagination --%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label class="control-label">
                                                <asp:Label ID="lblRecordInfoBottom" Text="No entries found" runat="server"></asp:Label></label>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="dataTables_paginate paging_simple_numbers" runat="server" id="Div_Pagination">
                                                <ul class="pagination">
                                                    <li class="paginate_button previous disabled" id="liFirstPage" runat="server">
                                                        <asp:LinkButton ID="lbtnFirstPage" Enabled="false" OnClick="PageChange_Click" CommandName="FirstPage" CommandArgument="1" runat="server"><i class="fa fa-angle-double-left"></i></asp:LinkButton></li>
                                                    <li class="paginate_button previous disabled" id="liPrevious" runat="server">
                                                        <asp:LinkButton ID="lbtnPrevious" Enabled="false" OnClick="PageChange_Click" CommandArgument="1" CommandName="PreviousPage" runat="server"><i class="fa fa-angle-left"></i></asp:LinkButton></li>
                                                    <asp:Repeater ID="rpPagination" runat="server" OnItemDataBound="rpPagination_ItemDataBound">
                                                        <ItemTemplate>
                                                            <li>
                                                                <li class="paginate_button" id="liPageNo" runat="server">
                                                                    <asp:LinkButton ID="lbtnPageNo" runat="server" OnClick="PageChange_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageNo")%>' CommandName="PageNo"><%# DataBinder.Eval(Container.DataItem, "PageNo")%></asp:LinkButton></li>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <li class="paginate_button next disabled" id="liNext" runat="server">
                                                        <asp:LinkButton ID="lbtnNext" Enabled="false" OnClick="PageChange_Click" CommandArgument="1" CommandName="NextPage" runat="server"><i class="fa fa-angle-right"></i></asp:LinkButton></li>
                                                    <li class="paginate_button previous disabled" id="liLastPage" runat="server">
                                                        <asp:LinkButton ID="lbtnLastPage" Enabled="false" OnClick="PageChange_Click" CommandName="LastPage" CommandArgument="-99" runat="server"><i class="fa fa-angle-double-right"></i></asp:LinkButton></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-3 pull-right">
                                            <div class="btn-group" runat="server" id="Div_GoToPageNo">
                                                <asp:TextBox ID="txtPageNo" placeholder="Page No" onkeypress="return IsNumeric(event)" runat="server" CssClass="pagination-panel-input form-control input-xsmall input-inline col-md-4" MaxLength="9"></asp:TextBox>
                                                <asp:LinkButton ID="lbtnGoToPageNo" runat="server" CssClass="btn btn-default input-inline col-md-4" CommandName="GoPageNo" CommandArgument="0" OnClick="PageChange_Click">Go</asp:LinkButton>
                                            </div>
                                            <div class="btn-group pull-right" runat="server" id="Div_PageSize">
                                                <label class="control-label">Page Size</label>
                                                <asp:DropDownList ID="ddlPageSizeBottom" AutoPostBack="true" CssClass="form-control input-xsmall" runat="server" OnSelectedIndexChanged="ddlPageSizeBottom_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- END Pagination --%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    <%-- END List --%>


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
    <script type="text/javascript">


</script>
</asp:Content>




