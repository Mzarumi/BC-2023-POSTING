page 52186031 "Contract Cycle"
{
    PageType = List;
    SourceTable = "Contract Cycle";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Cycles; Rec.Cycles)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Estimated Value (LCY)"; Rec."Estimated Value (LCY)")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Contract Cycle Stages")
            {
                RunObject = Page "Contract Cycle Stage List";
            }
        }
    }
}

