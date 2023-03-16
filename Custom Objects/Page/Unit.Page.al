page 52186185 Unit
{
    PageType = List;
    SourceTable = Unit;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Unit Code"; Rec."Unit Code")
                {
                }
                field("Unit Name"; Rec."Unit Name")
                {
                }
                field("Unit Type"; Rec."Unit Type")
                {
                }
                field("Unit Type Name"; Rec."Unit Type Name")
                {
                    Editable = false;
                }
                field("Meter No."; Rec."Meter No.")
                {
                }
                field("Unit Sub Type"; Rec."Unit Sub Type")
                {
                }
                field("Unit Sub Type Name"; Rec."Unit Sub Type Name")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

