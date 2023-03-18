page 52185679 "SMS Series"
{
    PageType = List;
    SourceTable = "SMS Series";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Message Body"; Rec."Message Body")
                {
                }
                field("Email Body"; Rec."Email Body")
                {
                }
            }
        }
    }

    actions
    {
    }
}

