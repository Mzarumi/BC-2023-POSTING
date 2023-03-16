page 52186651 "Performance Attributes"
{
    PageType = List;
    SourceTable = "Performance Attributes1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Additonal Comments"; Rec."Additonal Comments")
                {
                }
            }
        }
    }

    actions
    {
    }
}

