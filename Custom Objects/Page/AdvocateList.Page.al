page 52186099 "Advocate List"
{
    CardPageID = "Advocate Card";
    PageType = List;
    SourceTable = Advocate;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Firm No"; Rec."Firm No")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Type of Firm"; Rec."Type of Firm")
                {
                }
            }
        }
    }

    actions
    {
    }
}

