page 52185970 "Asset Transfer List"
{
    CardPageID = "Asset Transfer";
    PageType = List;
    SourceTable = "Asset Transfer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Raised By"; Rec."Raised By")
                {
                }
                field("Asset to Transfer"; Rec."Asset to Transfer")
                {
                }
                field("From Location"; Rec."From Location")
                {
                }
                field("From Responsible Employee"; Rec."From Responsible Employee")
                {
                }
                field("To Location"; Rec."To Location")
                {
                }
                field("To Responsible Employee"; Rec."To Responsible Employee")
                {
                }
                field(Status; Rec.Status)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field(Transferred; Rec.Transferred)
                {
                }
            }
        }
    }

    actions
    {
    }
}

