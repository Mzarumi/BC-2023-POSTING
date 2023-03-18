page 52186115 "Terminated Contracts list"
{
    Caption = 'Terminated Contracts list';
    CardPageID = "Terminated Contracts Card";
    PageType = List;
    SourceTable = Contracts;
    SourceTableView = WHERE(Terminated = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract No"; Rec."Contract No")
                {
                }
                field("Contractor Type"; Rec."Contractor Type")
                {
                }
                field("Contractor No"; Rec."Contractor No")
                {
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Tel No."; Rec."Tel No.")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Contract Description"; Rec."Contract Description")
                {
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Responsible Employee Name"; Rec."Responsible Employee Name")
                {
                }
                field("Review Interval"; Rec."Review Interval")
                {
                }
                field("Type Of Service"; Rec."Type Of Service")
                {
                }
                field("Advocate Name"; Rec."Advocate Name")
                {
                }
                field("Nature Of Service"; Rec."Nature Of Service")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control40; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control38; Links)
            {
            }
        }
    }

    actions
    {
    }
}

