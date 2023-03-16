page 52186311 "Delegate Group App List"
{
    CardPageID = "Delegate Region App Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Delegate Groups Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Delegate Group Description"; Rec."Delegate Group Description")
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

