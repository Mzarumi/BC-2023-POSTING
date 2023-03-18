page 52186434 "BDE Management List"
{
    CardPageID = "BDE Management Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "BDE Management Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Entered Date"; Rec."Entered Date")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

