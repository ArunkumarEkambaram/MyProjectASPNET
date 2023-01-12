<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MyProject.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New User</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-5  border rounded-3 p-3 shadow">
                    <div class="display-6 mb-3 text-dark">Registration Page</div>
                    <div class="mb-2 row">
                        <label class="form-label col-md-4">Email Id</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TxtEmailId" runat="server" CssClass="form-control" />
                            <div class="row">
                                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter Email Id" ID="RfvEmailId" ControlToValidate="TxtEmailId" runat="server" />
                            </div>
                            <div class="row">
                                <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ID="RevEmailId" runat="server" ControlToValidate="TxtEmailId" ErrorMessage="Please enter valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            </div>
                            <div class="row">
                                <asp:CustomValidator Display="Dynamic" ForeColor="Red" ErrorMessage="Email Id already exists" ID="CvEmailExists" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label class="form-label col-md-4">Password</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter the password" ID="RfvPassword" ControlToValidate="TxtPassword" runat="server" />
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label class="form-label col-md-4">Confirm Password</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TxtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            <asp:CompareValidator Display="Dynamic" ForeColor="Red" ID="CvConfirmPassword" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword" runat="server" ErrorMessage="Password and Confirm Password doesn't match" />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:Button Text="Submit" ID="BtnSubmit" runat="server" CssClass="btn btn-outline-primary" OnClick="BtnSubmit_Click" />
                        <asp:Button Text="Reset" ID="BtnReset" runat="server" CssClass="btn btn-outline-danger mx-3" CausesValidation="false" OnClick="BtnReset_Click" />
                    </div>
                    <div class="mt-3">
                        <label>Already have an account? </label>
                        <asp:HyperLink NavigateUrl="~/Login.aspx" ID="LinkNewUser" Text="Signin" runat="server" />
                    </div>
                    <div class="mt-2">
                        <asp:Label Text="" ID="LblMessage" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
