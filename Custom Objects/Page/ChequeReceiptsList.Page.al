page 52185814 "Cheque Receipts List"
{
    CardPageID = "Cheque Receipts Header";
    Editable = false;
    PageType = List;
    SourceTable = "Cheque Receipts";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Clearing Bank"; Rec."Clearing Bank")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

