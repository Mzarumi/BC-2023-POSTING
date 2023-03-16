page 52186028 "Contract Lines Type"
{
    PageType = List;
    SourceTable = "Contract Lines Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract Line Code"; Rec."Contract Line Code")
                {
                }
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Contract Cycle"; Rec."Contract Cycle")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Contract &Cycle")
            {
                RunObject = Page "Contract Cycle Stage";
                RunPageLink = "Contract Line Type" = FIELD("Contract Line Type");
            }
        }
    }
}

