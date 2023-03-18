page 52186658 "Sky Coop Atm Transactions"
{
    PageType = List;
    SourceTable = "Coop ATM Transaction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Trace ID"; Rec."Document No.")
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Member Account"; Rec."Member Account")
                {
                }
                field(Description; Rec."Posting Description")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                }
                field("Time Reversed"; Rec."Time Reversed")
                {
                }
                field("Reversed By"; Rec."Reversed By")
                {
                }
                field("Reversal ID"; Rec."Reversal ID")
                {
                }
                field("Description 1"; Rec."Description 1")
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Transaction ID"; Rec."Transaction ID")
                {
                }
                field(Skipped; Rec.Skipped)
                {
                }
                field("Service Name"; Rec."Service Name")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("ATM No."; Rec."ATM No.")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field(Activity; Rec.Activity)
                {
                }
                field("Original Transaction ID"; Rec."Original Transaction ID")
                {
                }
                field("Channel Code"; Rec."Channel Code")
                {
                }
                field("Terminal ID"; Rec."Terminal ID")
                {
                }
                field(Channel; Rec.Channel)
                {
                }
                field("Sacco Account"; Rec."Sacco Account")
                {
                }
                field("Institution Code"; Rec."Institution Code")
                {
                }
                field("Terminal Code"; Rec."Terminal Code")
                {
                }
                field("Total Account Debit"; Rec."Total Account Debit")
                {
                }
                field("Total Charges"; Rec."Total Charges")
                {
                }
                field("Coop Fee"; Rec."Coop Fee")
                {
                }
                field("Sacco Fee"; Rec."Sacco Fee")
                {
                }
                field("Sacco Excise Duty"; Rec."Sacco Excise Duty")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("<Posting Attempts>"; Rec."Posting Attempts")
                {
                }
            }
        }
    }

    actions
    {
    }
}

