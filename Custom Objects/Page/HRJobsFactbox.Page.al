page 52185513 "HR Jobs Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Jobs";

    layout
    {
        area(content)
        {
            field("Job ID"; Rec."Job ID")
            {
            }
            field("Job Description"; Rec."Job Description")
            {
            }
            field("No of Posts"; Rec."No of Posts")
            {
            }
            field("Position Reporting to"; Rec."Position Reporting to")
            {
            }
            field("Occupied Positions"; Rec."Occupied Positions")
            {
            }
            field("Vacant Positions"; Rec."Vacant Positions")
            {
            }
            field(Category; Rec.Category)
            {
            }
            field(Grade; Rec.Grade)
            {
            }
            field("Employee Requisitions"; Rec."Employee Requisitions")
            {
            }
            field("Supervisor Name"; Rec."Supervisor Name")
            {
            }
            field(Status; Rec.Status)
            {
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
            }
            field("Date Created"; Rec."Date Created")
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.Validate(Rec."Vacant Positions");
    end;
}

