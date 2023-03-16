page 52185830 "Tiered Charges Header"
{
    PageType = Card;
    SourceTable = "Tiered Charges Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
            group(Control6)
            {
                ShowCaption = false;
                part(Control5; "Tiered Charges Lines")
                {
                    SubPageLink = Code = FIELD(Code);
                }
            }
        }
    }

    actions
    {
    }
}

