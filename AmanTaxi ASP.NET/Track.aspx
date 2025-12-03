<%@ Page Title="Track" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Track.aspx.cs" Inherits="AmanTaxi.Track" %>

<asp:Content ID="MainTrackContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="panel">
        <h1>Track my child</h1>
        <p>
            This page is a prototype to show how parents can follow the journey in real time.
            It includes a live map and space for in-car camera streams.
        </p>
    </section>

    <section class="panel">
        <h2>Live map (example)</h2>
        <iframe
            width="100%"
            height="350"
            style="border:0;"
            loading="lazy"
            allowfullscreen
            referrerpolicy="no-referrer-when-downgrade"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3623.804024036396!2d46.6753!3d24.7136">
        </iframe>
        <p class="small-text">
            In a full system this map would show the live location of the taxi using GPS.
        </p>
    </section>

    <section class="panel">
        <h2>Example in-car view (YouTube demo)</h2>
        <div class="video-container">
            <iframe
                width="100%"
                height="315"
                src="https://www.youtube.com/embed/dQw4w9WgXcQ"
                title="Example camera feed"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerpolicy="strict-origin-when-cross-origin"
                allowfullscreen>
            </iframe>
        </div>
        <p class="small-text">
            In the prototype this is a normal YouTube video; in a real deployment
            it would be replaced by a secure live stream from cameras inside the car.
        </p>
    </section>

</asp:Content>
