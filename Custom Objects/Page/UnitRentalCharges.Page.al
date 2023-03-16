page 52186216 "Unit Rental Charges"
{
    PageType = List;
    SourceTable = "Unit Setup Charges";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Charge Code"; Rec."Charge Code")
                {
                }
                field("Property Code"; Rec."Property Code")
                {
                }
                field("Floor No"; Rec."Floor No")
                {
                }
                field("Unit Code"; Rec."Unit Code")
                {
                }
                field("Minimum Area Sq.ft"; Rec."Minimum Area Sq.ft")
                {
                }
                field("Rental Rate"; Rec."Rental Rate")
                {
                }
            }
        }
    }

    actions
    {
    }
}

