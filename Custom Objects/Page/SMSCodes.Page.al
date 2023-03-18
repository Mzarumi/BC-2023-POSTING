page 52185682 "SMS Codes"
{
    PageType = List;
    SourceTable = "SMS Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table ID"; Rec."Table ID")
                {
                }
                field("Table Name"; Rec."Table Name")
                {
                }
                field("Field ID"; Rec."Field ID")
                {
                }
                field("Field Name"; Rec."Field Name")
                {
                }
                field("Code"; Rec.Code)
                {
                }
            }
        }
    }

    actions
    {
    }
}

