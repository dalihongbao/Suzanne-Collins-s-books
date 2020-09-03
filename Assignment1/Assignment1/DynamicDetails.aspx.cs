using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment1.Models;

namespace Assignment1
{
    public partial class DynamicDetails : System.Web.UI.Page
    {
        Models.SuzanneEntities db = new Models.SuzanneEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new SuzanneEntities())
            {
                
            }
            
            if(!IsPostBack)
            {
                GridView1.DataBind();
            }

          
      
        }
        // The id parameter should match the DataKeyNames value set on the control
          // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Assignment1.Models.Book FVBook_GetItem([QueryString] int? id)
        {
            Models.Book item = null;
            if(id.HasValue)
            {
                item = db.Books.Find(id.Value);
            }
            return item;
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id

        public Assignment1.Models.Comment FVComment_GetItem([QueryString]int? id)
        {
            Models.Comment item = null;
            if (id.HasValue)
            {
                item = db.Comments
                    .Where(c => c.ID == id.Value)
                    .Select(c => c)
                    .FirstOrDefault();
            }
            return item;
        }

        public void FVComment_InsertItem()
        {
            var item = new Assignment1.Models.Comment();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                item.ID = Convert.ToInt32(Request.QueryString["ID"]);
                db.Comments.Add(item);
                db.SaveChanges();

            }
        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            if(GridView1.Rows.Count>0)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Assignment1.Models.Comment> GridView1_GetData([QueryString] int? ID)
        {
            var query = db.Comments
                .Where(c => c.ID == ID);
            
            return query;
        }

 
    }
}