using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;


    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadGrid1_NeedDataSource1(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = GetDataTable("SELECT * from PatientPrefs");
        }

        protected void RadGrid1_ItemCommand(object sender, EventArgs e)
        {


        }
        //function to get table data from sqlDB
        public DataSet GetDataTable(String query)
        {
            String Conn_str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(Conn_str))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet);
                    return dataSet;
                }
            }

        }

        protected void choco_checkchanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            bool status = chk.Checked;
            GridDataItem item = (GridDataItem)chk.NamingContainer;
            int row = item.ItemIndex + 1;
            string query;
            if (status)
            {
                query = "Update PatientPrefs SET ChocoPref=1 where ID=@row";
            }
            else
            {
                query = "Update PatientPrefs SET ChocoPref=0 where ID=@row";
            }
            UpdateDataBase(status, query, row);

        }
        protected void UpdateDataBase(bool status, string query, int row)
        {
            String Conn_str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(Conn_str))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@row", row);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    conn.Close();

                }
            }

        }
        //filter patient list by color 
        protected void RadComboBox1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string text = e.Text;
            String ConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(ConnString);
            string querystr = " ";
            if (e.Text == "Red")
            {
                querystr = "Select * from PatientPrefs where (ColorPref_Red = 1)";
            }
            else if (e.Text == "Blue")
            {
                querystr = "Select * from PatientPrefs where (ColorPref_Blue = 1)";
            }
            else if (e.Text == "Green")
            {
                querystr = "Select * from PatientPrefs where (ColorPref_Green = 1)";
            }
            else if (e.Text == "Purple")
            {
                querystr = "Select * from PatientPrefs where (ColorPref_Purple = 1)";

            }
            else
            {
                querystr = "Select * from PatientPrefs";
            }

            SqlCommand query = new SqlCommand(querystr, conn);
            conn.Open();
            query.Parameters.AddWithValue("@text", text);
            RadGrid1.DataSource = GetDataTable(querystr);
            RadGrid1.DataBind();
            conn.Close();
        }
        //function to populate the data in the combo box
        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            String query = "Select * from PatientPrefs";
            RadGrid1.DataSource = GetDataTable(query);
            RadComboBox1.Items.Add("All");
            RadComboBox1.Items.Add("Green");
            RadComboBox1.Items.Add("Red");
            RadComboBox1.Items.Add("Blue");
            RadComboBox1.Items.Add("Purple");
        }
         
    }



