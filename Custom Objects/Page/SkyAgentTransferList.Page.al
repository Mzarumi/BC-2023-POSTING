page 52185464 "Sky Agent Transfer List"
{
    CardPageID = "Agent Transfer Page";
    PageType = List;
    SourceTable = "Sky Agent Transfer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction ID"; Rec."Transaction ID")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Agent Name"; Rec."Agent Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Rejected; Rec.Rejected)
                {
                }
                field("Rejected By"; Rec."Rejected By")
                {
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
    }

    var
        //SkyAgencyBanking: Codeunit "Sky Agency Banking";
}

