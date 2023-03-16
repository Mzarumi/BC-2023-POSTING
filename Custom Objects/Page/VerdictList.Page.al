page 52186102 "Verdict List"
{
    CardPageID = "Verdict Card";
    PageType = List;
    SourceTable = Verdict;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No"; Rec."Case No")
                {
                    Editable = false;
                }
                field(No; Rec.No)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Date; Rec.Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

