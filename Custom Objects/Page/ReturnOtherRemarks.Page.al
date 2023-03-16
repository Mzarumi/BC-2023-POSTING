page 52186677 "Return Other Remarks"
{
    CardPageID = "Complains and Remarks Page";
    Editable = false;
    PageType = List;
    SourceTable = "Complain and Remarks";
    SourceTableView = WHERE(Type = CONST("Other Remarks"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Proposed Resolutions"; Rec."Proposed Resolutions")
                {
                }
            }
        }
    }

    actions
    {
    }
}

