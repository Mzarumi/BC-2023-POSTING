page 52186507 "HR Succession Gaps"
{
    PageType = ListPart;
    SourceTable = "HR Employee Qualification Gaps";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                }
                field(Qualification; Rec.Qualification)
                {
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                }
            }
        }
    }

    actions
    {
    }
}

