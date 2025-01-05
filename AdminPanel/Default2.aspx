<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="AdminPanel_Default2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #282B34;
            color: white;
            font-family: Arial, sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #343A40;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
        .login-container h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        .social-login-buttons {
            display: flex;
            justify-content: space-around;
            margin-bottom: 15px;
        }
        .social-login-buttons a {
            text-decoration: none;
            color: white;
            width: 45%;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
        }
        .google {
            background-color: #DB4437;
        }
        .facebook {
            background-color: #3B5998;
        }
        .github {
            background-color: #333;
        }
        .feide {
            background-color: #2B76CB;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            background-color: #28A745;
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }
        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }
        .forgot-password a {
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h3>Log In</h3>
            <div class="social-login-buttons">
                <a href="#" class="google">Google</a>
                <a href="#" class="facebook">Facebook</a>
            </div>
            <div class="social-login-buttons">
                <a href="#" class="github">Github</a>
                <a href="#" class="feide">Feide</a>
            </div>
            <hr />
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="password"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" />
            <div class="forgot-password">
                <a href="#">Forgot Password?</a>
            </div>
            <div class="text-center mt-3">
                <span>Don't have an account? </span><a href="#">Sign up</a>
            </div>
        </div>
    </form>
</body>
</html>

