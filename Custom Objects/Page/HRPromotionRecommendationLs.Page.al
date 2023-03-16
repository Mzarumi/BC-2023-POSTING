page 52186513 "HR Promotion Recommendation Ls"
{
    PageType = ListPart;
    SourceTable = "HR Promo. Recommend Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    Visible = false;
                }
                field("Employee Abilities"; Rec."Employee Abilities")
                {
                }
                field(Experience; Rec.Experience)
                {
                }
            }
        }
    }

    actions
    {
    }
}

