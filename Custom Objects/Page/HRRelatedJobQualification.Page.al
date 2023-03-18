page 52186635 "HR Related Job Qualification"
{
    PageType = List;
    SourceTable = "HR Job Related Requirements";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification ID"; Rec."Qualification ID")
                {
                    Editable = false;
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    Editable = false;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                }
                field(Relevant; Rec.Relevant)
                {
                }
            }
        }
    }

    actions
    {
    }
}

