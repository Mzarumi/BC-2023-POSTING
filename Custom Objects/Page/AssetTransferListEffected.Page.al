page 52185968 "Asset Transfer List Effected"
{
    CardPageID = "Cancelled Petty Cash Vouchers";
    Editable = false;
    PageType = List;
    SourceTable = "Asset Transfer";
    SourceTableView = WHERE(Transferred = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
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

