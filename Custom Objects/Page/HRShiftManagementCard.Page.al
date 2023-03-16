page 52186614 "HR Shift Management Card"
{
    PageType = Card;
    SourceTable = "HR Shift Management";

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
                field("Shift Type"; Rec."Shift Type")
                {
                }
                field("Shift Pattern"; Rec."Shift Pattern")
                {
                }
                field("Start Date/Time"; Rec."Start Date/Time")
                {
                }
                field("End Date/Time"; Rec."End Date/Time")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Assigned Employees"; Rec."Assigned Employees")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
            }
            systempart(Control13; Notes)
            {
            }
        }
    }

    actions
    {
    }
}

