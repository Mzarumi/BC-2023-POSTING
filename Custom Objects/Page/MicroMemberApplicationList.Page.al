page 52186367 "Micro Member Application List"
{
    CardPageID = "Micro Member Application List";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Member Application";
    SourceTableView = WHERE(Status = FILTER(Open | Pending | Approved),
                            "Group Account" = CONST(false),
                            Source = FILTER(<> Agency),
                            "Customer Type" = CONST(MicroFinance));

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
                field("Group Account No."; Rec."Group Account No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

