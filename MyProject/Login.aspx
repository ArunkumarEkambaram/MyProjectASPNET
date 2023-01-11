<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-5 border rounded p-3 shadow">
                    <div class="display-6 mb-3">Existing User!</div>
                    <div class="mb-2 row">
                        <label class="form-label  col-md-4">Email Id</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TxtEmailId" runat="server" CssClass="form-control" />
                            <div class="row">
                                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter Email Id" ID="RfvEmailId" ControlToValidate="TxtEmailId" runat="server" />
                            </div>
                            <div class="row">
                                <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ID="RevEmailId" runat="server" ControlToValidate="TxtEmailId" ErrorMessage="Please enter valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label class="form-label col-md-4">Password</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter the password" ID="RfvPassword" ControlToValidate="TxtPassword" runat="server" />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:Button Text="Sign In" ID="BtnSubmit" runat="server" CssClass="btn btn-outline-primary" OnClick="BtnSubmit_Click" />
                    </div>
                    <div class="mt-3">
                        <label>Not a member? </label>
                        <asp:HyperLink NavigateUrl="~/Registration.aspx" ID="LinkNewUser" Text="Signup Now" runat="server" />
                    </div>
                    <div class="mt-2">
                        <asp:CustomValidator Display="Dynamic" ForeColor="Red" ID="CustomValidator1" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
