page 52186087 "HR Driver List"
{
    PageType = List;
    SourceTable = "HR Drivers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
                field("Driver License Number"; Rec."Driver License Number")
                {
                }
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                }
                field("Renewal Interval"; Rec."Renewal Interval")
                {
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                }
                field("Year Of Experience"; Rec."Year Of Experience")
                {
                }
                field(Grade; Rec.Grade)
                {
                }
                field(Active; Rec.Active)
                {
                }
            }
        }
    }

    actions
    {
    }
}

