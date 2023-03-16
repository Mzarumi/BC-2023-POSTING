page 52186301 "Posted Payment Voucher Board L"
{
    CardPageID = "Posted Payment Voucher Board";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payments Header Board";
    SourceTableView = WHERE(Posted = CONST(true),
                            "Payment Type" = CONST(Board));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Bank No."; Rec."Bank No.")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("File Location"; Rec."File Location")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

