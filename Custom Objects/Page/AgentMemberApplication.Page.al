page 52186173 "Agent Member Application"
{
    CardPageID = "Member Application Single";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Member Application";
    SourceTableView = WHERE(Status = FILTER(Open | Pending | Approved),
                            "Group Account" = CONST(false),
                            Source = CONST(Agency));

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
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field("Agent Name"; AgentApplications.Name)
                {
                }
                field("Agent Doc No"; Rec."Agent Doc No")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if AgentApplications.Get(Rec."Agent Code") then;
    end;

    var
        AgentApplications: Record "Agent Applications";
}

