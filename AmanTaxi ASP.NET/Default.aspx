<%@ Page Title="AmanTaxi - Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AmanTaxi._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO SECTION -->
    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to AmanTaxi</h1>
            <p>Your trusted platform for safe child transportation.</p>
            <a href="Signup.aspx" class="cta-btn">Register Now</a>
        </div>
    </section>

    <!-- FEATURES SECTION -->
    <section class="features">
        <h2>Why Choose AmanTaxi?</h2>

        <div class="feature-container">
            <div class="feature">
                <h3>Verified Drivers</h3>
                <p>All drivers are trained and background-checked for child safety.</p>
            </div>

            <div class="feature">
                <h3>Live Tracking</h3>
                <p>Parents can track rides in real time from start to finish.</p>
            </div>

            <div class="feature">
                <h3>Secure Pickups</h3>
                <p>Dedicated pickup authentication ensures your child’s safety.</p>
            </div>
        </div>
    </section>

    <!-- CALL TO ACTION -->
    <section class="cta">
        <h2>Ready to get started?</h2>
        <a href="Login.aspx" class="cta-btn">Login</a>
    </section>

</asp:Content>
