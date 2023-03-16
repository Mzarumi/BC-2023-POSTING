page 52185727 "Member Group List"
{
    CardPageID = "Member Group";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Members;
    SourceTableView = WHERE("Group Account" = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Control13)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("First Name"; Rec."First Name")
                {
                    Visible = false;
                }
                field("Second Name"; Rec."Second Name")
                {
                    Visible = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field(Status; Rec.Status)
                {
                    ValuesAllowed = New, Active, Frozen, "Withdrawal Applicant", Deceased, Defaulter, Closed, "Withdrawn Shareholder";
                }
                field(Classification; Rec.Classification)
                {
                }
                field("Passport No."; Rec."Passport No.")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Dividend Payment Method"; Rec."Dividend Payment Method")
                {
                }
                field("Membership Type"; Rec."Membership Type")
                {
                }
                field("Old Member No."; Rec."Old Member No.")
                {
                }
                field("Group Account"; Rec."Group Account")
                {
                }
                field("Group Account No."; Rec."Group Account No.")
                {
                }
                field(Source; Rec.Source)
                {
                }
            }
        }
    }

    actions
    {
    }
}

