page 52186227 "Bills List"
{
    CardPageID = "Bill Batch";
    Editable = false;
    PageType = List;
    SourceTable = "Bills Batch";
    SourceTableView = WHERE(Posted = CONST(false));

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

