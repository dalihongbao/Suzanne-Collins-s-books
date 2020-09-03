using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment1.Models;

namespace Assignment1
{
    public partial class Dynamic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new SuzanneEntities())
            {
                var items = db.Books
                    .OrderBy(b => b.Id)
                    .Select(b => b)
                    .ToList();


                RBooks.DataSource = items;

                RBooks.DataBind();
            }
        }

        
    }
}