page 52186706 "Delegate Official Applications"
{
    CardPageID = "Delegate Officials Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Delegate Officials";
    SourceTableView = WHERE(Status = FILTER(Open | Pending));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                }
                field("Member Number"; Rec."Member Number")
                {
                }
                field("Delegate Official Name"; Rec."Delegate Official Name")
                {
                }
                field(Position; Rec.Position)
                {
                }
                field(Retired; Rec.Retired)
                {
                }
                field("Retire Date"; Rec."Retire Date")
                {
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

