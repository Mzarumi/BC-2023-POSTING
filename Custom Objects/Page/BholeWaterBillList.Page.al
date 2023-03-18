page 52186239 "B/hole Water Bill List"
{
    Caption = 'Water Batch Invoice List';
    CardPageID = "B/Hole Water Bill";
    PageType = List;
    SourceTable = "B/Hole Water Bill";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field("Zone Code"; Rec."Zone Code")
                {
                }
                field("Zone Description"; Rec."Zone Description")
                {
                }
                field("Meter Reading Date"; Rec."Meter Reading Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

