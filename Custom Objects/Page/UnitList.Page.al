page 52186193 "Unit List"
{
    Editable = true;
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
                    Caption = 'Unit Name';
                }
                field("Unit Status"; Rec."Unit Status")
                {
                }
                field("Area Square ft"; Rec."Area Square ft")
                {
                }
                field("Meter No."; Rec."Meter No.")
                {
                    Caption = 'Water Meter No.';
                }
                field("Unit Type"; Rec."Unit Type")
                {
                }
                field("Unit Type Name"; Rec."Unit Type Name")
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

