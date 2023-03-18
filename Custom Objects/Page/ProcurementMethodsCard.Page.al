page 52186158 "Procurement Methods Card"
{
    PageType = Card;
    SourceTable = "Procurement Methods";

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
                field(Description; Rec.Description)
                {
                }
            }
            part(Control2; "Procurement Methods Sub Page")
            {
                SubPageLink = "Procurement Method" = FIELD(Code);
            }
            systempart(Control1; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}

