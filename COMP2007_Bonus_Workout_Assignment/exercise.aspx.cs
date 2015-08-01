using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using COMP2007_Bonus_Workout_Assignment.Models;
using System.Web.ModelBinding;

namespace COMP2007_Bonus_Workout_Assignment
{
    public partial class exercise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetWorkout();
            }
        }

        protected void GetWorkout()
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Use EF to connect to SQL Server
            using (WorkoutEntities db = new WorkoutEntities())
            {
                // Use the Student Model to save the new record
                Workout w = new Workout();
                Int32 WorkoutID = 0;

                // Check the QueryString for an ID so we can determine add / update
                if (Request.QueryString["WorkoutID"] != null)
                {
                    // Get the ID from the URL
                    WorkoutID = Convert.ToInt32(Request.QueryString["WorkoutID"]);

                    // Get the current student from the Enity Framework
                    w = (from objW in db.Workouts
                         where objW.WorkoutID == WorkoutID
                         select objW).FirstOrDefault();

                }
                w.WorkoutName = txtName.Text;
                w.WorkoutType = ddlType.SelectedValue;
                w.
                s.FirstMidName = txtFirstName.Text;
                s.EnrollmentDate = Convert.ToDateTime(txtEnrollmentDate.Text);

                // Call add only if we have no student ID
                if (StudentID == 0)
                {
                    db.Students.Add(s);
                }
                db.SaveChanges();

                // Redirect to the updated students page
                Response.Redirect("/admin/students.aspx");
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedValue == "Strength")
            {
                pnlStrength.Visible = true;
            }
            else
            {
                pnlStrength.Visible = false;
            }
        }
    }
}