page 52186535 "HR Company Target Line"
{
    PageType = List;
    SourceTable = "HR Company Target Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                }
                field("Appraisal No"; Rec."Appraisal No")
                {
                }
                field("Perspective Code"; Rec."Perspective Code")
                {
                }
                field("Perspective Description"; Rec."Perspective Description")
                {
                }
                field("Targeted Score"; Rec."Targeted Score")
                {
                }
                field("Perspective type"; Rec."Perspective type")
                {
                }
                field("Achieved Score"; Rec."Achieved Score")
                {
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                }
            }
        }
    }

    actions
    {
    }
}

