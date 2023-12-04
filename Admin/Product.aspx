<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Foodie.Admin.Product" %>

<%@ Import Namespace="Foodie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader;
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="pcoded-inner-container" pt-0>
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">

                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-sm-6 col-md-4 col-lg-4 ">
                                            <h4 class="sub-title">Product</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Product Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                            ErrorMessage="Name Is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                            ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0"></asp:HiddenField>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Description</label>
                                                    <div>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Product Description" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                            ErrorMessage="Description Is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Price(₹)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price " TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                            ErrorMessage="Price Is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>

                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Price Must be in Decimal"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice" ValidationExpression="^(0(?!\.00)|[1-9]\d{0,6})\.\d{2}$">

                                                        </asp:RegularExpressionValidator>

                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>Product Quantity</label>
                                                    <div>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter Product Quantity" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                            ErrorMessage="Quantity Is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>

                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Quantity Must be in Non Negative"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity" ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>Product Category</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategories" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId" AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                            ErrorMessage="Category Is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCategories" InitialValue="0"></asp:RequiredFieldValidator>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]"></asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" CssClass="form-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                                    &nbsp;
                                                     <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" CauseValidation="false" OnClick="btnClear_Click" />
                                                </div>
                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" OnItemCommand="rProduct_ItemControl" OnItemDataBound="rProduct_ItemDataBound" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category Lists</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">


                                                    <asp:Repeater ID="rProduct" runat="server"   OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rproduct_Itemdatabound">
                                                        



                                                    <headertemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="tabke-plus">Name</th>
                                                                    <th>Image</th>
                                                                    <th>Price(₹)</th>
                                                                    <th>Qty</th>
                                                                    <th>Category</th>
                                                                    <th>IsActive</th>
                                                                    <th>Description</th>
                                                                    <th>CreatedDate</th>
                                                                    <th class="datatable-nosort">Action</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </headertemplate>
                                                    <itemtemplate>
                                                        <tr>
                                                            <td class="tabke-plus"><%# Eval("Name") %></td>
                                                            <td>
                                                                <img src=" <%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="" width="40" />
                                                            </td>
                                                            <td><%# Eval("Price") %></td>

                                                            <td>
                                                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                            </td>

                                                            <td><%# Eval("CategoryName") %></td>

                                                            <td>
                                                                <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                            </td>

                                                            <td><%# Eval("Description") %></td>

                                                            <td><%# Eval("CreatedDate") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="edit" CssClass="badge badge-primary" CausesValidation="false"
                                                                    CommandArgument='<%# Eval("ProductId") %>'>
                                                                         <i class="ti-pencil"></i>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="delete" CssClass="badge bg-danger" CausesValidation="false"
                                                                    CommandArgument='<%# Eval("ProductId") %>' OnClientClick="return confirm('Do You Want To Delete This Product?');">

                                                                         <i class="ti-trash"></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        </tbody>
                                                             </table>
                                                    </footertemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
