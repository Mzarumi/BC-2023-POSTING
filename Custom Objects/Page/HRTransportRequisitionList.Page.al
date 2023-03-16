page 52186466 "HR Transport Requisition List"
{
    CardPageID = "HR Staff Transport Requisition";
    PageType = List;
    SourceTable = "HR Transport Requisition Head";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Departure Date"; Rec."Departure Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field(From; Rec.From)
                {
                }
                field(Destination; Rec.Destination)
                {
                }
                field(Status; Rec.Status)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
        }
    }

    actions
    {
    }
}

