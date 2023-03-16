page 52185685 "Bond Security List"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Bond Security";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bond No."; Rec."Bond No.")
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                }
                field("Security Details"; Rec."Security Details")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field(Value; Rec.Value)
                {
                }
                field("Guarantee Value"; Rec."Guarantee Value")
                {
                }
            }
        }
    }

    actions
    {
    }
}

