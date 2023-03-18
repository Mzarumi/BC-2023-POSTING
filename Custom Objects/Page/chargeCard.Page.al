page 52186230 "charge Card"
{
    PageType = Card;
    SourceTable = Charges;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Vatable; Rec.Vatable)
                {
                }
                field("VAT Code"; Rec."VAT Code")
                {
                }
                field("VAT Percentage(%)"; Rec."VAT Percentage(%)")
                {
                    Editable = false;
                }
                field("VAT Account"; Rec."VAT Account")
                {
                }
                field("Uses Rates"; Rec."Uses Rates")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Direct Post"; Rec."Direct Post")
                {
                }
                field("Charge Once"; Rec."Charge Once")
                {
                }
                field("IsService Charge"; Rec."IsService Charge")
                {
                }
                field("Legal Fees"; Rec."Legal Fees")
                {
                }
            }
        }
    }

    actions
    {
    }
}

