page 52186710 "Allowed Allowances Part"
{
    PageType = ListPart;
    SourceTable = "Allowed Allowances";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting Type Code"; Rec."Meeting Type Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Allowance Type"; Rec."Allowance Type")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Tax %"; Rec."Tax %")
                {
                }
            }
        }
    }

    actions
    {
    }
}

