page 52186121 "Approved Surety Management"
{
    CardPageID = "ApprovedSurety Management Card";
    PageType = List;
    SourceTable = "Surety Management";
    SourceTableView = WHERE(Status = FILTER(Approved));

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
        area(creation)
        {
            action("Surety Letter Issue")
            {
                Caption = 'Surety Letter Issue';

                trigger OnAction()
                begin
                    Member.Reset;
                    Member.SetRange(Member."No.", Rec."Member Account No");
                    if Member.Find('-') then
                        Member."Surety Letter Issued" := true;
                    Member.Modify;
                    Rec."Stopped USER ID" := UserId;
                    Rec."Stopped Date" := Today;
                    Rec."Stopped Time" := Time;
                end;
            }
        }
    }

    var
        Member: Record Members;
}

