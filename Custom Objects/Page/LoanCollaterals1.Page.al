page 52185772 "Loan Collaterals1"
{
    PageType = List;
    SourceTable = "Loan Collateral";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Client Code"; Rec."Client Code")
                {
                }
                field("Collateral Registration"; Rec."Collateral Registration")
                {
                }
                field("Collateral Type"; Rec."Collateral Type")
                {
                }
                field("Collateral Total Value"; Rec."Collateral Total Value")
                {
                }
                field("Collateral Multiplier"; Rec."Collateral Multiplier")
                {
                    Editable = false;
                }
                field("Collateral Value"; Rec."Collateral Value")
                {
                }
            }
        }
    }

    actions
    {
    }
}

