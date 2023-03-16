page 52186359 "Email Update Requests"
{
    PageType = List;
    SourceTable = "Email Update Requests";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

