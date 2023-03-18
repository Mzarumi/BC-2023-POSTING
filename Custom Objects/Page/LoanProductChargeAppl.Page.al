page 52186410 "Loan Product Charge Appl."
{
    PageType = List;
    SourceTable = "Loan Product Charge Appl.";

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
                field("Use Percentage"; Rec."Use Percentage")
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
                field("Charges G_L Account"; Rec."Charges G_L Account")
                {
                }
                field(Minimum; Rec.Minimum)
                {
                }
                field(Maximum; Rec.Maximum)
                {
                }
                field("Additional Conditional Charge"; Rec."Additional Conditional Charge")
                {
                }
            }
        }
    }

    actions
    {
    }
}

