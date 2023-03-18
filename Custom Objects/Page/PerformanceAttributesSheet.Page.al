page 52186098 "Performance Attributes Sheet"
{
    PageType = List;
    SourceTable = "Performance Attributes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                }
                field(Attribute; Rec.Attribute)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Target; Rec.Target)
                {
                }
                field(Weight; Rec.Weight)
                {
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                }
            }
        }
    }

    actions
    {
    }
}

