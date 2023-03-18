page 52186325 "Delegate Tariffs"
{
    PageType = List;
    SourceTable = "Delegates Tariff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Payment Frequency"; Rec."Payment Frequency")
                {
                }
                field(CalculationMethod; Rec.CalculationMethod)
                {
                }
                field("Rate Per KM"; Rec."Rate Per KM")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Maximum No Paid"; Rec."Maximum No Paid")
                {
                }
            }
        }
    }

    actions
    {
    }
}

