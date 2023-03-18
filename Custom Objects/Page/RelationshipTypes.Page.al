page 52185718 "Relationship Types"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Relationship Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                }
                field("Min. Age"; Rec."Min. Age")
                {
                }
                field("Max. Age"; Rec."Max. Age")
                {
                }
                field("Max. Allowed"; Rec."Max. Allowed")
                {
                }
                field("Principal Child"; Rec."Principal Child")
                {
                }
            }
        }
    }

    actions
    {
    }
}

