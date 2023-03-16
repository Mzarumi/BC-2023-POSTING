page 52186352 "Movement Tracker List"
{
    PageType = List;
    SourceTable = "Movement Tracker";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Approval Type"; Rec."Approval Type")
                {
                }
                field(Stage; Rec.Stage)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Current Location"; Rec."Current Location")
                {
                }
                field("Date/Time In"; Rec."Date/Time In")
                {
                }
                field("Date/Time Out"; Rec."Date/Time Out")
                {
                }
                field("USER ID"; Rec."USER ID")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Station; Rec.Station)
                {
                }
            }
        }
    }

    actions
    {
    }
}

