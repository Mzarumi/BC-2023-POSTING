page 52186702 "Electoral Rejected List"
{
    CardPageID = "Electoral Zones Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Electoral Zones";
    SourceTableView = WHERE(Status = CONST(Rejected));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    Editable = false;
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field(County; Rec.County)
                {
                }
                field("Sub-County"; Rec."Sub-County")
                {
                }
                field("Sub-County Name"; Rec."Sub-County Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Mileage; Rec.Mileage)
                {
                }
                field("Date Entered"; Rec."Date Entered")
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

