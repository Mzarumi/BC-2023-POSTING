page 52186304 "Bank Transfer Modes"
{
    PageType = List;
    SourceTable = "Bank Transfer Modes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Notes)
            {
            }
            systempart(Control8; MyNotes)
            {
            }
            systempart(Control9; Links)
            {
            }
        }
    }

    actions
    {
    }
}

