page 52186362 "Agent Tariff Card"
{
    PageType = Card;
    SourceTable = "Agent Tarriff Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Transaction Type"; Rec."Trans Type Agents")
                {
                }
                field("Daily Limit"; Rec."Daily Limit")
                {
                }
                field("Weekly Limit"; Rec."Weekly Limit")
                {
                }
                field("Monthly Limit"; Rec."Monthly Limit")
                {
                }
                field("Yearly Limit"; Rec."Yearly Limit")
                {
                }
                field("Transaction Limit"; Rec."Transaction Limit")
                {
                }
                field("Charge Excise Duty"; Rec."Charge Excise Duty")
                {
                }
                field("Sacco Comm Acc"; Rec."Sacco Comm Acc")
                {
                }
                field("Vendor Comm Acc"; Rec."Vendor Comm Acc")
                {
                }
                field("SMS Acc"; Rec."SMS Acc")
                {
                }
                field("Charge Acc"; Rec."Charge Acc")
                {
                }
                field(Tiered; Rec.Tiered)
                {
                }
            }
            part(Control7; "Agent Tariff Details")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

