using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class Traditional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string shortText(object expression)
        {
            var description = Convert.ToString(expression);

            if (!String.IsNullOrEmpty(description))
            {
                if (description.Length > 150)
                {
                    description = description.Substring(0, length: 150) + "...";
                }
                else
                {
                    /*description=description*/
                }
            }

            return description;
        }
    }
}