page 52185757 "Loan Charges"
{
    PageType = List;
    SourceTable = "Loan Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Charge Code"; Rec."Charge Code")
                {
                }
                field("Charge Description"; Rec."Charge Description")
                {
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                }
                field("Charge Method"; Rec."Charge Method")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field("Charge Type"; Rec."Charge Type")
                {
                }
                field("Charging Option"; Rec."Charging Option")
                {
                }
            }
        }
    }

    actions
    {
    }
}

