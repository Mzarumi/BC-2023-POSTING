page 52186194 "Charges Card"
{
    PageType = Card;
    SourceTable = Charges;

    layout
    {
        area(content)
        {
            group(Control1102755000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field(Vatable; Rec.Vatable)
                {
                }
                field("VAT Code"; Rec."VAT Code")
                {
                }
                field("Charge Once"; Rec."Charge Once")
                {
                }
                field("IsService Charge"; Rec."IsService Charge")
                {
                }
                field("VAT Account"; Rec."VAT Account")
                {
                }
                field("Uses Rates"; Rec."Uses Rates")
                {
                }
            }
        }
    }

    actions
    {
    }
}

