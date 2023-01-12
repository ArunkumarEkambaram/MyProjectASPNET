<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MyProject.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DlProduct" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" OnItemCommand="DlProduct_ItemCommand" OnItemDataBound="DlProduct_ItemDataBound">
        <ItemTemplate>
            <div class="m-2">
                <table class="table table-bordered table-hover">
                    <tr>
                        <td><%#Eval("ProductName") %> </td>
                    </tr>
                    <tr>
                        <td><%#Eval("CategoryName") %> </td>
                    </tr>
                    <tr>
                        <td><b></b><%# Eval("UnitPrice","{0:c}") %></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button Text="Add to Cart" ID="BtnAddToCart" CommandName="Add" CssClass="btn btn-primary text-capitalize" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>    
    </asp:Content>
