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
                <asp:RequiredFieldValidator ID="exerciseTypeRequiredValidator" runat="server" ErrorMessage="Exercise Type is Required!" 
                    Display="Dynamic" ControlToValidate="ddlType" CssClass="label label-danger"></asp:RequiredFieldValidator>
            </fieldset>

            <asp:Panel ID="pnlStrength" runat="server" Visible="false">
                <fieldset>
                    <label for="txtWeight">Weight: </label>
                    <asp:TextBox ID="txtWeight" runat="server" ToolTip="Weight lifted in pounds"></asp:TextBox>
                    <asp:Label ID="lblWeight" runat="server" Text="lbs"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Weight is Required!" Display="Dynamic" 
                        ControlToValidate="txtWeight" CssClass="label label-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Weight must be between 0 and 1000" Type="Integer" Display="Dynamic" 
                         MinimumValue="0" MaximumValue="1000" CssClass="label label-danger" ControlToValidate="txtWeight"></asp:RangeValidator>
                </fieldset>
                <fieldset>
                    <label for="txtReps"># of Reps: </label>
                    <asp:TextBox ID="txtReps" runat="server" ToolTip="Number of Reps in each Set"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="# of Reps are Required!" Display="Dynamic" 
                         ControlToValidate="txtReps" CssClass="label label-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Reps must be between 0 and 1000" Type="Integer" ControlToValidate="txtReps"
                         CssClass="label label-danger" MinimumValue="0" MaximumValue="1000" Display="Dynamic"></asp:RangeValidator>
                </fieldset>
                <fieldset>
                    <label for="txtSets"># of Sets: </label>
                    <asp:TextBox ID="txtSets" runat="server" ToolTip="Number of sets completed"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="# of Sets is Required!" ControlToValidate="txtSets" 
                         CssClass="label label-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Sets must be between 0 and 1000" ControlToValidate="txtSets" 
                         MinimumValue="0" MaximumValue="1000" Type="Integer" CssClass="label label-danger" Display="Dynamic"></asp:RangeValidator>
                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


    <fieldset>
        <label for="txtLength">Workout Length: </label>
        <asp:TextBox ID="txtLength" runat="server" ToolTip="Amount of time this workout lasted, in minutes and seconds"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Workout Length is Required!" ControlToValidate="txtLength" 
             CssClass="label label-danger" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Workout Length must be between 0 and 60.00" Type="Double" 
             ControlToValidate="txtLength" MinimumValue="0" MaximumValue="60" CssClass="label label-danger" Display="Dynamic"></asp:RangeValidator>
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
