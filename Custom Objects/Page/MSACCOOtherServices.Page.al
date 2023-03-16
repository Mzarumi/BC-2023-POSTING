page 52186603 "M-SACCO Other Services"
{
    PageType = List;
    SourceTable = "M-SACCO Other Services";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Trace ID"; Rec."Trace ID")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Telephone No"; Rec."Telephone No")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Cheque Leaf From"; Rec."Cheque Leaf From")
                {
                }
                field("Cheque Leaf To"; Rec."Cheque Leaf To")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

