<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login_Assg.Login_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js" type="text/javascript"></script>
    <script src="Login.js" type="text/javascript"></script>
    <link href="CSS/User.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; left: 38%; position: absolute; top: 1%; font-size: 28px; color: rebeccapurple; font-style: italic"><u>Acme Drone Delivery Service</u></div>
        <div id="snoAlertBox" class="alert alert-success" data-alert="alert">
            <label id="txtLabel"></label>
        </div>
        <div style="width: 100%">
            <div class="mainDiv" style="width: 30%; left: 35%; top: 10%; position: absolute; align-content: center;">
                <div class="form-group">
                    <b>
                        <asp:Label runat="server" ID="lblErr" Visible="false" ForeColor="Red"></asp:Label></b>

                </div>
                <div class="form-group">
                    <b>
                        <label for="exampleInputPassword1">Email</label></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox runat="server" ID="InputEmail" Width="300px" CssClass="txtBoxClass" placeholder="Email"></asp:TextBox>
                    <%--<input type="text" class="form-control" id="InputEmail" placeholder="First Name" />--%>
                </div>
                <div class="form-group">
                    <b>
                        <label for="exampleInputPassword1">Password</label></b>
                    <asp:TextBox runat="server" TextMode="Password" ID="InputPassword" Width="300px" CssClass="txtBoxClass" placeholder="Password"></asp:TextBox>
                    <%--<input type="text" class="form-control" id="InputPassword" placeholder="Family Name" />--%>
                </div>
                <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary" Text="Login" />
                <asp:Button runat="server" ID="btnSignup" OnClick="btnSignup_Click" class="btn btn-primary" Text="Sign Up" />
                <%--<input type="button" id="btnSubmit" class="btn btn-primary" value="Submit" title="Submit" />--%>
            </div>
        </div>
    </form>
</body>
</html>
