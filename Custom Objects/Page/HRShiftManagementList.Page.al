page 52186613 "HR Shift Management List"
{
    CardPageID = "HR Shift Management Card";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Shift Management";

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
                field("Start Date/Time"; Rec."Start Date/Time")
                {
                }
                field("End Date/Time"; Rec."End Date/Time")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Shift Type"; Rec."Shift Type")
                {
                }
                field("Shift Pattern"; Rec."Shift Pattern")
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

