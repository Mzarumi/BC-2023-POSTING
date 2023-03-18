page 52186245 "Common Area Charges"
{
    PageType = List;
    SourceTable = "Common Area Charges";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                }
                field("Meter Rent"; Rec."Meter Rent")
                {
                }
                field("C/Area Fixed Charge"; Rec."C/Area Fixed Charge")
                {
                }
                field("B/Hole Average Sewer Charge"; Rec."B/Hole Average Sewer Charge")
                {
                }
            }
        }
    }

    actions
    {
    }
}

