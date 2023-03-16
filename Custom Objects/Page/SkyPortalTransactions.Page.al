page 52185473 "Sky Portal Transactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Sky Portal Transactions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction ID"; Rec."Transaction ID")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Member Account"; Rec."Member Account")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Source Account No"; Rec."Source Account No")
                {
                }
                field("Destination Account"; Rec."Destination Account")
                {
                }
                field("Loan No."; Rec."Loan No.")
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
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                }
                field("Client Name"; Rec."Client Name")
                {
                }
                field("Needs Change"; Rec."Needs Change")
                {
                }
                field("Destination Name"; Rec."Destination Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

