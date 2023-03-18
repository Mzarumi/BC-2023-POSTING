page 52186617 "HR Shift Schedule Header Card"
{
    PageType = Document;
    SourceTable = "HR Shift Schedule Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Shift Code"; Rec."Shift Code")
                {
                }
                field("Assigned Employees"; Rec."Assigned Employees")
                {
                }
            }
            part(Control6; "HR Shift Schedule Lines")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

