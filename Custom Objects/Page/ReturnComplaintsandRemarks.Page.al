page 52186676 "Return Complaints and Remarks"
{
    CardPageID = "Complains and Remarks Page";
    Editable = false;
    PageType = List;
    SourceTable = "Complain and Remarks";
    SourceTableView = WHERE(Type = CONST("Complains and Remarks"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complaint Catagory"; Rec."Complaint Catagory")
                {
                }
                field(Complain; Rec.Complain)
                {
                }
                field(Suggestion; Rec.Suggestion)
                {
                }
            }
        }
    }

    actions
    {
    }
}

