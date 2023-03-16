page 52186436 "BDE Management Lines"
{
    PageType = ListPart;
    SourceTable = "BDE Management Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Pruduct Name"; Rec."Pruduct Name")
                {
                }
                field("Individual Target"; Rec."Individual Target")
                {
                }
                field("Group Target"; Rec."Group Target")
                {
                }
                field("No. Sold"; Rec."No. Sold")
                {
                }
                field(Disbursed; Rec.Disbursed)
                {
                }
                field("Pending Sact"; Rec."Pending Sact")
                {
                }
            }
        }
    }

    actions
    {
    }
}

