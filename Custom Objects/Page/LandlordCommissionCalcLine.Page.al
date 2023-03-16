page 52186206 "Landlord Commission Calc  Line"
{
    Editable = true;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Landlord Commision Calc Lines";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Tenant No."; Rec."Tenant No.")
                {
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

