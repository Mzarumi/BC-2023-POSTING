page 52186426 "Collateral Collection - List"
{
    CardPageID = "Collateral Collection Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Securities Collection Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field(Collateral; Rec.Collateral)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Notes)
            {
            }
            systempart(Control6; MyNotes)
            {
            }
            systempart(Control7; Links)
            {
            }
        }
    }

    actions
    {
    }
}

