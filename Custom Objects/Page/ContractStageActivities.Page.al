page 52186025 "Contract Stage Activities"
{
    PageType = List;
    SourceTable = "Contract Stage Activities";

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
                field(Stage; Rec.Stage)
                {
                }
            }
        }
    }

    actions
    {
    }
}

