page 52186421 "Loan Purpose"
{
    PageType = List;
    SourceTable = "Loan Purpose";

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
            }
        }
    }

    actions
    {
    }
}

