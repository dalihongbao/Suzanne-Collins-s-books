<%@ Page Title="Suzanne" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dynamic.aspx.cs" Inherits="Assignment1.Dynamic" %>
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
            transition :all 1s;
        }
        .book:hover{
            height :300px;
            overflow: hidden;
            background-color :bisque;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    <h2 class="text-center">Works</h2>
    <div class="row justify-content-between">
        <asp:Repeater ID="RBooks" runat="server" ItemType="Assignment1.Models.Book">
            <ItemTemplate>
                <div class="col-md-3 mx-1 my-1  book ">
                    <h6 class="text-center my-2"><%# Item.title %></h6>
                
                        <p>
                            <%# Item.introduction.Length > 150
                                    ? Item.introduction.Substring(0,150) + "..."
                                    : Item.introduction%>
                        </p>
                    <a href="<%# "DynamicDetails.aspx?ID=" + Item.Id %>" class="btn btn-default" target="_blank">View More</a>
                
                </div>
                <div class="text-center">
                    <img alt='<%# Item.title %> ' src='<%# Item.thumbnail%>' class="img-thumbnail" />
                </div>
          
            </ItemTemplate>
            
        </asp:Repeater>
    </div>
    <script>
        $('p').on('click', function () {
            $(this).animate({
                'font-weight':"600"
            }, 5000,
                function () {
                    $(this).animate({
                        'font-weight': "400"
                    });
                })
        })

    </script>
</asp:Content>
