<%@ Page Title="List Exercises" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="exercises.aspx.cs" Inherits="COMP2007_Bonus_Workout_Assignment.exercises" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Exercises</h1>

    <div>
        <strong>Records Per Page: </strong>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Value="3" Text="3" />
            <asp:ListItem Value="5" Text="5" />
            <asp:ListItem Value="10" Text="10" />
        </asp:DropDownList>
    </div>

    <asp:GridView ID="grdExercises" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" 
         OnRowDeleting="grdExercises_RowDeleting" AllowPaging="true" PageSize="3" AllowSorting="true" OnPageIndexChanging="grdExercises_PageIndexChanging" 
         OnSorting="grdExercises_Sorting" OnRowDataBound="grdExercises_RowDataBound" DataKeyNames="WorkoutID">
        <Columns>
            <asp:BoundField DataField="WorkoutID" HeaderText="Workout ID" SortExpression="WorkoutID" />
            <asp:BoundField DataField="WorkoutName" HeaderText="Workout Name" SortExpression="WorkoutName" />
            <asp:BoundField DataField="WorkoutType" HeaderText="Workout Type" SortExpression="WorkoutType" />
            <asp:BoundField DataField="WorkoutWeight" HeaderText="Workout Weight" SortExpression="WorkoutWeight" />
            <asp:BoundField DataField="Reps" HeaderText="Workout Reps" SortExpression="Reps" />
            <asp:BoundField DataField="WorkoutSets" HeaderText="Workout Sets" SortExpression="WorkoutSets" />
            <asp:BoundField DataField="WorkoutTime" HeaderText="Length of Workout" SortExpression="WorkoutTime" />
            <asp:BoundField DataField="TimeCompleted" HeaderText="Date Completed" SortExpression="TimeCompleted" DataFormatString="{0:yyyy/MM/dd}" />
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="~/exercise.aspx" DataNavigateUrlFields="WorkoutID" DataNavigateUrlFormatString="exercise.aspx?WorkoutID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
