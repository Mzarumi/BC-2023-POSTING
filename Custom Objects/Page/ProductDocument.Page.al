page 52186064 "Product Document"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Product Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

