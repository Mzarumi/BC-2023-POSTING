page 52186388 "Delegate Group Change Lists"
{
    CardPageID = "Delegate Region Change  Cards";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Delegate Region Change";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Delegate Region Description"; Rec."Delegate Region Description")
                {
                }
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

