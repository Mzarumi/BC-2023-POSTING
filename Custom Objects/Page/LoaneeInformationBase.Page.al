page 52186127 "Loanee Information Base"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Loanee Infomation Base";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loanee Status"; Rec."Loanee Status")
                {
                }
                field(Info; Rec.Info)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

