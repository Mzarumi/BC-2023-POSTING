page 52185758 "Loan Product Charges"
{
    PageType = List;
    SourceTable = "Loan Product Charges";

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
                field("Use Percentage"; Rec."Use Percentage")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field("Effect Excise Duty"; Rec."Effect Excise Duty")
                {
                    Editable = true;
                }
                field("Charge Type"; Rec."Charge Type")
                {
                }
                field("Charging Option"; Rec."Charging Option")
                {
                }
                field("Charges G_L Account"; Rec."Charges G_L Account")
                {
                }
                field(Minimum; Rec.Minimum)
                {
                }
                field(Maximum; Rec.Maximum)
                {
                }
                field("Additional Charge %"; Rec."Additional Charge %")
                {
                }
                field(Prorate; Rec.Prorate)
                {
                }
                field("Staggered Charge Code"; Rec."Staggered Charge Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

