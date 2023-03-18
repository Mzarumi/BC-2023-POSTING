page 52186664 "Rejected Member Application"
{
    CardPageID = "Member Application Single";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Member Application";
    SourceTableView = WHERE(Status = CONST(Rejected),
                            "Group Account" = CONST(false),
                            Source = FILTER(<> Agency),
                            "Membership Option" = FILTER(Member),
                            "Virtual Member" = FILTER(false));

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
                field("Application Date"; Rec."Application Date")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Customer Type"; Rec."Customer Type")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Passport No."; Rec."Passport No.")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("P.I.N Number"; Rec."P.I.N Number")
                {
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
                field("Recruited By"; Rec."Recruited By")
                {
                    Caption = 'Recruiter';
                }
                field("Recruited by Type"; Rec."Recruited by Type")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

