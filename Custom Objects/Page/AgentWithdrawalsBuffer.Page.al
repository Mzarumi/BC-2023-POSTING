page 52185460 "Agent Withdrawals Buffer"
{
    PageType = List;
    SourceTable = "Sky Agent Withdrawals Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Trace ID"; Rec."Trace ID")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Posting S"; Rec."Posting S")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Unit ID"; Rec."Unit ID")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Trans Time"; Rec."Trans Time")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Source; Rec.Source)
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Reversed Posted"; Rec."Reversed Posted")
                {
                }
                field("Reversal Trace ID"; Rec."Reversal Trace ID")
                {
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Withdrawal Location"; Rec."Withdrawal Location")
                {
                }
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Transaction Type Charges"; Rec."Transaction Type Charges")
                {
                }
                field("Card Acceptor Terminal ID"; Rec."Card Acceptor Terminal ID")
                {
                }
                field("ATM Card No"; Rec."ATM Card No")
                {
                }
                field("Customer Names"; Rec."Customer Names")
                {
                }
                field("Process Code"; Rec."Process Code")
                {
                }
                field("Is Coop Bank"; Rec."Is Coop Bank")
                {
                }
                field("POS Vendor"; Rec."POS Vendor")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                }
                field("Reversed By"; Rec."Reversed By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

