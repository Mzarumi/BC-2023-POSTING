page 52186327 "Delegates Payment Line List"
{
    PageType = ListPart;
    SourceTable = "Delegate Payment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Delegate MNO."; Rec."Delegate MNO.")
                {
                }
                field("Delegate Name"; Rec."Delegate Name")
                {
                }
                field("Tariff Code"; Rec."Tariff Code")
                {
                }
                field("Amount Payable"; Rec."Amount Payable")
                {
                    Editable = false;
                }
                field(Position; Rec.Position)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

