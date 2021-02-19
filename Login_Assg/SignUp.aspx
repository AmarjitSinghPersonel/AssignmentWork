<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Login_Assg.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js" type="text/javascript"></script>
    <script src="User.js" type="text/javascript"></script>
    <link href="CSS/User.css" type="text/css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    <script src="Scripts/aes.js" type="text/javascript"></script>
</head>
<body>
    <form id="myForm" runat="server" style="width: 90%; align-content: center">
        <div style="left: 38%; position: absolute; top: 1%; font-size: 28px; color: rebeccapurple; font-style: italic"><u>Acme Drone Delivery Service</u></div>
        <div id="snoAlertBox" class="alert alert-success" data-alert="alert">
            <label id="txtLabel"></label>
        </div>
        <div style="width: 100%">
            <asp:HiddenField runat="server" ID="hdnKey" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="hdnIV" ClientIDMode="Static" />
            <div class="mainDiv" style="width: 60%; left: 20%; top: 8%; position: absolute; align-content: center;">
                <table style="width:100%">
                    <tr style="width:100%">
                        <td style="width:50%">
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">First name</label></b>
                                <input type="text" class="form-control" id="InputFirstName" placeholder="First Name" />
                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">Family Name</label></b>
                                <input type="text" class="form-control" id="InputFamilyName" placeholder="Family Name" />
                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputEmail1">Email address</label></b>
                                <input type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Enter email" />

                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">Password</label></b>
                                <input type="password" class="form-control" id="InputPassword" onkeyup="checkPasswordStrength();" placeholder="Password" />
                                <div id="password-strength-status"></div>
                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">Confirm Password</label></b>
                                <input type="password" class="form-control" id="InputPasswordcfm" placeholder="Confirm Password" />
                            </div>
                        </td>
                        <td style="width:50%; position:absolute;">
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">Address</label></b>
                                <input type="text" class="form-control" id="InputAddress" placeholder="Address" />
                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">State</label></b>
                                <input type="text" class="form-control" id="InputState" placeholder="State" />
                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">Country</label></b>
                                <input type="text" class="form-control" id="InputCountry" placeholder="Country" />
                            </div>
                            <div>
                                <b>
                                    <label for="exampleInputPassword1">Postal Address</label></b>
                                <input type="text" class="form-control" id="InputPostal" placeholder="Postal" />
                            </div>
                        </td>
                    </tr>
                </table>


                <br />
                <input type="button" id="btnSubmit" class="btn btn-primary" value="Submit" title="Submit" />

            </div>
        </div>
    </form>
</body>
</html>
