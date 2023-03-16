page 52185429 "MBanking Applications List"
{
    CardPageID = "Mbanking Applications";
    Editable = false;
    PageType = List;
    SourceTable = "M-SACCO Applications";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Customer ID No"; Rec."Customer ID No")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("MPESA Mobile No"; Rec."MPESA Mobile No")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

