using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AmanTaxi
{
    public partial class AdminRides : System.Web.UI.Page
    {
        private readonly string connStr =
            ConfigurationManager.ConnectionStrings["AmanTaxiConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string childFilter = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT RideId, ChildName, PickupLocation, DropoffLocation, PickupTime, Status FROM Rides";

                if (!string.IsNullOrEmpty(childFilter))
                {
                    sql += " WHERE ChildName LIKE @child";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    if (!string.IsNullOrEmpty(childFilter))
                        cmd.Parameters.AddWithValue("@child", "%" + childFilter + "%");

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvRides.DataSource = dt;
                        gvRides.DataBind();
                    }
                }
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO Rides
                               (ChildName, PickupLocation, DropoffLocation, PickupTime, Status)
                               VALUES (@child, @pick, @drop, @time, @status)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@child", txtChildName.Text.Trim());
                    cmd.Parameters.AddWithValue("@pick", txtPickup.Text.Trim());
                    cmd.Parameters.AddWithValue("@drop", txtDropoff.Text.Trim());
                    cmd.Parameters.AddWithValue("@time", txtTime.Text.Trim());
                    cmd.Parameters.AddWithValue("@status", txtStatus.Text.Trim());

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblAdminMsg.Text = "Ride inserted successfully.";
            BindGrid();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtRideId.Text))
            {
                lblAdminMsg.Text = "Please enter Ride ID to update.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"UPDATE Rides
                               SET ChildName = @child,
                                   PickupLocation = @pick,
                                   DropoffLocation = @drop,
                                   PickupTime = @time,
                                   Status = @status
                               WHERE RideId = @id";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", int.Parse(txtRideId.Text));
                    cmd.Parameters.AddWithValue("@child", txtChildName.Text.Trim());
                    cmd.Parameters.AddWithValue("@pick", txtPickup.Text.Trim());
                    cmd.Parameters.AddWithValue("@drop", txtDropoff.Text.Trim());
                    cmd.Parameters.AddWithValue("@time", txtTime.Text.Trim());
                    cmd.Parameters.AddWithValue("@status", txtStatus.Text.Trim());

                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    lblAdminMsg.Text = rows > 0 ? "Ride updated successfully." : "Ride ID not found.";
                }
            }

            BindGrid();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtRideId.Text))
            {
                lblAdminMsg.Text = "Please enter Ride ID to delete.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM Rides WHERE RideId = @id";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", int.Parse(txtRideId.Text));
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    lblAdminMsg.Text = rows > 0 ? "Ride deleted." : "Ride ID not found.";
                }
            }

            BindGrid();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid(txtSearchChild.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearchChild.Text = "";
            BindGrid();
        }
    }
}
