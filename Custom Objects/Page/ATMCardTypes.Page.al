page 52185863 "ATM Card Types"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "ATM Card Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Application Charge Code"; Rec."Application Charge Code")
                {
                }
                field("Replacement Charge Code"; Rec."Replacement Charge Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

