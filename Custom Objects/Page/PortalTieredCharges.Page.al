page 52186682 "Portal Tiered Charges"
{
    PageType = ListPart;
    SourceTable = "Portal Tiered Charges";

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
                field("External Vendor Charge"; Rec."External Vendor Charge")
                {
                }
                field("Mobile Vendor Charge"; Rec."Mobile Vendor Charge")
                {
                }
            }
        }
    }

    actions
    {
    }
}

