
page 52186159 "Procurement Methods List"
{
    CardPageID = "Procurement Methods Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Methods";

    layout
    {
        area(content)
        {
            repeater(Control3)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
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

