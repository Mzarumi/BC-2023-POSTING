page 52185482 "Record Link View"
{
    PageType = List;
    SourceTable = "Record Link";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Link ID"; Rec."Link ID")
                {
                }
                // field("FORMAT(""Record ID"")"; Rec.Format("Record ID"))
                // {
                //     Caption = 'ID';
                // }
                // field(URL1; Rec.URL1)
                // {
                // }
                // field(URL2; Rec.URL2)
                // {
                // }
                // field(URL3; Rec.URL3)
                // {
                // }
                // field(URL4; Rec.URL4)
                // {
                // }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Note; Rec.Note)
                {
                }
                field(Created; Rec.Created)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field(Company; Rec.Company)
                {
                }
                field(Notify; Rec.Notify)
                {
                }
                field("To User ID"; Rec."To User ID")
                {
                }
            }
        }
    }

    actions
    {
    }
}

