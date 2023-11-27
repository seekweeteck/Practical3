using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical3
{
    public partial class BusTicketing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                lblTime.Text = "You are accesing this page on " + DateTime.Now.ToString();
            }

            //Set today date as default for the Calendar Departual Date
            calDepartDate.SelectedDate = DateTime.Now;
        }

        protected void calDepartDate_SelectionChanged(object sender, EventArgs e)
        {
            lblDepartDate.Text = calDepartDate.SelectedDate.ToShortDateString();
        }

        protected void btnBookTicket_Click(object sender, EventArgs e)
        {
            if (validInput() == false)
            {
                Response.Write("<script>alert('Invalid Input.')</script>");

                return;
            }

        }

        protected void ddlTo_SelectedIndexChanged(object sender, EventArgs e)
        {
            float ticketPrice = 0.00f;
            int adult;
            int child;

            int fromInt = ddlFrom.SelectedIndex;
            int toInt = ddlTo.SelectedIndex;

            if (validInput() == false)
            {
                return;
            }
           
            adult = Convert.ToInt16(txtAdult.Text);
            child = Convert.ToInt16(txtChild.Text);

            //fromInt 0 = Empty, 1 = Hentian Duta, 2 = Hentian Putra
            //toInt = Empty, 1 = Butterworth, 2 = Seremban

            if ((fromInt == 1 && toInt == 2) || (fromInt == 2 && toInt == 1))
            {
                lblError.Visible = true;
                lblError.Text = "Sorry, we do not provide service from " + ddlFrom.Text + " to " + ddlTo.Text;
                txtPrice.Text = string.Empty;
                return;
            }else if (fromInt == 1 && toInt == 1)
            {
                ticketPrice = adult * 34.00f + child * 25.50f;
            }
            else if (fromInt == 2 && toInt == 2)
            {
                ticketPrice = adult * 6.00f + child * 4.30f;
            }
           

            lblError.Visible = false;
            txtPrice.Text =  ticketPrice.ToString("C2");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            calDepartDate.SelectedDate = DateTime.Now;
            lblError.Text = string.Empty;
            lblDepartDate.Text = string.Empty;
            ddlFrom.SelectedIndex = -1;
            ddlTo.SelectedIndex = -1;
            txtAdult.Text = string.Empty;
            txtChild.Text = string.Empty;
            txtPrice.Text = string.Empty;
        }


        Boolean validInput()
        {
            int fromInt = ddlFrom.SelectedIndex;
            int toInt = ddlTo.SelectedIndex;

            if (txtAdult.Text.Length == 0 || txtChild.Text.Length == 0)
            {
                return false;
            }

            if (fromInt == 0 || toInt == 0)
            {
                return false;
            }

            return true;
        }
    }
}