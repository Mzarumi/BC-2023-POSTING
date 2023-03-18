page 52186361 "Agent Tariff Header"
{
    CardPageID = "Agent Tariff Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Agent Tarriff Header";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Charge Excise Duty"; Rec."Charge Excise Duty")
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
            }
        }
    }

    actions
    {
    }
}

