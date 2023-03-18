page 52186075 "Maintain Machne/Vehicles"
{
    PageType = List;
    SourceTable = "Maintain Machne/Vehicles";

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
                field(No; Rec.No)
                {
                }
            }
        }
    }

    actions
    {
    }
}

