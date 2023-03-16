page 52186136 "Cancelled Store Req List"
{
    CardPageID = "Store Requisition Header";
    PageType = List;
    SourceTable = "Store Requistion Header";
    SourceTableView = WHERE(Status = CONST(Cancelled));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Request date"; Rec."Request date")
                {
                }
                field("Request Description"; Rec."Request Description")
                {
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3; Notes)
            {
            }
            systempart(Control2; MyNotes)
            {
            }
            systempart(Control1; Links)
            {
            }
        }
    }

    actions
    {
    }
}

