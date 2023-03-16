page 52186472 "HR Company Activities List Clo"
{
    CardPageID = "HR Company Activities Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Company Activities";
    SourceTableView = WHERE(Closed = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field("Acitivity Description"; Rec."Acitivity Description")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Venue; Rec.Venue)
                {
                }
                field("Activity  Status>"; Rec."Activity Status")
                {
                    Caption = 'Activity  Status';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Company Activities Factbox")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

