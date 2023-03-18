page 52185697 "Agent Tarriff Header"
{
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
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Trans Type Agents"; Rec."Trans Type Agents")
                {
                }
            }
        }
    }

    actions
    {
    }
}

