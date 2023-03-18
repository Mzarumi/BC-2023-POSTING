page 52186074 "Project Partners"
{
    PageType = List;
    SourceTable = "Project Partners";

    layout
    {
        area(content)
        {
            repeater(Control8)
            {
                ShowCaption = false;
                field(PartnerID; Rec.PartnerID)
                {
                }
                field("Partner Name"; Rec."Partner Name")
                {
                }
                field("Contractor Type"; Rec."Contractor Type")
                {
                }
                field("Partner Budget"; Rec."Partner Budget")
                {
                    Editable = false;
                }
                field("Disbursed Amount (LCY)"; Rec."Disbursed Amount (LCY)")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Accounted Amount"; Rec."Accounted Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

