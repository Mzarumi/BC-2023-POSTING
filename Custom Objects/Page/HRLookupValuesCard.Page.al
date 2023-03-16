page 52185594 "HR Lookup Values Card"
{
    PageType = Card;
    SourceTable = "HR Lookup Values";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Type; Rec.Type)
                {
                }
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Text19024457: Label 'Months';
}

