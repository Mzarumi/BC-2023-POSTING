page 52186308 "Posted Payment Voucher Staff L"
{
    CardPageID = "Posted Payment Voucher Staff";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payments Header Board";
    SourceTableView = WHERE(Posted = CONST(true),
                            "Payment Type" = CONST(Staff));

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
                field("Net Amount"; Rec."Net Amount")
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

