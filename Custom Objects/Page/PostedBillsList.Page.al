page 52186252 "Posted Bills List"
{
    CardPageID = "Bill Batch Posted";
    Editable = false;
    PageType = List;
    SourceTable = "Bills Batch";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Batch No."; Rec."Batch No.")
                {
                }
                field("Batch Name"; Rec."Batch Name")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("No of Billings"; Rec."No of Billings")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field("Billing Period"; Rec."Billing Period")
                {
                }
            }
        }
    }

    actions
    {
    }
}

