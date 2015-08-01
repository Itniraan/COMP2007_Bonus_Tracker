using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using COMP2007_Bonus_Workout_Assignment.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace COMP2007_Bonus_Workout_Assignment
{
    public partial class exercises : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["SortColumn"] = "WorkoutID";
                Session["SortDirection"] = "ASC";
                // If loading the page for the first time, populate the Workouts grid
                GetWorkouts();
            }
        }

        protected void GetWorkouts()
        {
            // Connect to EF
            using (WorkoutEntities db = new WorkoutEntities())
            {
                String sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                // Query the Workouts table, using the Enity Framework
                var Workouts = from w in db.Workouts
                               select w;

                // Bind the result to the gridview
                grdExercises.DataSource = Workouts.AsQueryable().OrderBy(sortString).ToList();
                grdExercises.DataBind();
            }
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set new page size
            grdExercises.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            GetWorkouts();
        }

        protected void grdExercises_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Store which row was clicked
            Int32 selectedRow = e.RowIndex;

            // Get the selected StudentID using the grid's Data Key collection
            Int32 WorkoutID = Convert.ToInt32(grdExercises.DataKeys[selectedRow].Values["WorkoutID"]);

            try
            {
                // Use Enity Framework to remove the selected student from the DB
                using (WorkoutEntities db = new WorkoutEntities())
                {
                    Workout w = (from objW in db.Workouts
                                 where objW.WorkoutID == WorkoutID
                                 select objW).FirstOrDefault(); // Using First would get an error if no data comes back, FirstOrDefault won't throw an error

                    // Do the delete
                    db.Workouts.Remove(w);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }

            // Refresh the grid
            GetWorkouts();

        }

        protected void grdExercises_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page number
            grdExercises.PageIndex = e.NewPageIndex;
            GetWorkouts();
        }

        protected void grdExercises_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // Reload the Grid
            GetWorkouts();

            // Toggle Direction
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void grdExercises_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdExercises.Columns.Count - 1; i++)
                    {
                        if (grdExercises.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "images/desc.jpg";
                                SortImage.AlternateText = "Sort Descending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "images/asc.jpg";
                                SortImage.AlternateText = "Sort Ascending";
                            }

                            e.Row.Cells[i].Controls.Add(SortImage);

                        }
                    }
                }
            }
        }
    }
}