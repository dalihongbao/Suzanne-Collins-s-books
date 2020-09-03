<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="explanation.aspx.cs" Inherits="Assignment1.explanation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    <table border="1" style="width:100%">
        <tr>
            <td>Original Page</td>
            <td>Fixed Page</td>
        </tr>
        <tr>
            <td style="width:600px">Not using a css style, such as putting text directly in the body of the document 
                without wrapping it in a container element 
                (such as a < p>aragraph< /p>)</td>
            <td>Using bootstrap(v4) CSS framework</td>
        </tr>
        <tr>
            <td>Lots of starting tags and ending tags was omitted</td>
            <td>Using tags correctly</td>
        </tr>
        <tr>
            <td>Images are blurry and in different size</td>
            <td>Using high quality images and trim the images into same size</td>
        </tr>
        <tr>
            <td>The paragragh doesn't match the corresponding paragraph and there's too much inforamtion at one page which makes it hard to read </td>
            <td>Redesigned the layout and used a database to build a detail page for each book </td>
        </tr>
        <tr>
            <td>N/A</td>
            <td>You can leave your own comments of each book at the details page</td>
        </tr>
        <tr>
            <td>N/A</td>
            <td>If you put your mouse on the brief decription at the homepage, the backgroud color will change to red and if you click on the text the font weight will change to bold</td>
        </tr>
        <tr>
            <td>N/A</td>
            <td>If you put on the mouse on the book image at the details page, the page will be enlarged.</td>
        </tr>
        <tr>
            <td>N/A</td>
            <td>The cancel button will trigger an message to ask the user if the want to clean the form</td>
        </tr>
    </table>
    <a href="http://www.suzannecollinsbooks.com/">Click here to got to the original website</a>
</asp:Content>
