<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPage.master" AutoEventWireup="true" CodeFile="MasterDashboard.aspx.cs" Inherits="AdminPanel_MasterDashboard" %>

<asp:Content ID="cntPageHeader" ContentPlaceHolderID="cphPageHeader" runat="Server">
    <asp:Label ID="lblPageHeader_XXXXX" Text="Master DashBoard " runat="server"></asp:Label><small><asp:Label ID="lblPageHeaderInfo_XXXXX" Text="Master" runat="server"></asp:Label></small>
    <span class="pull-right">
        <small>
            <asp:HyperLink ID="hlShowHelp" SkinID="hlShowHelp" runat="server"></asp:HyperLink>
        </small>
    </span>
</asp:Content>

<asp:Content ID="cntBreadcrumb" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
    <li>
        <i class="fa fa-home"></i>
        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/AdminPanel/Default.aspx" Text="Home"></asp:HyperLink>
        <i class="fa fa-angle-right"></i>
    </li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <!--Help Text-->
    <ucHelp:ShowHelp ID="ucHelp" runat="server" />
    <!--Help Text End-->
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upsearch" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <asp:UpdatePanel ID="upMST_ExpenseType2" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-12">
                            <ucMessage:ShowMessage ID="ucMessage" runat="server" />
                            <asp:ValidationSummary ID="ValidationSummary1" SkinID="VS" runat="server" />
                        </div>
                    </div>

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
                                        <div class="col-md-3">
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-search"></i>
                                                    </span>
                                                    <asp:DropDownList ID="ddlHospitalID" CssClass="form-control select2me" runat="server"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvHospitalID" SetFocusOnError="True" runat="server" Display="Dynamic" ControlToValidate="ddlHospitalID" ErrorMessage="Select Hospital" InitialValue="-99"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <asp:Button ID="btnShow" SkinID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" />
                                            <%--                              <asp:Button ID="btnClear" runat="server" SkinID="btnClear" Text="Clear" OnClick="btnClear_Click" />--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="upsum" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlsum" runat="server" Visible="false">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption font-green">
                            <i class="fa fa-line-chart font-green"></i>
                            <span class="caption-subject bold uppercase">Total Overview</span>
                        </div>
                        <div class="tools"></div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal" role="form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat dashboard-stat-v2 green" href="<%= "Account/ACC_Income/ACC_IncomeList.aspx?HospitalID="+ GNForm3C.CommonFunctions.EncryptBase64(ddlHospitalID.SelectedValue.ToString())%>">
                                            <div class="visual">
                                                <i class="fa fa-comments"></i>
                                            </div>
                                            <div class="details">
                                                <div class="number">
                                                    <asp:Label runat="server" ID="lblIncomeTotal"></asp:Label>
                                                </div>
                                                <div class="desc">Total Incomes</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat dashboard-stat-v2 red" href="<%= "Account/ACC_Expense/ACC_ExpenseList.aspx?HospitalID="+ GNForm3C.CommonFunctions.EncryptBase64(ddlHospitalID.SelectedValue.ToString())%>">
                                            <div class="visual">
                                                <i class="fa fa-list"></i>
                                            </div>
                                            <div class="details">
                                                <div class="number">
                                                    <asp:Label runat="server" ID="lblExpenseTotal"></asp:Label>
                                                </div>
                                                <div class="desc">Total Expenses</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat dashboard-stat-v2 blue" href="<%= "Account/ACC_Transaction/ACC_TransactionList.aspx?HospitalID="+ GNForm3C.CommonFunctions.EncryptBase64(ddlHospitalID.SelectedValue.ToString())%>">
                                            <div class="visual">
                                                <i class="fa fa-globe"></i>
                                            </div>
                                            <div class="details">
                                                <div class="number">
                                                    <asp:Label runat="server" ID="lblPatientTotal"></asp:Label>
                                                </div>
                                                <div class="desc">Total Patients</div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="upmonincm" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlmonincm" runat="server" Visible="false">
                <!-- BEGIN RESULTS TABLE -->
                <div class="portlet box green">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bullhorn"></i>Day Wise Monthly Income</span>
                       
                       
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                        </div>

                    </div>
                    <div class="portlet-body">
                        <asp:Label ID="lblNoIncomeRecords" runat="server" Text="No Income Records Found" Visible="false" CssClass="text-danger" />

                        <asp:GridView ID="IncomeList" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" ShowFooter="True" DataKeyNames="Date" OnRowDataBound="IncomeList_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Jan" HeaderText="January" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Feb" HeaderText="February" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Mar" HeaderText="March" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Apr" HeaderText="April" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="May" HeaderText="May" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Jun" HeaderText="June" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Jul" HeaderText="July" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Aug" HeaderText="August" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Sep" HeaderText="September" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Oct" HeaderText="October" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nov" HeaderText="November" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Dec" HeaderText="December" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="LightGray" Font-Bold="True" />
                        </asp:GridView>
                    </div>
                </div>
                <!-- END RESULTS TABLE -->
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="upmonexp" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlmonexp" runat="server" Visible="false">
                <!-- BEGIN RESULTS TABLE -->
                <div class="portlet  box red">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bullhorn"></i>Day Wise Monthly Expense</span>
                       
                       
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <asp:Label ID="lblNoExpenseRecords" runat="server" Text="No Expense Records Found" Visible="false" CssClass="text-danger" />
                        <asp:GridView ID="ExpenseList" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" ShowFooter="True" DataKeyNames="Date" OnRowDataBound="ExpenseList_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Jan" HeaderText="January" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Feb" HeaderText="February" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Mar" HeaderText="March" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Apr" HeaderText="April" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="May" HeaderText="May" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Jun" HeaderText="June" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Jul" HeaderText="July" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Aug" HeaderText="August" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Sep" HeaderText="September" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Oct" HeaderText="October" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nov" HeaderText="November" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Dec" HeaderText="December" DataFormatString="{0:C}">
                                    <HeaderStyle CssClass="TRDark" Font-Bold="true" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="LightGray" Font-Bold="True" />
                        </asp:GridView>
                    </div>
                </div>
                <!-- END RESULTS TABLE -->
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="TreatmentWiseSummary" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="Panel3" runat="server" Visible="false">
                <!-- BEGIN RESULTS TABLE -->
                <div class="portlet  box blue">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-line-chart"></i></i> Treatment Wise Summary</span>
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <asp:Label ID="lblNoPatientsRecords" runat="server" Text="No Treatment Summary Records Found" Visible="false" CssClass="text-danger" />
                        <asp:Repeater ID="TreatmentWiseSummaryRepeater" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr class="TRDark">
                                            <th style="text-align: center; font-weight: bold;">Sr.</th>
                                            <th style="text-align: center; font-weight: bold;">Treatment Type</th>
                                            <th style="text-align: center; font-weight: bold;">Patients Count</th>
                                            <th style="text-align: right; font-weight: bold;">Income Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%# Eval("SerialNo") %>'></asp:Label>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:Label ID="lblTreatmentType" runat="server" Text='<%# Eval("TreatmentType") %>'></asp:Label>
                                    </td>
                                    <td style="text-align: center;">

                                        <asp:HyperLink ID="hlPatientCount" SkinID="hlGreen_Grid" NavigateUrl=' <%# "Account/ACC_Transaction/ACC_TransactionList.aspx?HospitalID="+ GNForm3C.CommonFunctions.EncryptBase64(ddlHospitalID.SelectedValue.ToString()) +"&TreatmentID="+ GNForm3C.CommonFunctions.EncryptBase64(Eval("TreatmentID").ToString()) %>' Text='<%# Eval("PatientsCount") %>' runat="server"></asp:HyperLink>

                                    </td>
                                    <td style="text-align: right;">
                                        <asp:Label ID="lblIncomesAmount" runat="server" Text='<%# Eval("IncomesAmount", "{0:C}") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                             </table>
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>
                </div>
                <!-- END RESULTS TABLE -->
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


