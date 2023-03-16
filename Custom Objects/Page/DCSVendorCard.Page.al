page 52186444 "DCS Vendor Card"
{
    PageType = List;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

