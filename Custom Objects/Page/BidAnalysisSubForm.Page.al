page 52186049 "Bid Analysis SubForm"
{
    PageType = ListPart;
    SourceTable = "Bid Analysis";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Quote No."; Rec."Quote No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

