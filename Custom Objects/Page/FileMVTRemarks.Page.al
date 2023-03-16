page 52186385 "File MVT Remarks"
{
    CardPageID = "File Mvt Remarks Card";
    PageType = List;
    SourceTable = "File Movement Remarks";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

