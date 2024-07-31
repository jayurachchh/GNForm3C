<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPageView.master" AutoEventWireup="true" CodeFile="Stu_AddEditView.aspx.cs" Inherits="AdminPanel_Student_StudentDetails_Stu_AddEditView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageContent" Runat="Server">

           <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <asp:Label SkinID="lblViewFormHeaderIcon" ID="lblViewFormHeaderIcon" runat="server"></asp:Label>
                <span class="caption-subject font-green-sharp bold uppercase">Student</span>
            </div>
            <div class="tools">
                <asp:HyperLink ID="CloseButton" SkinID="hlClosemymodal" runat="server" ClientIDMode="Static"></asp:HyperLink>
            </div>
        </div>
        
    </div>
</asp:Content>
<asp:Content ID="cntScripts" ContentPlaceHolderID="cphScripts" Runat="Server">
<script>
    $(document).keyup(function (e) {
        if (e.keyCode == 27) {
            ;
            $("#CloseButton").trigger("click");
        }
    });
</script>
</asp:Content>

