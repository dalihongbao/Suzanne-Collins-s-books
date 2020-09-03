<%@ Page Title="Traditional" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Traditional.aspx.cs" Inherits="Assignment1.Traditional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">
    <style>
        .img-thumbnail{
            height: 250px;
            width: 200px;

        }

        .book{
            height :300px;
            background-color:aliceblue;
            overflow: hidden;

        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server" >
    <h2 class="text-center">Works</h2>
    <div class="row justify-content-between">
        <asp:Repeater ID="RBooks" runat="server" DataSourceID="SDSSuzanne" >
            <ItemTemplate>
                <div class="col-md-3 mx-1 my-1  book ">
                    <h6 class="text-center my-2"><%# Eval("title") %></h6>
                
                        <p>
                            <%# shortText(Eval("introduction")) %>
                        </p>
                    <a href="<%# "TraditionalDetails.aspx?ID=" + Eval("ID") %>" class="btn btn-default" target="_blank">View More</a>
                
                </div>
                <div class="text-center">
                    <img alt='<%# Eval("title") %> ' src='<%# Eval("thumbnail")%>' class="img-thumbnail" />
                </div>
          
            </ItemTemplate>
            
        </asp:Repeater>
    </div>


    <asp:SqlDataSource ID="SDSSuzanne" runat="server" ConnectionString="<%$ ConnectionStrings:SuzanneConnectionString %>" SelectCommand="SELECT [Id], [title], [introduction], [bookViews], [thumbnail], [awards] FROM [Books] ORDER BY [Id]"></asp:SqlDataSource>

</asp:Content>
