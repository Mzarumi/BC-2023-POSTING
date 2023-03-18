page 52186713 "Retired Officials List Part"
{
    PageType = ListPart;
    SourceTable = "Delegate Officials";
    SourceTableView = WHERE(Retired = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                    Editable = false;
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Registered By"; Rec."Registered By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

