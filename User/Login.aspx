<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Foodie.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="book_section layout_padding ">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="false"></asp:Label>
                </div>
                <h2>Login</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userLogin" src="../Images/login.jpg" class="img-thumbnail">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                             <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                             <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username" ToolTip="Username" ></asp:TextBox>
                        </div>

                        <div>
                               <asp:requiredfieldvalidator id="rfvpassword" runat="server" errormessage="password is required" controltovalidate="txtpassword" forecolor="red" display="dynamic" setfocusonerror="true" Font-Size="Small"></asp:requiredfieldvalidator>
                                <asp:textbox id="txtpassword" runat="server" cssclass="form-control" placeholder="enter password" tooltip="password" TextMode="Password"></asp:textbox>

                        </div>
                        <div class="btn_box">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnLogin_Click" />
                                <span class="pl-3 h6 text-info">New User? <a href='Registration.aspx' class='badge badge-info pl-2 pb-1 text-white'> Register Here..</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>



</asp:Content>
