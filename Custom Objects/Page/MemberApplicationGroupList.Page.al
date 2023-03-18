page 52185715 "Member Application Group List"
{
    CardPageID = "Member Application Group";
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Member Application";
    SourceTableView = WHERE(Status = FILTER(Open | Pending | Approved),
                            "Group Account" = CONST(true));

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
                    Visible = false;
                }
                field("Phone No."; Rec."Phone No.")
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
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Created By", '=%1', UserId);
    end;
}

