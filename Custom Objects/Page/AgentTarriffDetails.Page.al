page 52185698 "Agent Tarriff Details"
{
    PageType = List;
    SourceTable = "Agent Tariff Details";

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
                field("Agent Comm"; Rec."Agent Comm")
                {
                }
                field("Vendor Comm"; Rec."Vendor Comm")
                {
                }
                field("Sacco Comm"; Rec."Sacco Comm")
                {
                }
                field("Charge Excise Duty"; Rec."Charge Excise Duty")
                {
                }
            }
        }
    }

    actions
    {
    }
}

