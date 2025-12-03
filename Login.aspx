<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AmanTaxi.Login" %>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="panel">
        <h1>Login</h1>
        <p class="small-text">
            Demo accounts for the prototype:<br />
            Parent: username <strong>parent</strong>, password <strong>1234</strong><br />
            Driver: username <strong>driver</strong>, password <strong>1234</strong><br />
            Child: username <strong>child</strong>, password <strong>1234</strong><br />
            Admin: username <strong>admin</strong>, password <strong>1234</strong>
        </p>

        <asp:Label ID="lblMessage" runat="server" CssClass="small-text" ForeColor="Red" />

        <p>
            <label>Username:<br />
                <asp:TextBox ID="txtUsername" runat="server" />
            </label>
        </p>

        <p>
            <label>Password:<br />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </label>
        </p>

        <p>
            <label>Role:<br />
                <asp:DropDownList ID="ddlRole" runat="server">
                    <asp:ListItem Value="">Please choose</asp:ListItem>
                    <asp:ListItem Value="parent">Parent</asp:ListItem>
                    <asp:ListItem Value="driver">Driver</asp:ListItem>
                    <asp:ListItem Value="child">Child</asp:ListItem>
                    <asp:ListItem Value="admin">Admin</asp:ListItem>
                </asp:DropDownList>
            </label>
        </p>

        <p>
            <asp:CheckBox ID="chkRemember" runat="server" Text="Remember my username" />
        </p>

        <p>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </p>
    </section>

</asp:Content>
