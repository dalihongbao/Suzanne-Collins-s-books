<%@ Page Title="TraditionalDetails" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraditionalDetails.aspx.cs" Inherits="Assignment1.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">
    
     <style>
        .img-thumbnail{
            height: 250px;
            width: 200px;
            float:left;

        }

        .book
        {
            float:right;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">



    <asp:FormView ID="FVIntro" runat="server" DataSourceID="SDSComment">

        <InsertItemTemplate>
   
           <div class="form-text form-group ">
                <label for="TBName">Name</label>
                <asp:TextBox runat="server" ID="TBName" Text='<% # Bind("name")%>' CssClass="form-control" placeholder="Name..." required=""/>
            </div>
         
            <div class="form-text form-group">
                <label for="TBComment">Comment</label>
                <asp:TextBox runat="server" ID="TBComment" Text='<% # Bind("comment")%>' TextMode="MultiLine" CssClass="form-control" Rows="10" placeholder="Comments..." requierd=""/>
            </div>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" CssClass="btn btn-success"/>
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"/>


        </InsertItemTemplate>

        <ItemTemplate>
            <h2 class="text-center"><%# Eval("title") %></h2>
            <div class="row ">
                <img alt='<%# Eval("title") %> ' src='<%# Eval("thumbnail")%>' class="img-thumbnail" />
                
                <div class="col-md-6 book">
                    <h3>Introduction</h3>
                    <p ><%# Eval("introduction")%></p>
                    <h3>Awards</h3>
                    <p class="col-md-10 font-italic"><%#Eval("awards") %></p>
                 </div>
            </div>
            <div class="row offset-6" >
                <asp:Button runat="server" CommandName="New" Text="Leave Your Comment" CauseVlidation="False" CssClass="btn btn-success"/>
            </div>
        </ItemTemplate>

    </asp:FormView>



    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSComment" GridLines="None" CssClass="table table-striped">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%# Eval("name") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment">
                <ItemTemplate>
                    <%# Eval("comment") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>





    <asp:SqlDataSource ID="SDSComment" runat="server" ConnectionString="<%$ ConnectionStrings:SuzanneConnectionString %>" SelectCommand="SELECT * FROM Comments AS C
FULL JOIN Books AS B
ON C.ID=B.ID
WHERE B.ID=@ID
ORDER BY C.commentID
" InsertCommand="INSERT INTO Comments(comment, name,ID) VALUES (@comment, @name,@ID)">
        <InsertParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
            <asp:Parameter Name="comment" />
            <asp:Parameter Name="name" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
