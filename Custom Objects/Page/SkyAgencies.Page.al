page 52185457 "Sky Agencies"
{
    CardPageID = "Sky Agencies Page";
    PageType = List;
    SourceTable = "Sky Agency Companies";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Location; Rec.Location)
                {
                }
            }
        }
    }

    actions
    {
    }
}

