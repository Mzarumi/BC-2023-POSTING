page 52186661 "BBF Entitlement SetUp"
{
    PageType = List;
    SourceTable = "BBF Entitlement SetUp";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BBF Code"; Rec."BBF Code")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Member Amount"; Rec."Member Amount")
                {
                }
                field("Sacco Amount"; Rec."Sacco Amount")
                {
                }
                field("Sacco G/L"; Rec."Sacco G/L")
                {
                }
                field("Sacco G/L Name"; Rec."Sacco G/L Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

