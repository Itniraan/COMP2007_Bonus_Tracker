//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace COMP2007_Bonus_Workout_Assignment.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Workout
    {
        public int WorkoutID { get; set; }
        public string WorkoutName { get; set; }
        public string WorkoutType { get; set; }
        public Nullable<int> Reps { get; set; }
        public Nullable<int> WorkoutSets { get; set; }
        public Nullable<decimal> WorkoutTime { get; set; }
        public System.DateTime TimeCompleted { get; set; }
    }
}