<asp:UpdatePanel ID="HospitalWiseIncomeExpense" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
    </Triggers>
    <ContentTemplate>
        <!-- BEGIN Collapsible Chart Panel -->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-line-chart"></i> Hospital Wise Income Expense Bar Chart
                </div>
                <div class="tools">
                    <!-- Collapse/Expand link -->
                    <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                </div>
            </div>
            <div class="portlet-body">
                <!-- Panel for Chart Display -->
                <asp:Panel ID="pnBarChart" runat="server" Style="width: 800px; height: 500px;">
                    <!-- Div for Google Chart -->
                    <div id="chart_div" style="width: 100%; height: 100%;"></div>
                </asp:Panel>
            </div>
        </div>
        <!-- END Collapsible Chart Panel -->

        <!-- Google Charts JavaScript -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', { packages: ['corechart'] });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                // Sample data for the chart
                var data = google.visualization.arrayToDataTable([
                    ['Treatment Type', 'Patients Count', 'Income Amount'],
                    ['Treatment A', 10, 200],
                    ['Treatment B', 15, 300],
                    ['Treatment C', 20, 400],
                    ['Treatment D', 25, 500]
                ]);

                var options = {
                    title: 'Hospital Wise Income Expense B',
                    hAxis: { title: 'Treatment Type', titleTextStyle: { color: '#333' } },
                    vAxis: { minValue: 0 },
                    legend: { position: 'bottom' },
                    bars: 'vertical', // Vertical bar chart
                    height: 500,
                    width: 800,
                };

                var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </ContentTemplate>
</asp:UpdatePanel>



</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
</asp:Content>
