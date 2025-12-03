using System;
using System.Web;

namespace AmanTaxi
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load saved username from cookie, if available.
                HttpCookie savedUser = Request.Cookies["AmanTaxiUser"];
                if (savedUser != null)
                {
                    txtUsername.Text = savedUser.Value;
                    chkRemember.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUsername.Text.Trim().ToLower();
            string pass = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass) || string.IsNullOrEmpty(role))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            if (pass != "1234")
            {
                lblMessage.Text = "Wrong, remember username(role), password(1234).";
                return;
            }

            bool valid =
                (role == "parent" && user == "parent") ||
                (role == "driver" && user == "driver") ||
                (role == "child" && user == "child") ||
                (role == "admin" && user == "admin");

            if (!valid)
            {
                lblMessage.Text = "User and role do not match in this prototype.";
                return;
            }

            // Store in Session
            Session["Username"] = user;
            Session["Role"] = role;

            // Remember username with cookie (7 days)
            if (chkRemember.Checked)
            {
                HttpCookie cookie = new HttpCookie("AmanTaxiUser", user);
                cookie.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(cookie);
            }
            else
            {
                HttpCookie cookie = new HttpCookie("AmanTaxiUser");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            // Redirect by role – using your existing HTML pages for child / driver / parent
            if (role == "parent")
                Response.Redirect("AmanTaxi html/parent.html");
            else if (role == "driver")
                Response.Redirect("AmanTaxi html/driver.html");
            else if (role == "child")
                Response.Redirect("AmanTaxi html/child.html");
            else if (role == "admin")
                Response.Redirect("AdminRides.aspx");
        }
    }
}
