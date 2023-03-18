page 52185707 EDMS
{
    PageType = List;
    SourceTable = EDMS;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key"; Rec.Key)
                {
                }
                field("url path"; Rec."url path")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Notes)
            {
            }
            systempart(Control8; Links)
            {
            }
        }
    }

    actions
    {
    }
}

