<%@ Page Title="Admin - Manage Rides" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="AdminRides.aspx.cs" Inherits="AmanTaxi.AdminRides" %>

<asp:Content ID="AdminContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="panel">
        <h1>Admin – Manage Rides</h1>
        <asp:Label ID="lblAdminMsg" runat="server" CssClass="small-text" ForeColor="Green" />
    </section>

    <section class="panel">
        <h2>Add / Edit ride</h2>
        <table>
            <tr>
                <td>Ride ID (for update / delete):</td>
                <td><asp:TextBox ID="txtRideId" runat="server" /></td>
            </tr>
            <tr>
                <td>Child name:</td>
                <td><asp:TextBox ID="txtChildName" runat="server" /></td>
            </tr>
            <tr>
                <td>Pickup location:</td>
                <td><asp:TextBox ID="txtPickup" runat="server" /></td>
            </tr>
            <tr>
                <td>Drop-off location:</td>
                <td><asp:TextBox ID="txtDropoff" runat="server" /></td>
            </tr>
            <tr>
                <td>Pickup time:</td>
                <td><asp:TextBox ID="txtTime" runat="server" /></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><asp:TextBox ID="txtStatus" runat="server" /></td>
            </tr>
        </table>

        <p>
            <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </p>
    </section>

    <section class="panel">
        <h2>Search rides</h2>
        <p>
            Child name:
            <asp:TextBox ID="txtSearchChild" runat="server" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <asp:Button ID="btnShowAll" runat="server" Text="Show all" OnClick="btnShowAll_Click" />
        </p>

        <asp:GridView ID="gvRides" runat="server" AutoGenerateColumns="false" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="RideId" HeaderText="Ride ID" />
                <asp:BoundField DataField="ChildName" HeaderText="Child" />
                <asp:BoundField DataField="PickupLocation" HeaderText="Pickup" />
                <asp:BoundField DataField="DropoffLocation" HeaderText="Drop-off" />
                <asp:BoundField DataField="PickupTime" HeaderText="Time" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </section>

</asp:Content>
