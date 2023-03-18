page 52186119 "Surety Management List"
{
    CardPageID = "Surety Management Card";
    PageType = List;
    SourceTable = "Surety Management";
    SourceTableView = WHERE(Status = FILTER(<> Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Surety No"; Rec."Surety No")
                {
                }
                field("Type Of Account"; Rec."Type Of Account")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Refference No"; Rec."Refference No")
                {
                }
                field("Refference Details"; Rec."Refference Details")
                {
                }
                field(Date; Rec.Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

