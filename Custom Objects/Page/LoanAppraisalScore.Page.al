page 52185775 "Loan Appraisal Score"
{
    PageType = List;
    SourceTable = "Loan Application Credit Score";
    SourceTableView = SORTING(Priority);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product Code"; Rec."Product Code")
                {
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                }
                field(Score; Rec.Score)
                {
                }
                field("Calculated Success"; Rec."Calculated Success")
                {
                }
                field("Calculated Failure"; Rec."Calculated Failure")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    Visible = false;
                }
                field("Qualifying Amount"; Rec."Qualifying Amount")
                {
                }
                field(RequestTime; Rec.RequestTime)
                {
                }
                field("General Output"; Rec."General Output")
                {
                }
            }
        }
    }

    actions
    {
    }
}

