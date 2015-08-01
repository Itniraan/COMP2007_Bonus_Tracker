<%@ Page Title="Add/Edit Exercise" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="exercise.aspx.cs" Inherits="COMP2007_Bonus_Workout_Assignment.exercise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1><strong>Add/Edit Exercise</strong></h1>
    <h4 class="alert-info">All fields are mandatory</h4>

    <fieldset>
        <label for="txtName">Exercise Name: </label>
        <asp:TextBox ID="txtName" runat="server" MaxLength="50" ToolTip="What was this exercise called?"></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameRequiredValidator" runat="server" ErrorMessage="Exercise Name is Required!" Display="Dynamic" 
            ControlToValidate="txtName" CssClass="label label-danger"></asp:RequiredFieldValidator>
    </fieldset>
    <asp:UpdatePanel ID="udpStrength" runat="server">
        <ContentTemplate>
            <fieldset>
                <label for="ddlType">Exercise Type: </label>
                <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="true" ToolTip="Type of Exercise">
                    <asp:ListItem Text="---------" Value="None"></asp:ListItem>
                    <asp:ListItem Text="Cardio" Value="Cardio"></asp:ListItem>
                    <asp:ListItem Text="Strength" Value="Strength"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:DropDownList>
            </fieldset>

            <asp:Panel ID="pnlStrength" runat="server" Visible="false">
                <fieldset>
                    <label for="txtWeight">Weight: </label>
                    <asp:TextBox ID="txtWeight" runat="server" ToolTip="Weight lifted in pounds"></asp:TextBox>
                    <asp:Label ID="lblWeight" runat="server" Text="lbs"></asp:Label>
                </fieldset>
                <fieldset>
                    <label for="txtReps"># of Reps: </label>
                    <asp:TextBox ID="txtReps" runat="server" ToolTip="Number of Reps in each Set"></asp:TextBox>
                </fieldset>
                <fieldset>
                    <label for="txtSets"># of Sets: </label>
                    <asp:TextBox ID="txtSets" runat="server" ToolTip="Number of sets completed"></asp:TextBox>
                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


    <fieldset>
        <label for="txtLength">Workout Length: </label>
        <asp:TextBox ID="txtLength" runat="server" ToolTip="Amount of time this workout lasted, in minutes and seconds"></asp:TextBox>
    </fieldset>
    <fieldset>
        <asp:UpdatePanel ID="updCal" runat="server">
            <ContentTemplate>
                <label for="calTime">Date Completed: </label>
                <asp:Calendar ID="calTime" runat="server" ToolTip="Date this exercise was completed on"></asp:Calendar>
            </ContentTemplate>
        </asp:UpdatePanel>
    </fieldset>
    <fieldset>
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
    </fieldset>
</asp:Content>
