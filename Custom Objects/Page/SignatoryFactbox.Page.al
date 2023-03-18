page 52186066 "Signatory Factbox"
{
    PageType = List;
    SourceTable = "Account Signatories";

    layout
    {
        area(content)
        {
            repeater(Control6)
            {
                ShowCaption = false;
                field("ID Number"; Rec."ID Number")
                {
                }
                field(Signatory; Rec.Signatory)
                {
                }
                field("Must Sign"; Rec."Must Sign")
                {
                }
                field("Must be Present"; Rec."Must be Present")
                {
                }
            }
        }
    }

    actions
    {
    }
}

