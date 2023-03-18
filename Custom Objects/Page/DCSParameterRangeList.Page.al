page 52186452 "DCS Parameter Range List"
{
    PageType = List;
    SourceTable = "DCS Parameter Range";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RangeID; Rec.RangeID)
                {
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                }
                field("Range MIN"; Rec."Range MIN")
                {
                }
                field("Range MAX"; Rec."Range MAX")
                {
                }
                field("Evaluation Method"; Rec."Evaluation Method")
                {
                }
                field("Evaluation Factor"; Rec."Evaluation Factor")
                {
                }
            }
        }
    }

    actions
    {
    }
}

