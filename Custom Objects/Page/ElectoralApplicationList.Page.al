page 52186700 "Electoral Application List"
{
    CardPageID = "Electoral Zones Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Electoral Zones";
    SourceTableView = WHERE(Status = FILTER(Open | Pending));

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
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field(County; Rec.County)
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

