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
            // Populate form with existing student record
            Int32 WorkoutID = Convert.ToInt32(Request.QueryString["WorkoutID"]);

            try
            {
                using (WorkoutEntities db = new WorkoutEntities())
                {
                    Workout w = (from objW in db.Workouts
                                 where objW.WorkoutID == WorkoutID
                                 select objW).FirstOrDefault();

                    if (w != null)
                    {
                        txtName.Text = w.WorkoutName;
                        ddlType.SelectedValue = w.WorkoutType;
                        if (ddlType.SelectedValue == "Strength")
                        {
                            txtReps.Text = Convert.ToString(w.Reps);
                            txtWeight.Text = Convert.ToString(w.WorkoutWeight);
                            txtSets.Text = Convert.ToString(w.WorkoutSets);
                            pnlStrength.Visible = true;
                        }
                        else
                        {
                            pnlStrength.Visible = false;
                        }
                        txtLength.Text = Convert.ToString(w.WorkoutTime);
                        calTime.SelectedDate = Convert.ToDateTime(w.TimeCompleted);
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
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
                if (ddlType.SelectedValue == "Strength")
                {
                    w.WorkoutWeight = Convert.ToInt32(txtWeight.Text);
                    w.WorkoutSets = Convert.ToInt32(txtSets.Text);
                    w.Reps = Convert.ToInt32(txtReps.Text);
                }

                w.WorkoutTime = Convert.ToDecimal(txtLength.Text);
                w.TimeCompleted = Convert.ToDateTime(calTime.SelectedDate);

                // Call add only if we have no student ID
                if (WorkoutID == 0)
                {
                    db.Workouts.Add(w);
                }
                db.SaveChanges();

                // Redirect to the updated students page
                Response.Redirect("/exercises.aspx");
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