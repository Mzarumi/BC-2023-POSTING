page 52186195 "Charges List"
{
    CardPageID = "Charges Card";
    Editable = false;
    PageType = List;
    SourceTable = Charges;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
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
                field("Uses Rates"; Rec."Uses Rates")
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
                    Caption = 'VAT %';
                }
                field("IsService Charge"; Rec."IsService Charge")
                {
                }
                field("VAT Account"; Rec."VAT Account")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

