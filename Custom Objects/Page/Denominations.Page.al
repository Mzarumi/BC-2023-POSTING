page 52185800 Denominations
{
    PageType = List;
    SourceTable = Denominations;

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
                field(Value; Rec.Value)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Priority; Rec.Priority)
                {
                }
            }
        }
    }

    actions
    {
    }
}

