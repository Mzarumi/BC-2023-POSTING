page 52186051 "Overtime Claim Lines"
{
    PageType = ListPart;
    SourceTable = "Overtime Claim Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field("Work Description/Reason"; Rec."Work Description/Reason")
                {
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                }
                field("Time From"; Rec."Time From")
                {
                }
                field("Time To"; Rec."Time To")
                {
                }
                field("No. of Hours"; Rec."No. of Hours")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

