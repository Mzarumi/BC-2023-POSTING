page 52186548 "HR Professional Body Lines"
{
    PageType = ListPart;
    SourceTable = "HR Professional Bodies Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

