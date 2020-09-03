<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DynamicDetails.aspx.cs" Inherits="Assignment1.DynamicDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">

         <style>
       .img-thumbnail{
            height: 250px;
            width: 200px;
            transition:all 2s;

        }

       .img-thumbnail:hover{
            height: 300px;
            width: 250px;
        }


        .book
        {
            float:right;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    <asp:FormView ID="FVBook" runat="server" RenderOuterTable="false"
        ItemType="Assignment1.Models.Book"
        SelectMethod="FVBook_GetItem">
        <ItemTemplate>
            <h2 class="text-center"><%# Item.title %></h2>
            <div class="row ">
                <img alt='<%# Item.title %> ' src='<%# Item.thumbnail%>' class="img-thumbnail" />
                
                <div class="col-md-6 book">
                    <h3>Introduction</h3>
                    <p ><%# Item.introduction%></p>
                    <h3>Awards</h3>
                    <p class="col-md-10 font-italic"><%#Item.awards %></p>
                 </div>
     
            </div>
        </ItemTemplate>
    </asp:FormView>
    
    <asp:FormView ID="FVComment" runat="server" RenderOuterTable="false"
        ItemType="Assignment1.Models.Comment"
        SelectMethod="FVComment_GetItem"
        InsertMethod="FVComment_InsertItem"
        DataKeyNames="commentID">
        
        <InsertItemTemplate>
           <div class="form-text form-group">
                <label for="TBName">Name</label>
                <asp:TextBox runat="server" ID="TBName" Text='<%#BindItem.name%>' CssClass="form-control" placeholder="Name" required=""/>
            </div>
         
            <div class="form-text form-group">
                <label for="TBComment">Comment</label>
                <asp:TextBox runat="server" ID="TBComment" Text='<%#BindItem.comment1%>' TextMode="MultiLine" CssClass="form-control" Rows="10" placeholder="Comments" requierd=""/>
            </div>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" CssClass="btn btn-success"  />
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"/>
        </InsertItemTemplate>
        <ItemTemplate>
             <div class="row offset-6" >
                <asp:Button runat="server" CommandName="New" Text="Leave Your Comment" CauseVlidation="False" CssClass="btn btn-success" />
            </div>
        </ItemTemplate>
    </asp:FormView>

    <asp:GridView ID="GridView1" runat="server" ItemType="Assignment1.Models.Comment" AutoGenerateColumns="False" CellSpacing="-1" GridLines="None" CssClass="table table-stripped table-hover table-sm"  EnableViewState="false" SelectMethod="GridView1_GetData">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%# Item.name %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment">
                <ItemTemplate>
                    <%# Item.comment1 %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    
        <script>
            document.getElementsByClassName('btn-warning')[0].addEventListener('click', function (e) {
                if (confirm("Are sure you want to clear the form?")) {
                    //clear the form
                }
                else {
                    e.preventDefault();
                }
            })

            

            
                       
        </script>
</asp:Content>
