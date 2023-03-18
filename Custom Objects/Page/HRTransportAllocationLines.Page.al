page 52186461 "HR Transport Allocation Lines"
{
    PageType = ListPart;
    SourceTable = "HR Transport Allocation Lines";
    SourceTableView = SORTING("Allocation No", "Requisition No");

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Requisition No"; Rec."Requisition No")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                    Editable = false;
                }
                field("Passenger's Full Name"; Rec."Passenger's Full Name")
                {
                    Editable = false;
                }
                field(From; Rec.From)
                {
                    Editable = false;
                }
                field(Destination; Rec.Destination)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

