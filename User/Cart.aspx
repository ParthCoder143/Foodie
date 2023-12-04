﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Foodie.User.Cart" %>

<%@ Import Namespace="Foodie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>Your Shopping Cart</h2>
            </div>
        </div>

        <div class="container">
            <asp:Repeater ID="rCartItem" runat="server" OnItemCommand="rCartItem_ItemCommand" OnItemDataBound="rCartItem_ItemDataBound">
                <HeaderTemplate>
                    <table class="table">
                        <table class="table data-table-export">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Total Price</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td>
                            <img src=" <%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="" width="60" />
                        </td>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            <asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("ProductId") %>' />
                            <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Qty") %>' />
                            <asp:HiddenField ID="hdnPrdQuantity" runat="server" Value='<%# Eval("PrdQty") %>' />
                        </td>
                        <td>
                            <div class="product__details__option">

                                <button class="btn btn-link px-0"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <asp:TextBox ID="txtQuantity" Style="width: 45px; text-align:center" runat="server" TextMode="Number" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Small" ValidationExpression="[1-9]*" ControlToValidate="txtQuantity" Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"></asp:RegularExpressionValidator>
                                <button class="btn btn-link px-0"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                            </div>
                        </td>
                        <td>
                            <asp:Label ID="lblTotalPrice" runat="server">₹</asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lblDelete" runat="server" Text="Remove" CommandName="remove"
                                CommandArgument='<%# Eval("ProductId") %>' OnClientClick="return confirm('Do you want to remove this item from cart?')"> <i class="fa fa-close"></i></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                        <tr>
                            <td colspan="3"></td>
                            <td class="pl-lg-5">
                                <b>Grand Total:-</b>
                            </td>
                            <td>₹<% Response.Write(Session["grandTotalPrice"]); %></td>
                            <td></td>
                        </tr>
                    <tr>
                        <td colspan="2" class="continue__btn">
                            <a href="Menu.aspx" class="btn btn-info"><i class="fa fa-arrow-circle-left mr-2"> Continue Shopping </i></a>
                        </td>
                        <td>
                            <asp:LinkButton ID="lblUpdate" runat="server" CommandName="updateCart" CssClass="btn btn-warning"><i class="fa fa-refresh mr-2"> </i> Update Cart</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lblCheckout" runat="server" CommandName="checkout" CssClass="btn btn-success"> Checkout     <i class="fa fa-arrow-circle-right mr-2"> </i> </asp:LinkButton>
                        </td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </section>

</asp:Content>
