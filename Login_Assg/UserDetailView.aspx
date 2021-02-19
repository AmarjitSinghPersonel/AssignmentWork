<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetailView.aspx.cs" Inherits="Login_Assg.UserDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" />

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
                <div>
                    <table>
                        <tr>
                            <td style="width:100%">
                                <asp:Label runat="server" ID="lblErr" Visible="false" ForeColor="Red"></asp:Label></td>
                            <td style="left: 134%; position: absolute;">
                                <asp:Button ID="Signout" class="btn btn-primary" runat="server" Text="SignOut" OnClick="Signout_Click" /></td>
                        </tr>
                    </table>

                </div>
                <div>
                    <b>
                        <label for="exampleInputPassword1">First name</label></b>
                    <asp:TextBox runat="server" ID="InputFirstName" class="form-control" ClientIDMode="Static" placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="InputFirstName" ErrorMessage="Please enter your First Name!" />
                </div>
                <div>
                    <b>
                        <label for="exampleInputPassword1">Family Name</label></b>
                    <asp:TextBox runat="server" ID="InputFamilyName" class="form-control" ClientIDMode="Static" placeholder="Family Name"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="InputFamilyName" ErrorMessage="Please enter your First Name!" />
                </div>
                <div>
                    <b>
                        <label for="exampleInputPassword1">Address</label></b>
                    <asp:TextBox runat="server" ID="InputAddress" class="form-control" ClientIDMode="Static" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="InputAddress" ErrorMessage="Please enter your Address!" />
                </div>
                <div>
                    <b>
                        <label for="exampleInputPassword1">State</label></b>
                    <asp:TextBox runat="server" ID="InputState" class="form-control" ClientIDMode="Static" placeholder="State"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="InputFamilyName" ErrorMessage="Please enter your State!" />
                </div>
                <div>
                    <b>
                        <label for="exampleInputPassword1">Country</label></b>
                    <asp:TextBox runat="server" ID="InputCountry" class="form-control" ClientIDMode="Static" placeholder="State"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="InputCountry" ErrorMessage="Please enter your Country!" />
                </div>
                <div>
                    <b>
                        <label for="exampleInputPassword1">Postal Address</label></b>
                    <asp:TextBox runat="server" ID="InputPostal" class="form-control" ClientIDMode="Static" placeholder="Postal"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="InputCountry" ErrorMessage="Please enter your Postal Address!" />
                </div>
                <asp:Button runat="server" ID="btnSubmit" class="btn btn-primary" OnClick="btnSubmit_Click" Text="Submit" />

            </div>
        </div>
    </form>
</body>
</html>
