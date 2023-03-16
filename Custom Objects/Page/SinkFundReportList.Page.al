page 52186129 "SinkFund Report List"
{
    //CardPageID = "SinkFund Notice";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "SinkFund Report Information";
    SourceTableView = WHERE("Insurance Payment Status" = FILTER(<> "Beneficiary Claim Paid"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Reported By Name"; Rec."Reported By Name")
                {
                }
                field("Reported By ID No"; Rec."Reported By ID No")
                {
                }
                field("Reported By Relationship"; Rec."Reported By Relationship")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Date of Death"; Rec."Date of Death")
                {
                }
                field("Claim Option"; Rec."Claim Option")
                {
                }
                field("Deceased Person"; Rec."Deceased Person")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

