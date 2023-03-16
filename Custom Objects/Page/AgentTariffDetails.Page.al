page 52186363 "Agent Tariff Details"
{
    PageType = ListPart;
    SourceTable = "Agent Tariff Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Lower Limit"; Rec."Lower Limit")
                {
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                }
                field("Sacco Comm"; Rec."Sacco Comm")
                {
                }
                field("Agent Comm"; Rec."Agent Comm")
                {
                }
                field("Vendor Comm"; Rec."Vendor Comm")
                {
                }
                field("SMS Charge"; Rec."SMS Charge")
                {
                }
            }
        }
    }

    actions
    {
    }
}

