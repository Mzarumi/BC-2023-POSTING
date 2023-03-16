page 52185797 "Tiered Charges Lines"
{
    PageType = ListPart;
    SourceTable = "Tiered Charges Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                }
                field("Use Percentage"; Rec."Use Percentage")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Band Active"; Rec."Band Active")
                {
                }
            }
        }
    }

    actions
    {
    }
}

