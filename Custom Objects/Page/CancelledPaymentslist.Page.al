page 52186698 "Cancelled Payments list"
{
    CardPageID = "Payment Header";
    PageType = List;
    SourceTable = "Payments Header";
    SourceTableView = WHERE(Status = FILTER(Cancelled));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field(Payee; Rec.Payee)
                {
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                }
                field(Cashier; Rec.Cashier)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Total Payment Amount"; Rec."Total Payment Amount")
                {
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Payment Type"; Rec."Payment Type")
                {
                }
                field("Bankers Cheque No"; Rec."Bankers Cheque No")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Bank Name"; Rec."Bank Name")
                {
                }
                field(Select; Rec.Select)
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

